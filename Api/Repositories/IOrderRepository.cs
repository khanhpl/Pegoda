using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IOrderRepository<T>
    {
        Task<Order> Create(Order order);
        Task<bool> Update(Order newOrder);
        Task<Order> GetById(Guid id);
        List<Order> GetList();
        Task<bool> Delete(Guid id);
    }
}
