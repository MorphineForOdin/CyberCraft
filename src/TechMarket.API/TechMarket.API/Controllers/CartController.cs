using Microsoft.AspNetCore.Mvc;

using TechMarket.API.Models.Cart;

namespace TechMarket.API.Controllers
{
    [ApiController]
    [Route("api/cart")]
    public class CartController : ControllerBase
    {
        private readonly CartService _cartService;

        public CartController(CartService cartService)
        {
            this._cartService = cartService;
        }

        [HttpPost]
        public IActionResult Post([FromBody] PostCartRequest request)
        {
            bool insertResult = this._cartService.Insert(request.UserId, request.ProductId, request.Quantity);
            if (!insertResult)
            {
                return base.UnprocessableEntity(new ProblemDetails { Detail = "" });
            }

            return base.NoContent();
        }

        [HttpPut]
        public IActionResult Put([FromBody] PutCartRequest request)
        {
            bool putResult = this._cartService.Put(request.UserId, request.ProductId, request.Quantity);
            if (!putResult)
            {
                return base.UnprocessableEntity(new ProblemDetails { Detail = "" });
            }

            return base.NoContent();
        }

        [HttpDelete]
        public IActionResult Delete([FromBody] DeleteCartRequest request)
        {
            bool putResult = this._cartService.Delete(request.UserId, request.ProductId);
            if (!putResult)
            {
                return base.UnprocessableEntity(new ProblemDetails { Detail = "" });
            }

            return base.NoContent();
        }
    }
}