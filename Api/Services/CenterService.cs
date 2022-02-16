using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class CenterService
    {
        private readonly ICenterRepository<Center> _repo;
        public CenterService(ICenterRepository<Center> repo)
        {
            _repo = repo;
        }
        public async Task<Center> Create(Center center)
        {
            return await _repo.Create(center);
        }
        public async Task<bool> Update(Center newCenter)
        {
            return await _repo.Update(newCenter);
        }
        public async Task<Center> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public List<Center> GetAll()
        {
            return _repo.GetAll();
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
        public async Task<List<Center>> SearchByAddressAndName(String name, String address)
        {
            return await _repo.SearchByAddressAndName(name,address);
        }
    }
}
