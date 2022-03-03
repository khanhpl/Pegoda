using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IServiceTypeRepository<T>
    {
        Task<ServiceType> Create(ServiceType serviceType);
        Task<bool> Update(ServiceType newServiceType);
        Task<ServiceType> GetById(Guid id);
        List<ServiceType> GetList(int pageNumber, int pageSize);
        Task<bool> Delete(Guid id);
    }
}
