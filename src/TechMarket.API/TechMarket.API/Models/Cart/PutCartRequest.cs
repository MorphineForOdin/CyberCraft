using System.ComponentModel.DataAnnotations;

namespace TechMarket.API.Models.Cart
{
    public class PutCartRequest
    {
        [Required]
        public int UserId { get; set; }

        [Required]
        public int ProductId { get; set; }

        [Required]
        public int Quantity { get; set; }
    }
}