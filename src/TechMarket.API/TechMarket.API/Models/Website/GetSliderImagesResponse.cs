using System.Collections.Generic;
using System.Linq;

using TechMarket.API.Infrastructure.Domain;

namespace TechMarket.API.Models.Website
{
    public class GetSliderImagesResponse
    {
        public IEnumerable<SliderImage> SliderImages { get; set; }

        public GetSliderImagesResponse()
        {
            this.SliderImages = Enumerable.Empty<SliderImage>();
        }
    }
}