using System.Collections.Generic;

using Microsoft.AspNetCore.Mvc;

using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Services;
using TechMarket.API.Models.Website;

namespace TechMarket.API.Controllers
{
    [ApiController]
    [Route("api/website")]
    public class WebsiteController : ControllerBase
    {
        private readonly WebsiteService _websiteService;

        public WebsiteController(WebsiteService websiteService)
        {
            this._websiteService = websiteService;
        }

        [HttpGet("sliders")]
        public IActionResult Get()
        {
            IEnumerable<SliderImage> images = this._websiteService.GetAll();
            return base.Ok(new GetSliderImagesResponse { SliderImages = images });
        }
    }
}