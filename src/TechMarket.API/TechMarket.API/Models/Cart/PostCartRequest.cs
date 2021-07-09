using System.ComponentModel.DataAnnotations;

namespace TechMarket.API.Models.Cart
{
    public class PostCartRequest
    {
        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "User id should be greater than {1}.")]
        public int UserId { get; set; }

        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "Product id should be greater than {1}.")]
        public int ProductId { get; set; }

        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "Product quantity should be greater than {1}.")]
        public int Quantity { get; set; }
    }
}