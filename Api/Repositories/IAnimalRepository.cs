using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IAnimalRepository<T>
    {
        Task<Animal> Create(Animal animal);
        Task<bool> Update(Animal newAnimal);
        Task<Animal> GetById(Guid id);
        List<Animal> GetAll();
        Task<bool> Delete(Guid id);
    }
}
