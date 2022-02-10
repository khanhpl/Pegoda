using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Api.Entities;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging.Abstractions;
using Microsoft.IdentityModel.Tokens;

namespace quiz_app_dotnet_api.Helper
{
    public interface IJwtHelper
    {
        string generateJwtToken(Customer customer);
    }
    public class JwtHelper : IJwtHelper
    {
        private readonly IConfiguration _config;

        public JwtHelper(IConfiguration config)
        {
            _config = config;
        }

        public string generateJwtToken(Customer customer)
        {
            // security key
            string securityKey = _config["JWT:Secret"];

            // symmetric security key
            var symmetricSecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(securityKey));

            // signing credentials
            var signingCredentials = new SigningCredentials(symmetricSecurityKey, SecurityAlgorithms.HmacSha256Signature);

            var claim = new[]{
                new Claim("Id", customer.Id.ToString()),
                new Claim("Email", customer.Email),
                // new Claim("Role", user.Role == null ? "" : user.Role)
            };

            // create token
            var token = new JwtSecurityToken(
                issuer: _config["JWT:Issuer"],
                audience: _config["JWT:Audience"],
                notBefore: DateTime.Now,
                expires: DateTime.Now.AddHours(1),
                signingCredentials: signingCredentials,
                claims: claim
            );

            // return token
            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}