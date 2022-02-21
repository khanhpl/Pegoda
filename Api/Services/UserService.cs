using System;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;
using Api.Repositories;

namespace Api.Services
{
    public class UserService
    {
        private readonly IUserRepository<User> _repo;
        public UserService(IUserRepository<User> repo)
        {
            _repo = repo;
        }
        public async Task<User> Create(User user)
        {
            return await _repo.Create(user);
        }
        public string Login(LoginModel loginModel)
        {
            return _repo.Login(loginModel);
        }
        public User GetByUserName(string username)
        {
            return _repo.GetByUserName(username);
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
        public async Task<bool> Update(User newUser)
        {
            return await _repo.Update(newUser);
        }
    }
}
