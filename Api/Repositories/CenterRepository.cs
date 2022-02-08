using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;

namespace Api.Repositories
{
    public class CenterRepository : ICenterRepository<Center>
    {
        private readonly DataContext _context;
        public CenterRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Center> Create(Center center)
        {
            await _context.Centers.AddAsync(center);
            await _context.SaveChangesAsync();
            return center;
        }
        public async Task<bool> Update(Center newCenter)
        {
            Center center = _context.Centers.AsNoTracking().FirstOrDefault(x => x.Id == newCenter.Id);
            if (center == null)
            {
                return false;
            }
            _context.Centers.Update(newCenter);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<Center> GetById(Guid id)
        {
            Center center = await _context.Centers.Where(x => x.Id == id).FirstOrDefaultAsync();
            if (center == null)
            {
                return null;
            }
            return center;
        }
        public List<Center> GetAll()
        {
            return _context.Centers.ToList();
        }
        public async Task<bool> Delete(Guid id)
        {
            Center center = await _context.Centers.FirstOrDefaultAsync(x => x.Id == id);
            if (center == null)
            {
                return false;
            }
            _context.Centers.Remove(center);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
