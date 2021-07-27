using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Services;
using TechMarket.API.Models.Auth;

namespace TechMarket.API.Controllers
{
    [AllowAnonymous]
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly AuthService _authService;
        private readonly UsersService _usersService;

        public AuthController(AuthService authService, UsersService usersService)
        {
            this._authService = authService;
            this._usersService = usersService;
        }

        [HttpPost("login")]
        public IActionResult Post([FromBody] PostLoginRequest request)
        {
            User user = this._usersService.GetByEmail(request.Email);
            if (user == null || user.Password != request.Password)
                return base.UnprocessableEntity(new ProblemDetails { Detail = "Failed to authenticate user." });

            string token = this._authService.GenerateJwtToken(user);
            if (string.IsNullOrWhiteSpace(token))
                return base.UnprocessableEntity(new ProblemDetails { Detail = "Failed to authenticate user." });

            return base.Ok(new PostLoginResponse
            {
                Token = token
            });
        }
    }
}