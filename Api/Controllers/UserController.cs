using System;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;
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
                Address = newUser.Address,
                Image = newUser.Image,
                Email = newUser.Email,
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
                Address = response.Address,
                Image = response.Image,
                Email = response.Email,
                RoleId = response.RoleId
            };
            return Ok(user);
        }
        //[Route("Login")]
        //[HttpPost]
        //public ActionResult Login(LoginModal loginModal)
        //{
        //    var response = _service.Login(loginModal);
        //    if (!response)
        //    {
        //        return BadRequest(new { message = "User name or password not correct" });
        //    }
        //    return NoContent();
        //}
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
                Address = updateUser.Address,
                Email = updateUser.Email,
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
