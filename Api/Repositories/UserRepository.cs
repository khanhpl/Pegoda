using System;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Api.Modals;
using Microsoft.EntityFrameworkCore;
using quiz_app_dotnet_api.Helper;

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
            await _context.User.AddAsync(user);
            await _context.SaveChangesAsync();
            return user;
        }
        public User GetByUserName(string username)
        {
            User user = _context.User.FirstOrDefault(u => u.Name == username);
            if (user == null)
            {
                return null;
            }
            return user;
        }

        public string Login(LoginModel loginModel)
        {
            User user = _context.User.FirstOrDefault(u => u.Email == loginModel.Email);
            if (user == null)
            {
                return null;
            }
            return _jwtHelper.generateJwtToken(user);
        }
        public async Task<bool> Delete(Guid id)
        {
            User user = await _context.User.FindAsync(id);
            _context.User.Remove(user);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<bool> Update(User newUser)
        {
            User user = await _context.User.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newUser.Id);
            if (user == null)
            {
                return false;
            }
            _context.User.Update(newUser);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
