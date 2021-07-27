namespace TechMarket.API.Infrastructure.Domain
{
    public class User
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName => $"{this.FirstName} {this.LastName}";
        public int RoleId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    }
}