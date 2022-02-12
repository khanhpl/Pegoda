﻿using System;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Api.Modals;
using Microsoft.EntityFrameworkCore;

namespace Api.Repositories
{
    public class UserRepository : IUserRepository<User>
    {
        private readonly DataContext _context;
        public UserRepository(DataContext context)
        {
            _context = context;
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

        //public bool Login(LoginModal loginModal)
        //{
        //    User user = _context.Users.FirstOrDefault(u => u.Name == loginModal.Name);
        //    if (user == null)
        //    {
        //        return false;
        //    }
        //    if (user.Password == loginModal.Password)
        //    {
        //        return true;
        //    }
        //    return false;
        //}
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
    }
}