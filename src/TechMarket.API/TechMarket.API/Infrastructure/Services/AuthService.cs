namespace TechMarket.API.Infrastructure.Services
{
    public class AuthService
    {
        private readonly UsersService _usersService;

        public AuthService(UsersService usersService)
        {
            this._usersService = usersService;
        }

        public object GenerateJwtToken(string email)
        {
            var user = this._usersService.GetByEmail(email);
            return user;
        }
    }
}