﻿using Microsoft.AspNetCore.Mvc;

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
                return base.UnprocessableEntity(new ProblemDetails { Detail = "Fail to insert product" });
            }

            return base.NoContent();
        }

        [HttpPut]
        public IActionResult Update([FromBody] UpdateCartRequest request)
        {
            bool updateResult = this._cartService.Update(request.UserId, request.ProductId, request.Quantity);
            if (!updateResult)
            {
                return base.UnprocessableEntity(new ProblemDetails { Detail = "Fail to update product" });
            }

            return base.NoContent();
        }

        [HttpDelete]
        public IActionResult Delete([FromBody] DeleteCartRequest request)
        {
            bool deleteResult = this._cartService.Delete(request.UserId, request.ProductId);
            if (!deleteResult)
            {
                return base.UnprocessableEntity(new ProblemDetails { Detail = "Fail to delete product" });
            }

            return base.NoContent();
        }
    }
}