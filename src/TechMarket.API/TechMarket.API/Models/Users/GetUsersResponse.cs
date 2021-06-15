using System.Collections.Generic;
using System.Linq;

using TechMarket.API.Infrastructure.Domain;

namespace TechMarket.API.Models.Users
{
    public class GetUsersResponse
    {
        public IEnumerable<User> Users { get; set; }

        public GetUsersResponse()
        {
            this.Users = Enumerable.Empty<User>();
        }
    }
}