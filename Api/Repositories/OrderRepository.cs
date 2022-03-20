using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using X.PagedList;
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
        public dynamic GetList(int pageNumber, int pageSize, Guid centerId)
        {
            // if (pageNumber == 0 && pageSize == 0 && centerId == Guid.Empty)
            // {
            //     return _context.Order.ToList();
            // }
            // else if (pageNumber == 0 && pageSize == 0)
            // {
            //     var orders = from order in _context.Order
            //                  join center in _context.Center on order.CenterId equals center.Id
            //                  join orderitem in _context.OrderItem on order.Id equals orderitem.OrderId
            //                  join pet in _context.Pet on order.PetId equals pet.Id
            //                  join customer in _context.Customer on pet.CustomerId equals customer.Id
            //                  join service in _context.Service on orderitem.ServiceId equals service.Id
            //                  where order.CenterId == centerId
            //                  select new { OrderId = order.Id, CustomerName = customer.Name, PetName = pet.Name, PetGender = pet.Gender, BookingTime = orderitem.BookingTime, ServiceName = service.Name, Status = order.Status };

            //     return orders.ToList();
            // }
            // else if (centerId == Guid.Empty)
            // {
            //     return _context.Order.ToPagedList(pageNumber, pageSize).ToList();
            // }
            // else
            // {
            //     var orders = from order in _context.Order
            //                  join center in _context.Center on order.CenterId equals center.Id
            //                  join orderitem in _context.OrderItem on order.Id equals orderitem.OrderId
            //                  join pet in _context.Pet on order.PetId equals pet.Id
            //                  join customer in _context.Customer on pet.CustomerId equals customer.Id
            //                  join service in _context.Service on orderitem.ServiceId equals service.Id
            //                  where order.CenterId == centerId
            //                  select new { OrderId = order.Id, CustomerName = customer.Name, PetName = pet.Name, PetGender = pet.Gender, BookingTime = orderitem.BookingTime, ServiceName = service.Name, Status = order.Status };

            //     return orders.ToPagedList(pageNumber, pageSize).ToList();
            // }


            if (pageNumber == 0 && pageSize == 0 && centerId == Guid.Empty)
            {
                return _context.Order.ToList();
            }
            else if (pageNumber == 0 && pageSize == 0 && centerId != Guid.Empty)
            {
                var orders = from order in _context.Order
                             join pet in _context.Pet on order.PetId equals pet.Id
                             join customer in _context.Customer on pet.CustomerId equals customer.Id
                             where order.CenterId == centerId
                             select new { OrderId = order.Id, Date = order.Date, TotalPrice = order.TotalPrice, Status = order.Status, PetId = pet.Id, PetName = pet.Name, Gender = pet.Gender, CustomerId = customer.Id, CustomerName = customer.Name, CustomerEquals = customer.Email };
                return orders.ToList();
            }
            else if (pageNumber != 0 && pageSize != 0 && centerId != Guid.Empty)
            {
                var orders = from order in _context.Order
                             join pet in _context.Pet on order.PetId equals pet.Id
                             join customer in _context.Customer on pet.CustomerId equals customer.Id
                             where order.CenterId == centerId
                             select new { OrderId = order.Id, Date = order.Date, TotalPrice = order.TotalPrice, Status = order.Status, PetId = pet.Id, PetName = pet.Name, Gender = pet.Gender, CustomerId = customer.Id, CustomerName = customer.Name, CustomerEquals = customer.Email };
                return orders.ToPagedList(pageNumber, pageSize).ToList();
            }
            return null;
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
