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
    public class ServiceTypeController : BaseApiController
    {
        private readonly ServiceTypeService _service;
        public ServiceTypeController(ServiceTypeService service)
        {
            _service = service;
        }

        [HttpPost]
        [SwaggerOperation(Summary = "Create new service type")]
        public async Task<ActionResult> Create(ResponseServiceTypeModel newServiceType)
        {
            ServiceType serviceType = new ServiceType
            {
                Name = newServiceType.Name
            };
            await _service.Create(serviceType);
            return CreatedAtAction(nameof(GetById), new { id = serviceType.Id }, serviceType);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update service type")]
        public async Task<ActionResult> Update(Guid id, ServiceType updateServiceType)
        {
            if (id != updateServiceType.Id)
            {
                return BadRequest();
            }
            bool check = await _service.Update(updateServiceType);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get service type by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            ServiceType serviceType = await _service.GetById(id);
            if (serviceType == null)
            {
                return NotFound();
            }
            return Ok(serviceType);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get list service type")]
        public ActionResult GetList(int pageNumber, int pageSize)
        {
            List<ServiceType> listServiceTypes = _service.GetList(pageNumber, pageSize);

            return Ok(listServiceTypes);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete service type by Id")]
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
