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
    public class CenterRepository : ICenterRepository<Center>
    {
        private readonly DataContext _context;
        public CenterRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Center> Create(Center center)
        {
            center.Status = "active";
            await _context.Center.AddAsync(center);
            await _context.SaveChangesAsync();
            return center;
        }
        public async Task<bool> Update(Center newCenter)
        {
            Center center = _context.Center.AsNoTracking().FirstOrDefault(x => x.Id == newCenter.Id && x.Status.Equals("active"));
            if (center == null)
            {
                return false;
            }
            User user = _context.User.AsNoTracking().FirstOrDefault(x => x.Email == newCenter.Email && x.Status.Equals("active"));
            if (user == null)
            {
                return false;
            }
            User newUser = new User()
            {
                Id = user.Id,
                Name = newCenter.Name,
                Email = user.Email,
                Image = user.Image,
                Address = newCenter.Address,
                RoleId = user.RoleId,
            };
            newUser.Status = "active";
            newCenter.Status = "active";
            _context.User.Update(newUser);
            _context.Center.Update(newCenter);
            await _context.SaveChangesAsync();
            return true;
        }
        public List<Center> GetAll()
        {
            return _context.Center.ToList();
        }
        public async Task<Center> GetById(Guid id)
        {
            Center center = await _context.Center.Where(x => x.Id == id && x.Status.Equals("active")).FirstOrDefaultAsync();
            if (center == null)
            {
                return null;
            }
            return center;
        }
        public List<Center> GetList(int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return _context.Center.Where(x => x.Status.Equals("active")).ToList();
            }
            return _context.Center.Where(x => x.Status.Equals("active")).ToPagedList(pageNumber, pageSize).ToList();
        }
        public async Task<bool> Delete(Guid id)
        {
            Center center = await _context.Center.FirstOrDefaultAsync(x => x.Id == id);
            if (center == null)
            {
                return false;
            }
            center.Status = "inactive";
            // _context.Center.Remove(center);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<List<Center>> SearchByAddressAndName(String name, String address, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.Center.Where(x => x.Name.Contains(name) || x.Address.Contains(address)).Where(x => x.Status.Equals("active")).ToListAsync();
            }
            List<Center> center = await _context.Center.Where((x => x.Name.Contains(name) || x.Address.Contains(address))).Where(x => x.Status.Equals("active")).ToPagedList(pageNumber, pageSize).ToListAsync();
            if (center == null)
            {
                return null;
            }
            return center;
        }
    }
}
