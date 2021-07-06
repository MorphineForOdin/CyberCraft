using System.Data.SqlClient;

using TechMarket.API.Infrastructure.Domain;

namespace TechMarket.API.Infrastructure.Repositories.DTOs
{
    public class CategoryDto
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public int? ParentId { get; set; }

        public static CategoryDto MapFrom(SqlDataReader reader)
        {
            return new CategoryDto
            {
                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                Name = reader.GetString(reader.GetOrdinal("Name")),
                ParentId = reader.IsDBNull(reader.GetOrdinal("ParentId")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("ParentId"))
            };
        }

        public Category ToDomainModel()
        {
            return new Category
            {
                Id = this.Id,
                Name = this.Name,
                ParentId = this.ParentId,
            };
        }
    }
}