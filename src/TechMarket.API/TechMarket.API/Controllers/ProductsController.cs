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
        public IActionResult Get([FromQuery] int skip = 0, [FromQuery] int take = 12)
        {
            IEnumerable<Product> products = this._productsService.Get(skip, take);
            return base.Ok(new GetProductsResponse { Products = products });
        }

        [HttpGet("{id:int}")]
        public IActionResult GetById([FromRoute] int id)
        {
            if (id <= 0)
                return base.BadRequest(new ProblemDetails { Detail = "Not valid product id." });

            Product product = this._productsService.GetById(id);
            if (product == null)
                return base.NotFound(new ProblemDetails { Detail = "Product not found." });

            return base.Ok(new GetProductResponse { Product = product });
        }

        [HttpGet("categories")]
        public IActionResult Get()
        {
            IEnumerable<Category> categories = this._productsService.GetCategories();
            return base.Ok(new GetCategoriesResponse { Categories = categories });
        }
    }
}
