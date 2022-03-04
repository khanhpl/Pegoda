using System;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;
using Api.Services;
using FirebaseAdmin;
using FirebaseAdmin.Auth;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class UserController : BaseApiController
    {
        private readonly UserService _service;
        // private readonly FirebaseApp _firebaseApp;
        // private readonly FirebaseAuth _firebaseAuth;
        public UserController(UserService service, FirebaseApp firebaseApp)
        {
            _service = service;
            // _firebaseApp = firebaseApp;
            // _firebaseAuth = FirebaseAuth.GetAuth(_firebaseApp);
        }

        [Route("Register")]
        [HttpPost]
        [SwaggerOperation(Summary = "Register new user")]
        public async Task<ActionResult> Register(RegisterUserModel newUser)
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
            return CreatedAtAction(nameof(GetByEmail), new { email = newUser.Email }, newUser);
        }

        [HttpGet]
        [SwaggerOperation(Summary = "Get information user by email")]
        public ActionResult GetByEmail(string email)
        {
            User response = _service.GetByEmail(email);
            if (response == null)
            {
                return NotFound();
            }
            ResponseUserModel user = new ResponseUserModel
            {
                Id = response.Id,
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
        public async Task<ActionResult> Login(LoginModel loginModel)
        {
            FirebaseToken decodedToken = await FirebaseAuth.DefaultInstance.VerifyIdTokenAsync(loginModel.Token);
            Console.WriteLine(decodedToken);
            // var response = _service.Login(loginModel);
            // if (response == null)
            // {
            //     return BadRequest(new { message = "Token is invalid" });
            // }
            // return Ok(new { token = response });
            return Ok();
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
        public async Task<ActionResult> Update(Guid id, UpdateUserModel updateUser)
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
