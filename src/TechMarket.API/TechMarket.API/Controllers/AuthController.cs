using Microsoft.AspNetCore.Mvc;

using TechMarket.API.Infrastructure.Services;
using TechMarket.API.Models.Auth;

[ApiController]
[Route("api/auth")]
public class AuthController : ControllerBase
{
    private readonly AuthService _authService;

    public AuthController(AuthService authService)
    {
        this._authService = authService;
    }

    [HttpPost("login")]
    public IActionResult Login([FromBody] LoginRequest request)
    {
        var token = this._authService.GenerateJwtToken(request.Email);
        return base.Ok(token);
    }
}