namespace TechMarket.API.Infrastructure.Repositories.Settings
{
    public class TechMarketDbSettings : ITechMarketDbSettings
    {
        public string ConnectionString { get; set; }
    }
}