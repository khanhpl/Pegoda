using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface ICustomerRepository<T>
    {
        Task<Customer> Create(Customer customer);
        Task<bool> Update(Customer customer);
        Task<Customer> GetById(Guid id);
        List<Customer> GetAll();
        Task<bool> Delete(Guid id);
    }
}
