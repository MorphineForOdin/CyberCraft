using System.Collections.Generic;

using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Repositories;

namespace TechMarket.API.Infrastructure.Services
{
    public class UsersService
    {
        private readonly UsersRepository _usersRepository;

        public UsersService(UsersRepository usersRepository)
        {
            this._usersRepository = usersRepository;
        }

        public IEnumerable<User> GetAll()
        {
            return this._usersRepository.GetAll();
        }

        public User GetById(int id)
        {
            return this._usersRepository.GetById(id);
        }
    }
}