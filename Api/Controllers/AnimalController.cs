using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using static Api.Controllers.BasicApiController;

namespace Api.Controllers
{
    public class AnimalController : BaseApiController
    {
        private readonly AnimalService _service;
        public AnimalController(AnimalService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Register new animal")]
        public async Task<ActionResult> Create(ResponseAnimalModal newAnimal)
        {
            Animal animal = new Animal
            {
                Type = newAnimal.Type
            };
            await _service.Create(animal);
            return NoContent();
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update animal")]
        public async Task<ActionResult> Update(Guid id, Animal updateAnimal)
        {
            if (id != updateAnimal.Id)
            {
                return BadRequest();
            }
            Animal animal = new Animal
            {
                Id = updateAnimal.Id,
                Type = updateAnimal.Type
            };
            bool check = await _service.Update(animal);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get animal by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Animal animal = await _service.GetById(id);
            if (animal == null)
            {
                return NotFound();
            }
            return Ok(animal);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get all animal")]
        public ActionResult GetAll()
        {
            List<Animal> listAnimals = _service.GetAll();

            return Ok(listAnimals);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete animal by Id")]
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
