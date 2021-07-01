using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Services;
using TechMarket.API.Models.Products;

namespace TechMarket.API.Controllers
{
    [ApiController]
    [Route("api/products")]
    public class ProductsController : ControllerBase
    {
        private readonly ProductsService _productsService;

        public ProductsController(ProductsService productsService)
        {
            this._productsService = productsService;
        }

        [HttpGet]
        public IActionResult Get([FromQuery] int skip, [FromQuery] int take)
        {
            IEnumerable<Product> products = this._productsService.Get(skip, take);
            return base.Ok(new GetProductsResponse { Products = products });
        }
               
    }
}