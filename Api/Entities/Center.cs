using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class Center
    {
        [Required]
        public Guid Id { get; set; }
        [Required(ErrorMessage = "Please enter name"), MaxLength(100)]
        public string Name { get; set; }
        [Required(ErrorMessage = "Please enter name")]
        public string Service { get; set; }
        [Required(ErrorMessage = "Please enter name")]
        public string Address { get; set; }
        [Required]
        [Range(0.0, 99999999, ErrorMessage = "Please enter correct value")]
        public float Longitude { get; set; }
        [Required]
        [Range(0.0, 99999999, ErrorMessage = "Please enter correct value")]
        public float Latitude { get; set; }
    }
}