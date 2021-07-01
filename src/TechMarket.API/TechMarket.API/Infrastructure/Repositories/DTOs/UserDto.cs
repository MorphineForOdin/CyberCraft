using System.Data.SqlClient;
using TechMarket.API.Infrastructure.Domain;

namespace TechMarket.API.Infrastructure.Repositories.DTOs
{
    public class UserDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int RoleId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public static UserDto MapFrom(SqlDataReader reader)
        {
            return new UserDto
            {
                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                FirstName = reader.GetString(reader.GetOrdinal("FirstName")),
                LastName = reader.GetString(reader.GetOrdinal("LastName")),
                RoleId = reader.GetInt32(reader.GetOrdinal("RoleId")),
                Email = reader.GetString(reader.GetOrdinal("Email")),
                Password = reader.GetString(reader.GetOrdinal("Password"))
            };
        }

        public User ToDomainModel()
            => new User
            {
                Id = this.Id,
                FirstName = this.FirstName,
                LastName = this.LastName,
                RoleId = this.RoleId,
                Email = this.Email,
                Password = this.Password
            };
    }
}