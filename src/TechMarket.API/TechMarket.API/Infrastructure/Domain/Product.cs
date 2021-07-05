using System.Collections.Generic;

namespace TechMarket.API.Infrastructure.Domain
{
    public class Product
    {
        public int Id { get; set; }
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public decimal Price { get; set; }
        public IEnumerable<ProductAttribute> Attributes { get; set; }
    }
}