using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class StaffService
    {
        private readonly IStaffRepository<Staff> _repo;
        public StaffService(IStaffRepository<Staff> repo)
        {
            _repo = repo;
        }
        public async Task<Staff> Create(Staff staff)
        {
            return await _repo.Create(staff);
        }
        public async Task<bool> Update(Staff newStaff)
        {
            return await _repo.Update(newStaff);
        }
        public async Task<Staff> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public async Task<List<Staff>> SearchByName(String name, int pageNumber, int pageSize)
        {
            return await _repo.SearchByName(name, pageNumber, pageSize);
        }
        public async Task<List<Staff>> SearchByCenterId(Guid centerId, int pageNumber, int pageSize)
        {
            return await _repo.SearchByCenterId(centerId, pageNumber, pageSize);
        }
        public async Task<List<Staff>> SearchByNameAndCenterId(Guid centerId, String name, int pageNumber, int pageSize)
        {
            return await _repo.SearchByNameAndCenterId(centerId, name, pageNumber, pageSize);
        }
        public List<Staff> GetList(int pageNumber, int pageSize)
        {
            return _repo.GetList(pageNumber, pageSize);
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
    }
}