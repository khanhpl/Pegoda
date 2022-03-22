using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class OrderService
    {
        private readonly IOrderRepository<Order> _repo;
        public OrderService(IOrderRepository<Order> repo)
        {
            _repo = repo;
        }
        public async Task<Order> Create(Order order)
        {
            return await _repo.Create(order);
        }
        public async Task<bool> Update(Order newOrder)
        {
            return await _repo.Update(newOrder);
        }
        public async Task<Order> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public dynamic GetList(int pageNumber, int pageSize, Guid centerId, Guid userId)
        {
            return _repo.GetList(pageNumber, pageSize, centerId, userId);
        }
        public dynamic GetListOrderByCustomerId(string email)
        {
            return _repo.GetListOrderByCustomerId(email);
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
    }
}
