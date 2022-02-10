using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class CustomerService
    {
        private readonly ICustomerRepository<Customer> _repo;
        public CustomerService(ICustomerRepository<Customer> repo)
        {
            _repo = repo;
        }
        public async Task<Customer> Create(Customer customer)
        {
            return await _repo.Create(customer);
        }
        public async Task<bool> Update(Customer newCustomer)
        {
            return await _repo.Update(newCustomer);
        }
        public async Task<Customer> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public List<Customer> GetAll()
        {
            return _repo.GetAll();
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
    }
}
