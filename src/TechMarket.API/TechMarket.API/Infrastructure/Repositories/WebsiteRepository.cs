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
    public class WebsiteRepository
    {
        private readonly ITechMarketDbSettings _settings;

        public WebsiteRepository(ITechMarketDbSettings settings)
        {
            this._settings = settings;
        }

        public IEnumerable<SliderImage> GetSliderImages()
        {
            try
            {
                var dtos = new List<SliderImageDto>();
                using (var connection = new SqlConnection(this._settings.ConnectionString))
                using (var command = new SqlCommand("web.spWebsite_GetSliderImages", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();
                    using SqlDataReader reader = command.ExecuteReader();
                    while (reader.HasRows && reader.Read())
                        dtos.Add(SliderImageDto.MapFrom(reader));
                }
                return dtos.Select(dto => dto.ToDomainModel());
            }
            catch (Exception)
            {
                return Enumerable.Empty<SliderImage>();
            }
        }
    }
}