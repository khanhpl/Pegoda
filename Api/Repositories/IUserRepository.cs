using System;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;

namespace Api.Repositories
{
    public interface IUserRepository<T>
    {
        Task<User> Create(User user);
        Task<ResponseLoginModal> Login(LoginModal loginModal);
        Task<Customer> Register(Customer customer);
        User GetByUserName(string username);
        Task<bool> Delete(Guid id);
        Task<bool> Update(User newUser);
    }
}
