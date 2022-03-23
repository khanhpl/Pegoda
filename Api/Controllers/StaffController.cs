using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class StaffController : BaseApiController
    {
        private readonly StaffService _staffService;
        private readonly UserService _userService;
        public StaffController(StaffService staffService, UserService userService)
        {
            _staffService = staffService;
            _userService = userService;
        }
        [HttpPost("Register")]
        [SwaggerOperation(Summary = "Create new Staff")]
        public async Task<ActionResult> Create(CreateStaffModel newStaff)
        {
            Staff staff = new Staff
            {
                CenterId = newStaff.CenterId,
                Gender = newStaff.Gender,
                Image = newStaff.Image,
                Name = newStaff.Name,
                Email = newStaff.Email
            };
            User user = new User
            {
                Name = newStaff.Name,
                Email = newStaff.Email,
                Image = newStaff.Image,
                RoleId = new Guid("eb55bb48-1cf4-4f4a-15d2-08d9fac956cb"),
            };
            await _userService.Create(user);
            User tempUser = await _userService.Create(user);
            if (tempUser == null)
            {
                return BadRequest(new { message = "Email has exist" });
            }
            await _staffService.Create(staff);
            return CreatedAtAction(nameof(GetById), new { id = staff.Id }, staff);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update Staff")]
        public async Task<ActionResult> Update(Guid id, ResponseStaffModel updateStaff)
        {
            if (id != updateStaff.Id)
            {
                return BadRequest();
            }
            Staff staff = new Staff
            {
                Id = updateStaff.Id,
                CenterId = updateStaff.CenterId,
                Gender = updateStaff.Gender,
                Image = updateStaff.Image,
                Name = updateStaff.Name,
                Email = updateStaff.Email,
            };
            bool check = await _staffService.Update(staff);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get Staff by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Staff staff = await _staffService.GetById(id);
            if (staff == null)
            {
                return NotFound();
            }
            ResponseStaffModel responseStaffModel = new ResponseStaffModel
            {
                Id = staff.Id,
                CenterId = staff.CenterId,
                Gender = staff.Gender,
                Image = staff.Image,
                Name = staff.Name,
                Email = staff.Email,
            };
            return Ok(responseStaffModel);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get Staff by Center Id or name and pagination")]
        public async Task<List<Staff>> GetByCenterIdOrName(String name, Guid centerId, int pageNumber, int pageSize)
        {
            List<Staff> listStaff = new List<Staff>();
            if (name == null && centerId == Guid.Empty)
            {
                listStaff = _staffService.GetList(pageNumber, pageSize);

                return listStaff;
            }
            if (name != null && centerId != Guid.Empty)
            {
                listStaff = await _staffService.SearchByNameAndCenterId(centerId, name, pageNumber, pageSize);

                return listStaff;
            }
            else if (name != null && centerId == Guid.Empty)
            {
                listStaff = await _staffService.SearchByName(name, pageNumber, pageSize);
                if (listStaff == null)
                {
                    return null;
                }
                return listStaff;
            }
            else if (centerId != Guid.Empty && name == null)
            {
                listStaff = await _staffService.SearchByCenterId(centerId, pageNumber, pageSize);
                if (listStaff == null)
                {
                    return null;
                }
            }
            return listStaff;
        }

        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete Staff by Id")]
        public async Task<ActionResult> Delete(Guid id)
        {
            bool check = await _staffService.Delete(id);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
    }
}