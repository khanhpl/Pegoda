using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;

namespace Api.Repositories
{
    public class CustomerRepository : ICustomerRepository<Customer>
    {
        private readonly DataContext _context;
        public CustomerRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Customer> Create(Customer customer)
        {
            await _context.Customer.AddAsync(customer);
            await _context.SaveChangesAsync();
            return customer;
        }

        public async Task<bool> Delete(Guid id)
        {
            Customer customer = await _context.Customer.FirstOrDefaultAsync(x => x.Id == id);
            if (customer == null)
            {
                return false;
            }
            _context.Customer.Remove(customer);
            await _context.SaveChangesAsync();
            return true;
        }

        public List<Customer> GetList()
        {
            return _context.Customer.ToList();
        }

        public async Task<Customer> GetById(Guid id)
        {
            Customer customer = await _context.Customer.FirstOrDefaultAsync(x => x.Id == id);
            if (customer == null)
            {
                return null;
            }
            return customer;
        }

        public async Task<bool> Update(Customer newCustomer)
        {
            Customer customer = await _context.Customer.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newCustomer.Id);
            if (customer == null)
            {
                return false;
            }
            User user = await _context.User.AsNoTracking().FirstOrDefaultAsync(x => x.Email == newCustomer.Email);
            if (user == null)
            {
                return false;
            }
            User newUser = new User()
            {
                Id = user.Id,
                Name = newCustomer.Name,
                Email = newCustomer.Email,
                Image = newCustomer.Image,
                Address = newCustomer.Address,
                RoleId = user.RoleId,
            };
            _context.User.Update(newUser);
            _context.Customer.Update(newCustomer);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
