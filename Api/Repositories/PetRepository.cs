using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Firebase.Auth;
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
            pet.Status = "active";
            await _context.Pet.AddAsync(pet);
            await _context.SaveChangesAsync();
            return pet;
        }
        public async Task<bool> Update(Pet newPet)
        {
            Pet pet = _context.Pet.AsNoTracking().FirstOrDefault(x => x.Id == newPet.Id && x.Status.Equals("active"));
            if (pet == null)
            {
                return false;
            }
            _context.Pet.Update(newPet);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<Pet> GetById(Guid id)
        {
            Pet pet = await _context.Pet.Where(x => x.Id == id && x.Status.Equals("active")).FirstOrDefaultAsync();
            if (pet == null)
            {
                return null;
            }
            return pet;
        }
        public dynamic GetList(string email)
        {
            if (email == null)
            {
                return _context.Pet.Where(x => x.Status.Equals("active")).ToList();
            }
            else
            {
                var list = from pet in _context.Pet
                           join customer in _context.Customer on pet.CustomerId equals customer.Id
                           where customer.Email == email
                           select new { PetId = pet.Id, PetName = pet.Name, PetStatus = pet.Status, AnimalId = pet.AnimalId, CustomerId = customer.Id, CustomerName = customer.Name, Email = customer.Email };

                return list.ToList();
            }
        }
        public async Task<bool> Delete(Guid id)
        {
            Pet pet = await _context.Pet.FirstOrDefaultAsync(x => x.Id == id && x.Status.Equals("active"));
            if (pet == null)
            {
                return false;
            }
            pet.Status = "inactive";
            // _context.Pet.Remove(pet);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
