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
    public class PetController : BaseApiController
    {
        private readonly PetService _service;
        public PetController(PetService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new pet")]
        public async Task<ActionResult> Create(ResponsePetModel newPet)
        {
            Pet pet = new Pet
            {
                Name = newPet.Name,
                Status = newPet.Status,
                Gender = newPet.Gender,
                AnimalId = newPet.AnimalId,
                CustomerId = newPet.CustomerId
            };
            await _service.Create(pet);
            return CreatedAtAction(nameof(GetById), new { id = pet.Id }, pet);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update pet")]
        public async Task<ActionResult> Update(Guid id, UpdatePetModel updatePet)
        {
            if (id != updatePet.Id)
            {
                return BadRequest();
            }
            Pet pet = new Pet
            {
                Id = updatePet.Id,
                Name = updatePet.Name,
                Status = updatePet.Status,
                Gender = updatePet.Gender,
                AnimalId = updatePet.AnimalId,
                CustomerId = updatePet.CustomerId
            };
            bool check = await _service.Update(pet);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get pet by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Pet pet = await _service.GetById(id);
            if (pet == null)
            {
                return NotFound();
            }
            return Ok(pet);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get list pet")]
        public ActionResult GetList()
        {
            List<Pet> listPets = _service.GetList();

            return Ok(listPets);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete pet by Id")]
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
