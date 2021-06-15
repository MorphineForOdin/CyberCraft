using Microsoft.AspNetCore.Mvc;

using System.Collections.Generic;

using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Services;
using TechMarket.API.Models.Users;

namespace TechMarket.API.Controllers
{
    [ApiController]
    [Route("api/users")]
    public class UsersController : ControllerBase
    {
        private readonly UsersService _usersService;

        public UsersController(UsersService usersService)
        {
            this._usersService = usersService;
        }

        [HttpGet]
        public IActionResult Get()
        {
            IEnumerable<User> users = this._usersService.GetAll();
            return base.Ok(new GetUsersResponse { Users = users });
        }
    }
}