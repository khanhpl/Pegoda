using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;

namespace Api.Repositories
{
    public interface IUserRepository<T>
    {
        Task<User> Create(User user);
        string Login(string email);
        User GetByEmail(string email);
        Task<List<User>> GetList(Guid roleId, int pageNumber, int pageSize);
        Task<bool> Delete(Guid id);
        Task<bool> Update(User newUser);
    }
}
