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
        List<Customer> GetList(int pageNumber, int pageSize);
        Task<List<Customer>> GetListByName(String name, int pageNumber, int pageSize);
        Task<bool> Delete(Guid id);
    }
}
