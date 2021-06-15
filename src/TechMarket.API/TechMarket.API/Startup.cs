using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

using TechMarket.API.Infrastructure.Common;
using TechMarket.API.Infrastructure.Repositories;
using TechMarket.API.Infrastructure.Services;

namespace TechMarket.API
{
    public class Startup
    {
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _environment;

        public Startup(IConfiguration configuration, IWebHostEnvironment environment)
            => (this._configuration, this._environment) = (configuration, environment);

        public void ConfigureServices(IServiceCollection services)
            => services
                .Apply(this.RegisterDI)
                .AddControllers();

        public void Configure(IApplicationBuilder appBuilder, IWebHostEnvironment hostEnvironment)
            => appBuilder
                .Switch(
                    predicate: _ => hostEnvironment.IsDevelopment(),
                    success: app => app.UseDeveloperExceptionPage(),
                    failure: app => app.UseHsts())
                .UseHttpsRedirection()
                .UseRouting()
                .UseEndpoints(endpoints => endpoints.MapControllers());

        private IServiceCollection RegisterDI(IServiceCollection services)
            => services
                .AddSingleton(_ => this._configuration)
                .AddScoped<UsersRepository>()
                .AddScoped<UsersService>();
    }
}