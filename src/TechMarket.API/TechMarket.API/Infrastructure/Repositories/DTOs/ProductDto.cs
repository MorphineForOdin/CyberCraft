﻿using System.Data.SqlClient;

using TechMarket.API.Infrastructure.Domain;

namespace TechMarket.API.Infrastructure.Repositories.DTOs
{
    public class ProductDto
    {
        public int Id { get; set; }
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }

        public static ProductDto MapFrom(SqlDataReader reader)
        {
            return new ProductDto
            {
                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                CategoryId = reader.GetInt32(reader.GetOrdinal("CategoryId")),
                Name = reader.GetString(reader.GetOrdinal("Name")),
                Description = reader.GetString(reader.GetOrdinal("Name")),
                Price = reader.GetDecimal(reader.GetOrdinal("Price"))
            };
        }
        public Product ToDomainModel()
        {
            return new Product
            {
                Id = this.Id,
                CategoryId = this.CategoryId,
                Name = this.Name,
                Description = this.Description,
                Price = this.Price
            };
        }
    }

}  