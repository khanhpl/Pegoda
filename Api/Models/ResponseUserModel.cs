using System;
namespace Api.Models
{
    public class ResponseUserModal
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string Image { get; set; }
        public string Address { get; set; }
        public Guid RoleId { get; set; }
    }
}
