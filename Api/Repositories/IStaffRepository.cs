using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IStaffRepository<T>
    {
        Task<Staff> Create(Staff staff);
        Task<bool> Update(Staff staff);
        Task<Staff> GetById(Guid id);
        Task<List<Staff>> SearchByName(String name, int pageNumber, int pageSize);
        Task<List<Staff>> SearchByCenterId(Guid centerId, int pageNumber, int pageSize);
        Task<List<Staff>> SearchByNameAndCenterId(Guid centerId, String name, int pageNumber, int pageSize);
        List<Staff> GetList(int pageNumber, int pageSize);
        Task<bool> Delete(Guid id);
    }
}