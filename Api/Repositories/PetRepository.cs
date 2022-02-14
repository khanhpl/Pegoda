using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;

namespace Api.Repositories
{
    public class PetRepository : IPetRepository<Pet>
    {
        private readonly DataContext _context;
        public PetRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Pet> Create(Pet pet)
        {
            await _context.Pets.AddAsync(pet);
            await _context.SaveChangesAsync();
            return pet;
        }
        public async Task<bool> Update(Pet newPet)
        {
            Pet pet = _context.Pets.AsNoTracking().FirstOrDefault(x => x.Id == newPet.Id);
            if (pet == null)
            {
                return false;
            }
            _context.Pets.Update(newPet);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<Pet> GetById(Guid id)
        {
            Pet pet = await _context.Pets.Where(x => x.Id == id).FirstOrDefaultAsync();
            if (pet == null)
            {
                return null;
            }
            return pet;
        }
        public List<Pet> GetAll()
        {
            return _context.Pets.ToList();
        }
        public async Task<bool> Delete(Guid id)
        {
            Pet pet = await _context.Pets.FirstOrDefaultAsync(x => x.Id == id);
            if (pet == null)
            {
                return false;
            }
            _context.Pets.Remove(pet);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
