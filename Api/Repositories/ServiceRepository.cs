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
            service.Status = "active";
            await _context.Service.AddAsync(service);
            await _context.SaveChangesAsync();
            return service;
        }
        public async Task<bool> Update(Service newService)
        {
            Service service = _context.Service.AsNoTracking().FirstOrDefault(x => x.Id == newService.Id && x.Status.Equals("active"));
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
                return _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToList();
            }
            return _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.Status.Equals("active")).ToPagedList(pageNumber, pageSize).ToList();
        }
        public async Task<Service> GetById(Guid id)
        {
            Service service = await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.Id == id && x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).FirstOrDefaultAsync();
            if (service == null)
            {
                return null;
            }
            return service;
        }
        public async Task<bool> Delete(Guid id)
        {
            Service service = await _context.Service.FirstOrDefaultAsync(x => x.Id == id && x.Status.Equals("active"));
            if (service == null)
            {
                return false;
            }
            service.Status = "inactive";
            // _context.Service.Remove(service);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<List<Service>> SearchByName(String name, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.Name.Contains(name) && x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToListAsync();
            }
            List<Service> service = await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.Name.Contains(name) && x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToPagedList(pageNumber, pageSize).ToListAsync();
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
                return await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.CenterId.Equals(centerId) && x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToListAsync();
            }
            List<Service> service = await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.CenterId.Equals(centerId) && x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToPagedList(pageNumber, pageSize).ToListAsync();
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
                return await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => (x.CenterId.Equals(centerId)) && x.Name.Contains(name) && x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToListAsync();
            }
            List<Service> service = await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => (x.CenterId.Equals(centerId)) && x.Name.Contains(name) && x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToPagedList(pageNumber, pageSize).ToListAsync();
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
                return await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.Name.Contains(nameService)).Where(x => x.AnimalId == animalId).Where(x => x.ServiceTypeId == serviceTypeId).Where(x => x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToListAsync();
            }
            else if (nameService == null && animalId != Guid.Empty && serviceTypeId != Guid.Empty)
            {
                return await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.AnimalId == animalId).Where(x => x.ServiceTypeId == serviceTypeId).Where(x => x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToListAsync();
            }
            else if (nameService == null && animalId == Guid.Empty && serviceTypeId != Guid.Empty)
            {
                return await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.ServiceTypeId == serviceTypeId).Where(x => x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToListAsync();
            }
            else if (nameService != null && animalId == Guid.Empty && serviceTypeId == Guid.Empty)
            {
                return await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.AnimalId == animalId).Where(x => x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToListAsync();
            }
            else if (nameService != null && animalId == Guid.Empty && serviceTypeId == Guid.Empty)
            {
                return await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.AnimalId == animalId).Where(x => x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToListAsync();
            }
            return await _context.Service.Include(x => x.Animal).Include(x => x.ServiceType).Where(x => x.Status.Equals("active") && x.ServiceType.Status.Equals("active")).ToListAsync();
        }
    }
}
