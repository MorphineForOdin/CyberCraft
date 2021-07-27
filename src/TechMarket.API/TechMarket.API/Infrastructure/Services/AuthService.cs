using Microsoft.IdentityModel.Tokens;

using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

using TechMarket.API.Infrastructure.Domain;
using TechMarket.API.Infrastructure.Settings;

namespace TechMarket.API.Infrastructure.Services
{
    public class AuthService
    {
        private readonly AuthSettings _settings;

        public AuthService(AuthSettings settings)
        {
            this._settings = settings;
        }

        public string GenerateJwtToken(User user)
        {
            DateTime expiresDate = DateTime.Now.AddMinutes(this._settings.ExpiresInMinutes);

            IEnumerable<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.Sid, user.Id.ToString(), ClaimValueTypes.Integer),
                new Claim(ClaimTypes.Email, user.Email, ClaimValueTypes.String),
                new Claim(ClaimTypes.Name, user.FullName, ClaimValueTypes.String),
                new Claim(ClaimTypes.Role, user.RoleId.ToString(), ClaimValueTypes.Integer),
                new Claim(ClaimTypes.Expiration, expiresDate.ToString(), ClaimValueTypes.DateTime)
            };

            var token = new JwtSecurityToken(
                issuer: this._settings.Issuer,
                claims: claims,
                expires: expiresDate,
                signingCredentials: new SigningCredentials(
                    key: new SymmetricSecurityKey(Encoding.UTF8.GetBytes(this._settings.Key)),
                    algorithm: SecurityAlgorithms.HmacSha256));

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}