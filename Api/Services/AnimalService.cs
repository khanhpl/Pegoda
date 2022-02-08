using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class AnimalService
    {
        private readonly IAnimalRepository<Animal> _repo;
        public AnimalService(IAnimalRepository<Animal> repo)
        {
            _repo = repo;
        }
        public async Task<Animal> Create(Animal animal)
        {
            return await _repo.Create(animal);
        }
        public async Task<bool> Update(Animal newAnimal)
        {
            return await _repo.Update(newAnimal);
        }
        public async Task<Animal> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public List<Animal> GetAll()
        {
            return _repo.GetAll();
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
    }
}