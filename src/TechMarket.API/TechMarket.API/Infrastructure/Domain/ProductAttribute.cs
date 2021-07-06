using System.Collections.Generic;

namespace TechMarket.API.Infrastructure.Domain
{
    public class ProductAttribute
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public IEnumerable<IdValuePair> Values { get; set; }
    }
}