using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;

namespace Api.Repositories
{
    public class ServiceRepository : IServiceRepository<Service>
    {
        private readonly DataContext _context;
        public ServiceRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Service> Create(Service service)
        {
            await _context.Service.AddAsync(service);
            await _context.SaveChangesAsync();
            return service;
        }
        public async Task<bool> Update(Service newService)
        {
            Service service = _context.Service.AsNoTracking().FirstOrDefault(x => x.Id == newService.Id);
            if (service == null)
            {
                return false;
            }
            _context.Service.Update(newService);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<Service> GetById(Guid id)
        {
            Service service = await _context.Service.Where(x => x.Id == id).FirstOrDefaultAsync();
            if (service == null)
            {
                return null;
            }
            return service;
        }
        public List<Service> GetAll()
        {
            return _context.Service.ToList();
        }
        public async Task<bool> Delete(Guid id)
        {
            Service service = await _context.Service.FirstOrDefaultAsync(x => x.Id == id);
            if (service == null)
            {
                return false;
            }
            _context.Service.Remove(service);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
