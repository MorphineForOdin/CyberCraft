using System.Data.SqlClient;

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
    }
}