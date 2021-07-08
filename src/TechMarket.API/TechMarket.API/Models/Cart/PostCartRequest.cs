using System.ComponentModel.DataAnnotations;

namespace TechMarket.API.Models.Cart
{
    public class PostCartRequest
    {
        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter a user id bigger than {1}")]
        public int UserId { get; set; }

        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter a product id bigger than {1}")]
        public int ProductId { get; set; }

        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter a quantity bigger than {1}")]
        public int Quantity { get; set; }
    }
}