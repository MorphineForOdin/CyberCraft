using System.Data.SqlClient;

using TechMarket.API.Infrastructure.Domain;

namespace TechMarket.API.Infrastructure.Repositories.DTOs
{
    public class ProductAttributeValueDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int ValueId { get; set; }
        public string Value { get; set; }

        public static ProductAttributeValueDto MapFrom(SqlDataReader reader)
        {
            return new ProductAttributeValueDto
            {
                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                Name = reader.GetString(reader.GetOrdinal("Name")),
                ValueId = reader.GetInt32(reader.GetOrdinal("ValueId")),
                Value = reader.GetString(reader.GetOrdinal("Value"))
            };
        }

        public ProductAttributeValue ToDomainModel()
        {
            return new ProductAttributeValue
            {
                Id = this.Id,
                Name = this.Name,
                Value = this.Value,
                ValueId = this.ValueId
            };
        }
    }
}