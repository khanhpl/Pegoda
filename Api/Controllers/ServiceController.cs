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
    public class ServiceController : BaseApiController
    {
        private readonly ServiceService _service;
        public ServiceController(ServiceService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new service")]
        public async Task<ActionResult> Create(ResponseServiceModel newService)
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
        public async Task<ActionResult> Update(Guid id, UpdateServiceModel updateService)
        {
            if (id != updateService.Id)
            {
                return BadRequest();
            }
            Service service = new Service
            {
                Id = updateService.Id,
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
        [HttpGet("search")]
        [SwaggerOperation(Summary = "Search by name")]
        public async Task<List<Service>> SearchByName(String name, int pageNumber = 1, int pageSize = 1)
        {
            if (name == null)
            {
                List<Service> listService = _service.GetList(pageNumber, pageSize);

                return listService;
            }
            else
            {
                List<Service> service = await _service.SearchByName(name, pageNumber, pageSize);
                if (service == null)
                {
                    return null;
                }
                return service;
            }
        }
    }
}
