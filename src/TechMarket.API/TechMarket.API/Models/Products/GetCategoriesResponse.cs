using System.Collections.Generic;
using System.Linq;

using TechMarket.API.Infrastructure.Domain;

namespace TechMarket.API.Models.Products
{
    public class GetCategoriesResponse
    {
        public IEnumerable<Category> Categories { get; set; }

        public GetCategoriesResponse()
        {
            this.Categories = Enumerable.Empty<Category>();
        }
    }
}