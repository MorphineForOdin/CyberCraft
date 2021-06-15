using System.Collections.Generic;

using TechMarket.API.Infrastructure.Domain;

namespace TechMarket.API.Infrastructure.Repositories
{
    public class UsersRepository
    {
        public IEnumerable<User> GetAll()
        {
            return new List<User>
            {
                new User { FirstName = "Sviatoslav", LastName = "Malinovskyi" },
                new User { FirstName = "Yurii", LastName = "Borys" },
                new User { FirstName = "Vasyl", LastName = "Sviastyn" }
            };
        }
    }
}