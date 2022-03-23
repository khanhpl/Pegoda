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
                AnimalId = newService.AnimalId,
                ServiceTypeId = newService.ServiceTypeId
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
                AnimalId = updateService.AnimalId,
                ServiceTypeId = updateService.ServiceTypeId
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
        [HttpGet]
        [SwaggerOperation(Summary = "Search by name or center id or animalId, serviceTypeId and paging")]
        public async Task<List<Service>> SearchByName(String name, Guid centerId, int pageNumber, int pageSize, Guid animalId, Guid serviceTypeId)
        {
            List<Service> listService = new List<Service>();
            if (name == null && centerId == Guid.Empty)
            {
                listService = _service.GetList(pageNumber, pageSize);

                return listService;
            }
            if (name != null && centerId != Guid.Empty)
            {
                listService = await _service.SearchByNameAndCenterId(centerId, name, pageNumber, pageSize);

                return listService;
            }
            else if (name != null && centerId == Guid.Empty)
            {
                listService = await _service.SearchByName(name, pageNumber, pageSize);
                if (listService == null)
                {
                    return null;
                }
                return listService;
            }
            else if (centerId != Guid.Empty && name == null)
            {
                listService = await _service.SearchByCenterId(centerId, pageNumber, pageSize);
                if (listService == null)
                {
                    return null;
                }
            }
            else
            {
                listService = await _service.Search(name, animalId, serviceTypeId);
            }
            return listService;
        }
    }
}
