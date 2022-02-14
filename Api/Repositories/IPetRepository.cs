using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IPetRepository<T>
    {
        Task<Pet> Create(Pet pet);
        Task<bool> Update(Pet newPet);
        Task<Pet> GetById(Guid id);
        List<Pet> GetAll();
        Task<bool> Delete(Guid id);
    }
}
