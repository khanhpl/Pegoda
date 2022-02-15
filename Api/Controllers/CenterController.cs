using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class CenterController : BaseApiController
    {
        private readonly CenterService _service;
        public CenterController(CenterService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new center")]
        public async Task<ActionResult> Create(ResponseCenterModel newCenter)
        {
            Center center = new Center
            {
                Name = newCenter.Name,
                Service = newCenter.Service,
                Address = newCenter.Address,
                Longitude = newCenter.Longitude,
                Latitude = newCenter.Latitude
            };
            await _service.Create(center);
            return CreatedAtAction(nameof(GetById), new { id = center.Id }, center);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update center")]
        public async Task<ActionResult> Update(Guid id, Center updateCenter)
        {
            if (id != updateCenter.Id)
            {
                return BadRequest();
            }
            bool check = await _service.Update(updateCenter);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get center by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Center center = await _service.GetById(id);
            if (center == null)
            {
                return NotFound();
            }
            return Ok(center);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get all center")]
        public ActionResult GetAll()
        {
            List<Center> listCenters = _service.GetAll();

            return Ok(listCenters);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete center by Id")]
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
