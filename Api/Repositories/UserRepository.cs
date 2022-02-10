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
            await _context.Users.AddAsync(user);
            await _context.SaveChangesAsync();
            return user;
        }
        public User GetByUserName(string username)
        {
            User user = _context.Users.FirstOrDefault(u => u.Name == username);
            if (user == null)
            {
                return null;
            }
            return user;
        }

        public async Task<ResponseLoginModal> Login(LoginModal loginModal)
        {
            Customer customer = await _context.Customers.FirstOrDefaultAsync(x => x.Email == loginModal.Email);
            if (customer != null)
            {
                if (customer.Password != loginModal.Password)
                {
                    return null;
                }
                else
                {
                    string Token = _jwtHelper.generateJwtToken(customer);
                    ResponseLoginModal responseLoginModal = new ResponseLoginModal
                    {
                        Email = customer.Email,
                        Token = Token,
                    };
                    return responseLoginModal;
                }
            }
            return null;
        }
        public async Task<bool> Delete(Guid id)
        {
            User user = await _context.Users.FindAsync(id);
            _context.Users.Remove(user);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<bool> Update(User newUser)
        {
            User user = await _context.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newUser.Id);
            if (user == null)
            {
                return false;
            }
            _context.Users.Update(newUser);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<Customer> Register(Customer customer)
        {
            await _context.Customers.AddAsync(customer);
            await _context.SaveChangesAsync();
            return customer;
        }
    }
}
