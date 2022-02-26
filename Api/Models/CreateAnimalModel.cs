using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Models
{
    public class CreateAnimalModel
    {
        [Required(ErrorMessage = "Please enter name"), MaxLength(100)]
        public string Type { get; set; }
    }
}