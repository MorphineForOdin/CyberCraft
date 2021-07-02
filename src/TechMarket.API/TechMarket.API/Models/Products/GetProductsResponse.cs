using System.Collections.Generic;
using System.Linq;

using TechMarket.API.Infrastructure.Domain;

namespace TechMarket.API.Models.Products
{
    public class GetProductsResponse
    {
        public IEnumerable<Product> Products { get; set; }

        public GetProductsResponse()
        {
            this.Products = Enumerable.Empty<Product>();
        }

    }

    public class GetCategoriesResponse
    {
        public IEnumerable<Category> Categories { get; set; }

    public GetCategoriesResponse()
    {
        this.Categories = Enumerable.Empty<Category>();
    }
}
}