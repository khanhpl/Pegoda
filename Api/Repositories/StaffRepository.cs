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
            staff.Status = "active";
            await _context.Staff.AddAsync(staff);
            await _context.SaveChangesAsync();
            return staff;
        }

        public async Task<bool> Delete(Guid id)
        {
            Staff staff = await _context.Staff.FirstOrDefaultAsync(x => x.Id == id && x.Status.Equals("active"));
            if (staff == null)
            {
                return false;
            }
            staff.Status = "inactive";
            // _context.Staff.Remove(staff);
            await _context.SaveChangesAsync();
            return true;
        }

        public List<Staff> GetList(int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return _context.Staff.Where(x => x.Status.Equals("active")).Include(x => x.Center).ToList();
            }
            return _context.Staff.Where(x => x.Status.Equals("active")).Include(x => x.Center).ToPagedList(pageNumber, pageSize).ToList();
        }

        public async Task<Staff> GetById(Guid id)
        {
            Staff staff = await _context.Staff.FirstOrDefaultAsync(x => x.Id == id && x.Status.Equals("active"));
            if (staff == null)
            {
                return null;
            }
            return staff;
        }

        public async Task<List<Staff>> SearchByName(String name, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.Staff.Where(x => x.Name.Contains(name) && x.Status.Equals("active")).ToListAsync();
            }
            List<Staff> staffs = await _context.Staff.Where(x => x.Name.Contains(name) && x.Status.Equals("active")).ToPagedList(pageNumber, pageSize).ToListAsync();
            if (staffs == null)
            {
                return null;
            }
            return staffs;
        }
        public async Task<List<Staff>> SearchByCenterId(Guid centerId, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.Staff.Where(x => x.CenterId.Equals(centerId) && x.Status.Equals("active")).ToListAsync();
            }
            List<Staff> staffs = await _context.Staff.Where(x => x.CenterId.Equals(centerId) && x.Status.Equals("active")).ToPagedList(pageNumber, pageSize).ToListAsync();
            if (staffs == null)
            {
                return null;
            }
            return staffs;
        }
        public async Task<List<Staff>> SearchByNameAndCenterId(Guid centerId, String name, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.Staff.Where(x => (x.CenterId.Equals(centerId)) && x.Name.Contains(name) && x.Status.Equals("active")).ToListAsync();
            }
            List<Staff> staffs = await _context.Staff.Where(x => (x.CenterId.Equals(centerId)) && x.Name.Contains(name) && x.Status.Equals("active")).ToPagedList(pageNumber, pageSize).ToListAsync();
            if (staffs == null)
            {
                return null;
            }
            return staffs;
        }

        public async Task<bool> Update(Staff newStaff)
        {
            Staff staff = await _context.Staff.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newStaff.Id && x.Status.Equals("active"));
            if (staff == null)
            {
                return false;
            }
            User user = await _context.User.AsNoTracking().FirstOrDefaultAsync(x => x.Email == newStaff.Email && x.Status.Equals("active"));
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