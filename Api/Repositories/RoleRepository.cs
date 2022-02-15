using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;

namespace Api.Repositories
{
    public class RoleRepository : IRoleRepository<Role>
    {
        private readonly DataContext _context;
        public RoleRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Role> Create(Role role)
        {
            await _context.Role.AddAsync(role);
            await _context.SaveChangesAsync();
            return role;
        }
        public async Task<bool> Update(Role newRole)
        {
            Role role = _context.Role.AsNoTracking().FirstOrDefault(x => x.Id == newRole.Id);
            if (role == null)
            {
                return false;
            }
            _context.Role.Update(newRole);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<Role> GetById(Guid id)
        {
            Role role = await _context.Role.Where(x => x.Id == id).FirstOrDefaultAsync();
            if (role == null)
            {
                return null;
            }
            return role;
        }
        public List<Role> GetList()
        {
            return _context.Role.ToList();
        }
        public async Task<bool> Delete(Guid id)
        {
            Role role = await _context.Role.FirstOrDefaultAsync(x => x.Id == id);
            if (role == null)
            {
                return false;
            }
            _context.Role.Remove(role);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
