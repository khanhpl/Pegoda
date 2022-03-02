using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;
using Api.Services;
using Swashbuckle.AspNetCore.Annotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace Api.Controllers
{
    public class RoleController : BaseApiController
    {
        private readonly RoleService _service;
        public RoleController(RoleService service)
        {
            _service = service;
        }
        [Authorize(Roles = "ADMIN")]
        [HttpPost]
        [SwaggerOperation(Summary = "Create new role")]
        public async Task<ActionResult> Create(ResponseRoleModel newRole)
        {
            Role role = new Role
            {
                Name = newRole.Name
            };
            await _service.Create(role);
            return CreatedAtAction(nameof(GetById), new { id = role.Id }, role);
        }
        [Authorize(Roles = "ADMIN")]
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update role")]
        public async Task<ActionResult> Update(Guid id, Role updateRole)
        {
            if (id != updateRole.Id)
            {
                return BadRequest();
            }
            bool check = await _service.Update(updateRole);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get role by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Role role = await _service.GetById(id);
            if (role == null)
            {
                return NotFound();
            }
            return Ok(role);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get list role")]
        public ActionResult GetList()
        {
            List<Role> listRoles = _service.GetList();

            return Ok(listRoles);
        }
        [Authorize(Roles = "ADMIN")]
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete role by Id")]
        public async Task<ActionResult> Delete(Guid id)
        {
            bool check = await _service.Delete(id);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
    }
}
