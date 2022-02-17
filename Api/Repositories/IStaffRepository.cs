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
        List<Staff> GetList();
        Task<bool> Delete(Guid id);
    }
}