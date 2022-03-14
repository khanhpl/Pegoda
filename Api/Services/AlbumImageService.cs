using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class AlbumImageService
    {
        private readonly IAlbumImageRepository<AlbumImage> _repo;
        public AlbumImageService(IAlbumImageRepository<AlbumImage> repo)
        {
            _repo = repo;
        }
        public async Task<AlbumImage> Create(AlbumImage albumImage)
        {
            return await _repo.Create(albumImage);
        }
        public async Task<bool> Update(AlbumImage newAlbumImage)
        {
            return await _repo.Update(newAlbumImage);
        }
        public async Task<AlbumImage> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public async Task<List<AlbumImage>> GetByPetId(Guid PetId, int pageNumber, int pageSize)
        {
            return await _repo.GetByPetId(PetId, pageSize, pageNumber);
        }
        public async Task<List<AlbumImage>> GetByCenterId(Guid CenterId, int pageNumber, int pageSize)
        {
            return await _repo.GetByCenterId(CenterId, pageSize, pageNumber);
        }
        public async Task<List<AlbumImage>> GetByCenterIdAndPetId(Guid CenterId, Guid PetId, int pageNumber, int pageSize)
        {
            return await _repo.GetByCenterIdAndPetId(CenterId, PetId, pageSize, pageNumber);
        }
        public List<AlbumImage> GetList(int pageNumber, int pageSize)
        {
            return _repo.GetList(pageNumber, pageSize);
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
    }
}
