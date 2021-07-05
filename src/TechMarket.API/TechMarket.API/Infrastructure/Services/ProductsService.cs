using System.Collections.Generic;

using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Repositories;

namespace TechMarket.API.Infrastructure.Services
{
    public class ProductsService
    {
        private readonly ProductsRepository _productsRepository;

        public ProductsService(ProductsRepository productsRepository)
        {
            this._productsRepository = productsRepository;
        }

        public IEnumerable<Product> Get(int skip, int take)
        {
            return this._productsRepository.Get(skip, take);
        }

        public Product GetById(int id)
        {
            var product = this._productsRepository.GetById(id);
            return product;
        }
    }
}