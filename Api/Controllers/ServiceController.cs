using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class ServiceController : BaseApiController
    {
        private readonly ServiceService _service;
        public ServiceController(ServiceService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Register new service")]
        public async Task<ActionResult> Create(ResponseServiceModal newService)
        {
            Service service = new Service
            {
                Name = newService.Name,
                Price = newService.Price,
                Description = newService.Description,
                Image = newService.Image,
                Duration = newService.Duration,
                CenterId = newService.CenterId,
                AnimalId = newService.AnimalId
            };
            await _service.Create(service);
            return CreatedAtAction(nameof(GetById), new { Id = service.Id }, service);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update service")]
        public async Task<ActionResult> Update(Guid id, UpdateServiceModal updateService)
        {
            if (id != updateService.Id)
            {
                return BadRequest();
            }
            Service service = new Service
            {
                Name = updateService.Name,
                Price = updateService.Price,
                Description = updateService.Description,
                Image = updateService.Image,
                Duration = updateService.Duration,
                CenterId = updateService.CenterId,
                AnimalId = updateService.AnimalId
            };
            bool check = await _service.Update(service);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get service by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Service service = await _service.GetById(id);
            if (service == null)
            {
                return NotFound();
            }
            return Ok(service);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get all service")]
        public ActionResult GetAll()
        {
            List<Service> listServices = _service.GetAll();

            return Ok(listServices);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete service by Id")]
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
