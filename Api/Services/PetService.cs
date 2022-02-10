using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class PetService
    {
        private readonly IPetRepository<Pet> _repo;
        public PetService(IPetRepository<Pet> repo)
        {
            _repo = repo;
        }
        public async Task<Pet> Create(Pet pet)
        {
            return await _repo.Create(pet);
        }
        public async Task<bool> Update(Pet newPet)
        {
            return await _repo.Update(newPet);
        }
        public async Task<Pet> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public List<Pet> GetAll()
        {
            return _repo.GetAll();
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
    }
}
