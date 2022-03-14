using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IAlbumImageRepository<T>
    {
        Task<AlbumImage> Create(AlbumImage albumImage);
        Task<bool> Update(AlbumImage albumImage);
        Task<AlbumImage> GetById(Guid id);
        Task<List<AlbumImage>> GetByPetId(Guid PetId, int pageNumber, int pageSize);
        Task<List<AlbumImage>> GetByCenterId(Guid CenterId, int pageNumber, int pageSize);
        Task<List<AlbumImage>> GetByCenterIdAndPetId(Guid CenterId, Guid PetId, int pageNumber, int pageSize);
        List<AlbumImage> GetList(int pageNumber, int pageSize);
        Task<bool> Delete(Guid id);
    }
}
