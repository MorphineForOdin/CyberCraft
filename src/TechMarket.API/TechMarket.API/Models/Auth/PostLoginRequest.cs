using System.ComponentModel.DataAnnotations;

namespace TechMarket.API.Models.Auth
{
    public class PostLoginRequest
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [MinLength(7)]
        public string Password { get; set; }
    }
}