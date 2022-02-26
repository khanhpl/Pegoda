using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class ResponseRoleModel
    {
        [Required(ErrorMessage = "Please enter name"), MaxLength(30)]
        public string Name { get; set; }
    }
}
