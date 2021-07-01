using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Repositories.DTOs;

namespace TechMarket.API.Infrastructure.Repositories
{
    public class UsersRepository
    {
        private const string ConnectionString = @"Data Source=DESKTOP-QFEHGCL;Initial Catalog=Ecommerce;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        public IEnumerable<User> GetAll()
        {
            return new List<User>
            {
                new User { FirstName = "Sviatoslav", LastName = "Malinovskyi" },
                new User { FirstName = "Yurii", LastName = "Borys" },
                new User { FirstName = "Vasyl", LastName = "Sviastyn" }
            };
        }
    


    public User GetById(int id)
    {

            try
            {

                var dtos = new List<UserDto>();
                using (var connection = new SqlConnection(ConnectionString))
                using (var command = new SqlCommand("spUsers_GetUserById", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@id", SqlDbType.Int).Value = id;


                    connection.Open();
                    using SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows && reader.Read())
                        dtos.Add(UserDto.MapFrom(reader));
                }


                return (User)dtos.Select(dto => dto.ToDomainModel());
            }

            catch (Exception)
            {
                return null;
            }
           
        }
        
}
}
