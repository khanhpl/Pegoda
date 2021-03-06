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
        string generateJwtToken(User user, Role role, Guid centerId, Guid id);
    }
    public class JwtHelper : IJwtHelper
    {
        private readonly IConfiguration _config;

        public JwtHelper(IConfiguration config)
        {
            _config = config;
        }

        public string generateJwtToken(User user, Role role, Guid centerId, Guid id)
        {
            // security key
            string securityKey = _config["JWT:Key"];

            // symmetric security key
            var symmetricSecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(securityKey));

            // signing credentials
            var signingCredentials = new SigningCredentials(symmetricSecurityKey, SecurityAlgorithms.HmacSha256Signature);

            var claim = new[]{
                new Claim("IdUser", user.Id.ToString()),
                new Claim("Id", id.ToString()),
                new Claim("Email", user.Email),
                new Claim("FullName", user.Name),
                new Claim("centerId", centerId == Guid.Empty ? "" : centerId.ToString()),
                new Claim("Role", role.Name)
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