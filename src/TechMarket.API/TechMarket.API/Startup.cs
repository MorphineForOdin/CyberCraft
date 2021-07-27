using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;

using System;
using System.Text;

using TechMarket.API.Infrastructure.Common;
using TechMarket.API.Infrastructure.Repositories;
using TechMarket.API.Infrastructure.Repositories.Settings;
using TechMarket.API.Infrastructure.Services;
using TechMarket.API.Infrastructure.Settings;

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
                .Apply(this.ConfigureCORS)
                .Apply(this.ConfigureAuthentication)
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
                .UseCors()
                .UseAuthentication()
                .UseAuthorization()
                .UseEndpoints(endpoints => endpoints.MapControllers());

        private IServiceCollection ConfigureCORS(IServiceCollection services)
            => services
            .AddCors(options => options
            .AddDefaultPolicy(corsPolicyBuilder => corsPolicyBuilder
                .SetIsOriginAllowed(_ => true)
                .AllowAnyMethod()
                .AllowAnyHeader()
                .AllowCredentials()
                .WithExposedHeaders("Content-Disposition")));

        private IServiceCollection ConfigureAuthentication(IServiceCollection services)
            => services
                .AddAuthentication(options =>
                {
                    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                })
                .AddJwtBearer(options => options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidIssuer = this._configuration.GetValue<string>("AuthSettings:Issuer"),
                    ValidateAudience = false,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(this._configuration.GetValue<string>("AuthSettings:Key"))),
                    ClockSkew = TimeSpan.Zero
                })
                .Bind(services);

        private IServiceCollection RegisterDI(IServiceCollection services)
            => services
                .AddSingleton(_ => this._configuration)
                .AddSingleton<ITechMarketDbSettings>(new TechMarketDbSettings { ConnectionString = this._configuration.GetConnectionString("TechMarketDB") })
                .AddSingleton<AuthSettings>(serviceProvider => this._configuration.GetSection("AuthSettings").Get<AuthSettings>())
                .AddScoped<UsersRepository>()
                .AddScoped<ProductsRepository>()
                .AddScoped<WebsiteRepository>()
                .AddScoped<CartRepository>()
                .AddScoped<UsersService>()
                .AddScoped<AuthService>()
                .AddScoped<ProductsService>()
                .AddScoped<WebsiteService>()
                .AddScoped<CartService>();
    }
}