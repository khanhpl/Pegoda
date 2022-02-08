using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;

namespace Api.Repositories
{
    public class AnimalRepository : IAnimalRepository<Animal>
    {
        private readonly DataContext _context;
        public AnimalRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Animal> Create(Animal animal)
        {
            await _context.Animals.AddAsync(animal);
            await _context.SaveChangesAsync();
            return animal;
        }

        public async Task<bool> Delete(Guid id)
        {
            Animal animal = await _context.Animals.FirstOrDefaultAsync(x => x.Id == id);
            if (animal == null)
            {
                return false;
            }
            _context.Animals.Remove(animal);
            await _context.SaveChangesAsync();
            return true;
        }

        public List<Animal> GetAll()
        {
            return _context.Animals.ToList();
        }

        public async Task<Animal> GetById(Guid id)
        {
            Animal animal = await _context.Animals.FirstOrDefaultAsync(x => x.Id == id);
            if (animal == null)
            {
                return null;
            }
            return animal;
        }

        public async Task<bool> Update(Animal newAnimal)
        {
            Animal animal = await _context.Animals.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newAnimal.Id);
            if (animal == null)
            {
                return false;
            }
            _context.Animals.Update(newAnimal);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}