using System;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;
using Api.Models;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class UserController : BaseApiController
    {
        private readonly UserService _service;
        public UserController(UserService service)
        {
            _service = service;
        }

        [Route("Register")]
        [HttpPost]
        [SwaggerOperation(Summary = "Register new user")]
        public async Task<ActionResult> Register(ResponseUserModal newUser)
        {
            User user = new User
            {
                Name = newUser.Name,
                Email = newUser.Email,
                Address = newUser.Address,
                Image = newUser.Image,
                RoleId = newUser.RoleId
            };
            await _service.Create(user);
            return CreatedAtAction(nameof(GetByUserName), new { userName = newUser.Name }, newUser);
        }

        [HttpGet("{username}")]
        [SwaggerOperation(Summary = "Get information user by username")]
        public ActionResult GetByUserName(string username)
        {
            User response = _service.GetByUserName(username);
            if (response == null)
            {
                return NotFound();
            }
            ResponseUserModal user = new ResponseUserModal
            {
                Name = response.Name,
                Email = response.Email,
                Address = response.Address,
                Image = response.Image,
                RoleId = response.RoleId
            };
            return Ok(user);
        }
        [Route("Login")]
        [HttpPost]
        public ActionResult Login(LoginModel loginModel)
        {
            var response = _service.Login(loginModel);
            if (response == null)
            {
                return BadRequest(new { message = "User name or password not correct" });
            }
            return Ok(new { token = response });
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete user by Id")]
        public async Task<ActionResult> Delete(Guid id)
        {
            bool check = await _service.Delete(id);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update user")]
        public async Task<ActionResult> Update(Guid id, UpdateUserModal updateUser)
        {
            if (id != updateUser.Id)
            {
                return BadRequest();
            }

            User user = new User
            {
                Id = updateUser.Id,
                Name = updateUser.Name,
                Email = updateUser.Email,
                Address = updateUser.Address,
                Image = updateUser.Image,
                RoleId = updateUser.RoleId
            };
            bool check = await _service.Update(user);
            if (!check)
            {
                return BadRequest();
            }
            return NoContent();
        }
    }
}
