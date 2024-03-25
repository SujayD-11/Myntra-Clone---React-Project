using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using MyntraAPIs.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Text;

namespace MyntraAPIs.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginAdminController : ControllerBase
    {
        private IConfiguration _config;

        private readonly MyntraDbContext _context;

        public LoginAdminController(MyntraDbContext context, IConfiguration configuration)
        {
            _context = context;
            _config = configuration;
        }


        private Customer AuthenticateUser(Admin user)
        {
            List<Admin> users = _context.Admins.ToList();
            Customer _user = null;

            foreach (var item in users)
            {
                if (String.Equals(user.Username, item.Username) && String.Equals(user.Password, item.Password))
                {
                    _user = new Models.Customer { Email = item.Username };
                }
            }

            return _user;
        }

        private string GenerateToken(Admin user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(_config["Jwt:Issuer"], _config["Jwt:Audience"], null,
                expires: DateTime.Now.AddMinutes(1),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login(Admin user)
        {
            IActionResult response = Unauthorized();
            var user_ = AuthenticateUser(user);
            if (user_ != null)
            {
                var token = GenerateToken(user);
                response = Ok(new { token = token });
            }
            return response;
        }
    }
}