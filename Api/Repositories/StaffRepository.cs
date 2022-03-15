using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using X.PagedList;

namespace Api.Repositories
{
    public class StaffRepository : IStaffRepository<Staff>
    {
        private readonly DataContext _context;
        public StaffRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Staff> Create(Staff staff)
        {
            await _context.Staff.AddAsync(staff);
            await _context.SaveChangesAsync();
            return staff;
        }

        public async Task<bool> Delete(Guid id)
        {
            Staff staff = await _context.Staff.FirstOrDefaultAsync(x => x.Id == id);
            if (staff == null)
            {
                return false;
            }
            User user = await _context.User.AsNoTracking().FirstOrDefaultAsync(x => x.Email == staff.Email);
            if (user == null)
            {
                return false;
            }
            _context.Staff.Remove(staff);
            _context.User.Remove(user);
            await _context.SaveChangesAsync();
            return true;
        }

        public List<Staff> GetList(int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return _context.Staff.Include(x => x.Center).ToList();
            }
            return _context.Staff.Include(x => x.Center).ToPagedList(pageNumber, pageSize).ToList();
        }

        public async Task<Staff> GetById(Guid id)
        {
            Staff staff = await _context.Staff.FirstOrDefaultAsync(x => x.Id == id);
            if (staff == null)
            {
                return null;
            }
            return staff;
        }

        public async Task<List<Staff>> GetByCenterId(Guid CenterId, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.Staff.Where(x => x.CenterId.Equals(CenterId)).ToListAsync();
            }
            List<Staff> listStaff = await _context.Staff.Where(x => x.CenterId.Equals(CenterId)).ToPagedList(pageNumber, pageSize).ToListAsync();
            if (listStaff == null)
            {
                return null;
            }
            return listStaff;
        }

        public async Task<bool> Update(Staff newStaff)
        {
            Staff staff = await _context.Staff.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newStaff.Id);
            if (staff == null)
            {
                return false;
            }
            User user = await _context.User.AsNoTracking().FirstOrDefaultAsync(x => x.Email == newStaff.Email);
            if (user == null)
            {
                return false;
            }
            User newUser = new User()
            {
                Id = user.Id,
                Name = newStaff.Name,
                Email = newStaff.Email,
                Image = newStaff.Image,
                Address = user.Address,
                RoleId = user.RoleId,
            };
            _context.Staff.Update(newStaff);
            _context.User.Update(newUser);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}