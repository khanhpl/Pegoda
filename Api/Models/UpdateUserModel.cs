using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class UpdateUserModel
    {
        [Required]
        public Guid Id { get; set; }
        [Required(ErrorMessage = "Please enter name"), MaxLength(30)]
        public string Name { get; set; }
        [DataType(DataType.EmailAddress)]
        [Required(ErrorMessage = "Please enter email correct format")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Please enter image")]
        public string Image { get; set; }
        [Required(ErrorMessage = "Please enter address")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Please enter role ID")]
        public Guid RoleId { get; set; }
    }
}
