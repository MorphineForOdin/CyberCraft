using TechMarket.API.Infrastructure.Repositories;

namespace TechMarket.API
{
    public class CartService
    {
        private readonly CartRepository _cartRepository;

        public CartService(CartRepository cartRepository)
        {
            this._cartRepository = cartRepository;
        }

        public bool Insert(int userId, int productId, int quantity)
        {
            return this._cartRepository.Insert(userId, productId, quantity);
        }
        public bool Put(int userId, int productId, int quantity)
        {
            return this._cartRepository.Put(userId, productId, quantity);
        }

        public bool Delete(int userId, int productId)
        {
            return this._cartRepository.Delete(userId, productId);
        }
    }
}