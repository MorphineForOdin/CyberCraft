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
        public IActionResult Get([FromQuery] int skip = 0, [FromQuery] int take = 25)
        {
            IEnumerable<Product> products = this._productsService.Get(skip, take);
            return base.Ok(new GetProductsResponse { Products = products });
        }

        [HttpGet("{Id:int}")]
        public IActionResult GetById([FromQuery] int id)
        {
            //todo Validation
            if (id <= 0)
                return base.BadRequest(new ProblemDetails { Detail = "Not valid product id." });

            var product = this._productsService.GetById(id);

            return base.Ok(product);
        }
    }
}