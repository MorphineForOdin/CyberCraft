namespace TechMarket.API.Infrastructure.Settings
{
    public class AuthSettings
    {
        public string Issuer { get; set; }
        public string Key { get; set; }
        public int ExpiresInMinutes { get; set; }
    }
}