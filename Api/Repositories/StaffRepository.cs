using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;

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
            await _context.Staffs.AddAsync(staff);
            await _context.SaveChangesAsync();
            return staff;
        }

        public async Task<bool> Delete(Guid id)
        {
            Staff staff = await _context.Staffs.FirstOrDefaultAsync(x => x.Id == id);
            if (staff == null)
            {
                return false;
            }
            _context.Staffs.Remove(staff);
            await _context.SaveChangesAsync();
            return true;
        }

        public List<Staff> GetAll()
        {
            return _context.Staffs.Include(x => x.Center).ToList();
        }

        public async Task<Staff> GetById(Guid id)
        {
            Staff staff = await _context.Staffs.FirstOrDefaultAsync(x => x.Id == id);
            if (staff == null)
            {
                return null;
            }
            return staff;
        }

        public async Task<bool> Update(Staff newStaff)
        {
            Staff staff = await _context.Staffs.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newStaff.Id);
            if (staff == null)
            {
                return false;
            }
            _context.Staffs.Update(newStaff);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}