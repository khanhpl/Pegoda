using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;

namespace Api.Repositories
{
    public class OrderRepository : IOrderRepository<Order>
    {
        private readonly DataContext _context;
        public OrderRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Order> Create(Order order)
        {
            await _context.Order.AddAsync(order);
            await _context.SaveChangesAsync();
            return order;
        }
        public async Task<bool> Update(Order newOrder)
        {
            Order order = _context.Order.AsNoTracking().FirstOrDefault(x => x.Id == newOrder.Id);
            if (order == null)
            {
                return false;
            }
            _context.Order.Update(newOrder);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<Order> GetById(Guid id)
        {
            Order order = await _context.Order.Where(x => x.Id == id).FirstOrDefaultAsync();
            if (order == null)
            {
                return null;
            }
            return order;
        }
        public List<Order> GetList()
        {
            return _context.Order.ToList();
        }
        public async Task<bool> Delete(Guid id)
        {
            Order order = await _context.Order.FirstOrDefaultAsync(x => x.Id == id);
            if (order == null)
            {
                return false;
            }
            _context.Order.Remove(order);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
