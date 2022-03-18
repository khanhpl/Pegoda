using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;
using X.PagedList;
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
        public List<Service> GetList(int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return _context.Service.ToList();
            }
            return _context.Service.ToPagedList(pageNumber, pageSize).ToList();
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
        public async Task<List<Service>> SearchByName(String name, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.Service.Where(x => x.Name.Contains(name)).ToListAsync();
            }
            List<Service> service = await _context.Service.Where(x => x.Name.Contains(name)).ToPagedList(pageNumber, pageSize).ToListAsync();
            if (service == null)
            {
                return null;
            }
            return service;
        }
        public async Task<List<Service>> SearchByCenterId(Guid centerId, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.Service.Where(x => x.CenterId.Equals(centerId)).ToListAsync();
            }
            List<Service> service = await _context.Service.Where(x => x.CenterId.Equals(centerId)).ToPagedList(pageNumber, pageSize).ToListAsync();
            if (service == null)
            {
                return null;
            }
            return service;
        }
        public async Task<List<Service>> SearchByNameAndCenterId(Guid centerId, String name, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.Service.Where(x => (x.CenterId.Equals(centerId)) && x.Name.Contains(name)).ToListAsync();
            }
            List<Service> service = await _context.Service.Where(x => (x.CenterId.Equals(centerId)) && x.Name.Contains(name)).ToPagedList(pageNumber, pageSize).ToListAsync();
            if (service == null)
            {
                return null;
            }
            return service;
        }
        public async Task<List<Service>> Search(string nameService, Guid animalId, Guid serviceTypeId)
        {
            if (nameService != null && animalId != Guid.Empty && serviceTypeId != Guid.Empty)
            {
                return await _context.Service.Where(x => x.Name.Contains(nameService)).Where(x => x.AnimalId == animalId).Where(x => x.ServiceTypeId == serviceTypeId).ToListAsync();
            }
            else if (nameService == null && animalId != Guid.Empty && serviceTypeId != Guid.Empty)
            {
                return await _context.Service.Where(x => x.AnimalId == animalId).Where(x => x.ServiceTypeId == serviceTypeId).ToListAsync();
            }
            else if (nameService == null && animalId == Guid.Empty && serviceTypeId != Guid.Empty)
            {
                return await _context.Service.Where(x => x.ServiceTypeId == serviceTypeId).ToListAsync();
            }
            else if (nameService != null && animalId == Guid.Empty && serviceTypeId == Guid.Empty)
            {
                return await _context.Service.Where(x => x.AnimalId == animalId).ToListAsync();
            }
            else if (nameService != null && animalId == Guid.Empty && serviceTypeId == Guid.Empty)
            {
                return await _context.Service.Where(x => x.AnimalId == animalId).ToListAsync();
            }
            return await _context.Service.ToListAsync();
        }
    }
}
