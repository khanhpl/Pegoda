using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class UpdateUserModel
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Image { get; set; }
        public string Address { get; set; }
        public string Status { get; set; }
        public Guid RoleId { get; set; }
    }
}
