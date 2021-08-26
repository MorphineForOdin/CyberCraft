using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Repositories.DTOs;
using TechMarket.API.Infrastructure.Repositories.Settings;

namespace TechMarket.API.Infrastructure.Repositories
{
    public class ProductsRepository
    {
        private readonly ITechMarketDbSettings _settings;

        public ProductsRepository(ITechMarketDbSettings settings)
        {
            this._settings = settings;
        }

        public IEnumerable<Product> Get(int skip, int take, int? categoryId)
        {
            try
            {
                var dtos = new List<ProductDto>();
                using (var connection = new SqlConnection(this._settings.ConnectionString))
                using (var command = new SqlCommand("dbo.spProducts_Get_20210825", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@Skip", SqlDbType.Int).Value = skip;
                    command.Parameters.Add("@Take", SqlDbType.Int).Value = take;
                    command.Parameters.Add("@CategoryId", SqlDbType.Int).Value = categoryId;

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
                var attributes = new List<ProductAttributeValueDto>();
                using (var connection = new SqlConnection(this._settings.ConnectionString))
                using (var command = new SqlCommand("dbo.spProducts_GetById_20210825", connection))
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
                            attributes.Add(ProductAttributeValueDto.MapFrom(reader));

                    product.Attributes = attributes.GroupBy(
                        keySelector: attribute => attribute.Id,
                        resultSelector: (id, attributes) => new ProductAttribute
                        {
                            Id = id,
                            Name = attributes.First().Name,
                            Values = attributes.Select(a => new IdValuePair
                            {
                                Id = a.ValueId,
                                Value = a.Value
                            })
                        });
                }

                return product;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public IEnumerable<Category> GetCategories()
        {
            try
            {
                var dtos = new List<CategoryDto>();
                using (var connection = new SqlConnection(this._settings.ConnectionString))
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