using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class ServiceTypeService
    {
        private readonly IServiceTypeRepository<ServiceType> _repo;
        public ServiceTypeService(IServiceTypeRepository<ServiceType> repo)
        {
            _repo = repo;
        }
        public async Task<ServiceType> Create(ServiceType serviceType)
        {
            return await _repo.Create(serviceType);
        }
        public async Task<bool> Update(ServiceType newServiceType)
        {
            return await _repo.Update(newServiceType);
        }
        public async Task<ServiceType> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public List<ServiceType> GetList(int pageNumber, int pageSize)
        {
            return _repo.GetList(pageNumber, pageSize);
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
    }
}
