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
        public IActionResult Get([FromQuery] int skip, [FromQuery] int take)
        {
            IEnumerable<User> users = this._usersService.GetAll(skip,take);
            return base.Ok(new GetUsersResponse { Users = users });
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
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