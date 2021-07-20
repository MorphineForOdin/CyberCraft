using System.Data.SqlClient;

using TechMarket.API.Infrastructure.Domain;

namespace TechMarket.API.Infrastructure.Repositories.DTOs
{
    internal class SliderImageDto
    {
        public int Id { get; set; }
        public string ImageUrl { get; set; }
        public string LinkUrl { get; set; }

        public static SliderImageDto MapFrom(SqlDataReader reader)
        {
            return new SliderImageDto
            {
                Id = reader.GetInt32(reader.GetOrdinal(nameof(Id))),
                ImageUrl = reader.GetString(reader.GetOrdinal(nameof(ImageUrl))),
                LinkUrl = reader.IsDBNull(reader.GetOrdinal(nameof(LinkUrl)))
                    ? null
                    : reader.GetString(reader.GetOrdinal(nameof(LinkUrl)))
            };
        }

        public SliderImage ToDomainModel()
        {
            return new SliderImage
            {
                Id = this.Id,
                ImageUrl = this.ImageUrl,
                LinkUrl = this.LinkUrl
            };
        }
    }
}