using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Api.Models;
using Google.Apis.Logging;
using Google.Apis.Util;
using Microsoft.EntityFrameworkCore;
using quiz_app_dotnet_api.Helper;
using X.PagedList;

namespace Api.Repositories
{
    public class UserRepository : IUserRepository<User>
    {
        private readonly DataContext _context;
        private readonly IJwtHelper _jwtHelper;
        public UserRepository(DataContext context, IJwtHelper jwtHelper)
        {
            _context = context;
            _jwtHelper = jwtHelper;
        }
        public async Task<User> Create(User user)
        {
            User tempUser = _context.User.FirstOrDefault(u => u.Email == user.Email);
            if (tempUser == null)
            {
                user.Status = "active";
                await _context.User.AddAsync(user);
                await _context.SaveChangesAsync();
                return user;
            }
            return null;
        }
        public User GetByEmail(string email)
        {
            User user = _context.User.FirstOrDefault(u => u.Email == email && u.Status.Equals("active"));
            if (user == null)
            {
                return null;
            }
            return user;
        }

        public string Login(string email)
        {
            User user = _context.User.FirstOrDefault(u => u.Email == email && u.Status.Equals("active"));
            if (user == null)
            {
                return null;
            }
            Role role = _context.Role.FirstOrDefault(u => u.Id == user.RoleId);
            Center center;
            Staff staff;
            Customer customer;
            Guid centerId = Guid.Empty;
            Guid id = Guid.Empty;
            if (role.Name == "CENTER")
            {
                center = _context.Center.FirstOrDefault(c => c.Email == user.Email && c.Status.Equals("active"));
                centerId = center.Id;
                id = center.Id;
            }
            else if (role.Name == "STAFF")
            {
                staff = _context.Staff.FirstOrDefault(s => s.Email == user.Email && s.Status.Equals("active"));
                centerId = staff.CenterId;
                id = staff.Id;
            }
            else if (role.Name == "CUSTOMER")
            {
                customer = _context.Customer.FirstOrDefault(x => x.Email == user.Email && x.Status.Equals("active"));
                id = customer.Id;
            }
            return _jwtHelper.generateJwtToken(user, role, centerId, id);
        }
        public async Task<bool> Delete(Guid id)
        {
            User user = await _context.User.FirstOrDefaultAsync(u => u.Id == id && u.Status == "active");
            // _context.User.Remove(user);
            user.Status = "inactive";
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<bool> Update(User newUser)
        {
            newUser.Status = "active";
            User user = await _context.User.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newUser.Id && x.Status.Equals("active"));
            if (user == null)
            {
                return false;
            }
            _context.User.Update(newUser);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<List<User>> GetList(Guid roleId, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return await _context.User.Where(x => x.RoleId == roleId && x.Status.Equals("active")).ToListAsync();
            }
            else
            {
                return await _context.User.Where(x => x.RoleId == roleId && x.Status.Equals("active")).ToPagedList(pageNumber, pageSize).ToListAsync();
            }
        }
    }
}
