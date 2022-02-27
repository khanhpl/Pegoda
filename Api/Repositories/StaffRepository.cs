using System;
using System.Collections.Generic;
using System.Linq;
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
            _context.Staff.Remove(staff);
            await _context.SaveChangesAsync();
            return true;
        }

        public List<Staff> GetList(int pageNumber, int pageSize)
        {
            return _context.Staff.ToPagedList(pageNumber, pageSize).ToList();
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

        public async Task<bool> Update(Staff newStaff)
        {
            Staff staff = await _context.Staff.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newStaff.Id);
            if (staff == null)
            {
                return false;
            }
            _context.Staff.Update(newStaff);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}