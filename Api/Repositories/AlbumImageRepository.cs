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
    public class AlbumImageRepository : IAlbumImageRepository<AlbumImage>
    {
        private readonly DataContext _context;
        public AlbumImageRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<AlbumImage> Create(AlbumImage albumImage)
        {
            await _context.AlbumImage.AddAsync(albumImage);
            await _context.SaveChangesAsync();
            return albumImage;
        }

        public async Task<bool> Delete(Guid id)
        {
            AlbumImage albumImage = await _context.AlbumImage.FirstOrDefaultAsync(x => x.Id == id);
            if (albumImage == null)
            {
                return false;
            }
            _context.AlbumImage.Remove(albumImage);
            await _context.SaveChangesAsync();
            return true;
        }

        public List<AlbumImage> GetList(int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return _context.AlbumImage.ToList();
            }
            return _context.AlbumImage.ToPagedList(pageNumber, pageSize).ToList();
        }

        public async Task<AlbumImage> GetById(Guid id)
        {
            AlbumImage albumImage = await _context.AlbumImage.FirstOrDefaultAsync(x => x.Id == id);
            if (albumImage == null)
            {
                return null;
            }
            return albumImage;
        }

        public async Task<List<AlbumImage>> GetByPetId(Guid PetId, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.AlbumImage.Where(x => x.PetId.Equals(PetId)).ToListAsync();
            }
            List<AlbumImage> listAlbumImage = await _context.AlbumImage.Where(x => x.PetId.Equals(PetId)).ToPagedList(pageNumber, pageSize).ToListAsync();
            if (listAlbumImage == null)
            {
                return null;
            }
            return listAlbumImage;
        }

        public async Task<List<AlbumImage>> GetByCenterId(Guid CenterId, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.AlbumImage.Where(x => x.CenterId.Equals(CenterId)).ToListAsync();
            }
            List<AlbumImage> listAlbumImage = await _context.AlbumImage.Where(x => x.CenterId.Equals(CenterId)).ToPagedList(pageNumber, pageSize).ToListAsync();
            if (listAlbumImage == null)
            {
                return null;
            }
            return listAlbumImage;
        }

        public async Task<bool> Update(AlbumImage newAlbumImage)
        {
            AlbumImage albumImage = await _context.AlbumImage.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newAlbumImage.Id);
            if (albumImage == null)
            {
                return false;
            }
            _context.AlbumImage.Update(newAlbumImage);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
