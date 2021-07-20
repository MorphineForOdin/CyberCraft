using System.Collections.Generic;

using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Repositories;

namespace TechMarket.API.Infrastructure.Services
{
    public class WebsiteService
    {
        private readonly WebsiteRepository _websiteRepository;

        public WebsiteService(WebsiteRepository websiteRepository)
        {
            this._websiteRepository = websiteRepository;
        }

        public IEnumerable<SliderImage> GetAll()
        {
            return this._websiteRepository.GetSliderImages();
        }
    }
}