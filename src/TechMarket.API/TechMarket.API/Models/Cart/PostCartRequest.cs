using System.ComponentModel.DataAnnotations;

namespace TechMarket.API.Models.Cart
{
    public class PostCartRequest
    {
        [Required]
        public int UserId { get; set; }

        [Required]
        public int ProductId { get; set; }

        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int Quantity { get; set; }
    }
}