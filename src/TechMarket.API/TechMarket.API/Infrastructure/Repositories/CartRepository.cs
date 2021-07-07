using System;
using System.Data;
using System.Data.SqlClient;

using TechMarket.API.Infrastructure.Repositories.Settings;

namespace TechMarket.API.Infrastructure.Repositories
{
    public class CartRepository
    {
        private readonly ITechMarketDbSettings _settings;

        public CartRepository(ITechMarketDbSettings settings)
        {
            this._settings = settings;
        }

        public bool Insert(int userId, int productId, int quantity)
        {
            try
            {
                using (var connection = new SqlConnection(this._settings.ConnectionString))
                using (var command = new SqlCommand("spCart_InsertProduct", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;
                    command.Parameters.Add("@ProductId", SqlDbType.Int).Value = productId;
                    command.Parameters.Add("@Quantity", SqlDbType.Int).Value = quantity;

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Put(int userId, int productId, int quantity)
        {
            try
            {
                using (var connection = new SqlConnection(this._settings.ConnectionString))
                using (var command = new SqlCommand("spCart_UpdateProduct", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;
                    command.Parameters.Add("@ProductId", SqlDbType.Int).Value = productId;
                    command.Parameters.Add("@Quantity", SqlDbType.Int).Value = quantity;

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Delete(int userId, int productId)
        {
            try
            {
                using (var connection = new SqlConnection(this._settings.ConnectionString))
                using (var command = new SqlCommand("spCart_DeleteProduct", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;
                    command.Parameters.Add("@ProductId", SqlDbType.Int).Value = productId;

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}