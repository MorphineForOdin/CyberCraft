using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

using System.Collections.Generic;

using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Services;
using TechMarket.API.Models.Users;

namespace TechMarket.API.Controllers
{
    [Authorize]
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
        public IActionResult Get([FromQuery] int skip = 0, [FromQuery] int take = 10)
        {
            IEnumerable<User> users = this._usersService.GetAll(skip, take);
            return base.Ok(new GetUsersResponse { Users = users });
        }

        [HttpGet("{id:int}")]
        public IActionResult GetById([FromRoute] int id)
        {
            if (id <= 0)
                return base.BadRequest(new ProblemDetails { Detail = "Not valid user id." });

            User user = this._usersService.GetById(id);
            if (user == null)
                return base.NotFound(new ProblemDetails { Detail = "User was not found." });

            return base.Ok(new GetUserResponse { User = user });
        }
    }
}