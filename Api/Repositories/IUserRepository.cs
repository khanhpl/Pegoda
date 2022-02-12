﻿using System;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;

namespace Api.Repositories
{
    public interface IUserRepository<T>
    {
        Task<User> Create(User user);
        //bool Login(LoginModal user);
        User GetByUserName(string username);
        Task<bool> Delete(Guid id);
        Task<bool> Update(User newUser);
    }
}