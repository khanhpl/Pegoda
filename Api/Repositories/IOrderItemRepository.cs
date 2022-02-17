using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IOrderItemRepository<T>
    {
        Task<OrderItem> Create(OrderItem orderItem);
        Task<bool> Update(OrderItem orderItem);
        Task<OrderItem> GetById(Guid id);
        List<OrderItem> GetList();
        Task<bool> Delete(Guid id);
    }
}
