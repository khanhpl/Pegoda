using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IAnimalRepository<T>
    {
        Task<Animal> Create(Animal animal);
        Task<bool> Update(Animal animal);
        Task<Animal> GetById(Guid id);
        List<Animal> GetAll();
        Task<bool> Delete(Guid id);
    }
}