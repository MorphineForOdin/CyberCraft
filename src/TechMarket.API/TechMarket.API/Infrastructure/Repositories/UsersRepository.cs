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
        private const string ConnectionString = @"Data Source=DESKTOP-QFEHGCL; Initial Catalog = TechMarket; Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        public IEnumerable<User> GetAll(int skip, int take)
        {
            try
            {
                var dtos = new List<UserDto>();
                using (var connection = new SqlConnection(ConnectionString))
                using (var command = new SqlCommand("dbo.spUsers_Get", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@Skip", SqlDbType.Int).Value = skip;
                    command.Parameters.Add("@Take", SqlDbType.Int).Value = take;

                    connection.Open();
                    using SqlDataReader reader = command.ExecuteReader();
                    while (reader.HasRows && reader.Read())
                        dtos.Add(UserDto.MapFrom(reader));
                }

                return dtos.Select(dto => dto.ToDomainModel());
            }
            catch (Exception)
            {
                return Enumerable.Empty<User>();
            }
        }

        public User GetById(int id)
        {
            try
            {
                using (var connection = new SqlConnection(ConnectionString))
                using (var command = new SqlCommand("spUsers_GetById", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@UserId", SqlDbType.Int).Value = id;

                    connection.Open();
                    using SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows && reader.Read())
                        return UserDto.MapFrom(reader).ToDomainModel();
                }
                return null;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}