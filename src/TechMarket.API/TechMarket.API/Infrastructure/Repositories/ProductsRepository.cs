using System;
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
        private const string ConnectionString = @"Data Source=DESKTOP-0NEUQ3G;Initial Catalog=TechMarket;User ID=sa;Password=3001;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

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

        public Product GetById(int id)
        {
            try
            {
                Product product = null;
                var attributes = new List<ProductAttributeValue>();
                using (var connection = new SqlConnection(ConnectionString))
                using (var command = new SqlCommand("dbo.spProduct_GetById", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@Id", SqlDbType.Int).Value = id;

                    connection.Open();
                    using SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows && reader.Read())
                        product = ProductDto.MapFrom(reader).ToDomainModel();

                    if (product == null) return null;

                    if (reader.NextResult())
                        while (reader.HasRows && reader.Read())
                            attributes.Add(ProductAttributeValueDto.MapFrom(reader).ToDomainModel());

                    product.Attributes = attributes;
                }

                return product;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}