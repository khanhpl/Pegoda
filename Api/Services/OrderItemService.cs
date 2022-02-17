using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class OrderItemService
    {
        private readonly IOrderItemRepository<OrderItem> _repo;
        public OrderItemService(IOrderItemRepository<OrderItem> repo)
        {
            _repo = repo;
        }
        public async Task<OrderItem> Create(OrderItem orderItem)
        {
            return await _repo.Create(orderItem);
        }
        public async Task<bool> Update(OrderItem newOrderItem)
        {
            return await _repo.Update(newOrderItem);
        }
        public async Task<OrderItem> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public List<OrderItem> GetList()
        {
            return _repo.GetList();
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
    }
}
