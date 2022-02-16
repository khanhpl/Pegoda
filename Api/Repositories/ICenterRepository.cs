using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface ICenterRepository<T>
    {
        Task<Center> Create(Center center);
        Task<bool> Update(Center newCenter);
        Task<Center> GetById(Guid id);
        List<Center> GetAll();
        Task<bool> Delete(Guid id);
        Task<List<Center>> SearchByAddressAndName(String address, String name);
    }
}
