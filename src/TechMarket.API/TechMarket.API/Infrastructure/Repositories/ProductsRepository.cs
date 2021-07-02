﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Repositories.DTOs;

namespace TechMarket.API.Infrastructure.Repositories
{
    public class ProductsRepository
    {
        private const string ConnectionString = @"Data Source=DESKTOP-QFEHGCL; Initial Catalog = TechMarket; Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        public IEnumerable<Product> Get(int skip, int take)
        {
            try
            {
                var dtos = new List<ProductDto>();
                using (var connection = new SqlConnection(ConnectionString))
                using (var command = new SqlCommand("dbo.spProducts_Get", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@Skip", SqlDbType.Int).Value = skip;
                    command.Parameters.Add("@Take", SqlDbType.Int).Value = take;

                    connection.Open();
                    using SqlDataReader reader = command.ExecuteReader();
                    while (reader.HasRows && reader.Read())
                        dtos.Add(ProductDto.MapFrom(reader));
                }

                return dtos.Select(dto => dto.ToDomainModel());
            }
            catch (Exception)
            {
                return Enumerable.Empty<Product>();
            }
        }

        public IEnumerable<Category> GetCategories()
        {
            try
            {
                var dtos = new List<CategoryDto>();
                using (var connection = new SqlConnection(ConnectionString))
                using (var command = new SqlCommand("dbo.spProducts_GetCategoriesAll", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();
                    using SqlDataReader reader = command.ExecuteReader();
                    while (reader.HasRows && reader.Read())
                        dtos.Add(CategoryDto.MapFrom(reader));
                }

                return dtos.Select(dto => dto.ToDomainModel());
            }
            catch (Exception)
            {
                return Enumerable.Empty<Category>();
            }
        }
    }
}