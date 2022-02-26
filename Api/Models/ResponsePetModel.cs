using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class ResponsePetModel
    {
        [Required(ErrorMessage = "Please enter name"), MaxLength(100)]
        public string Name { get; set; }
        [Required(ErrorMessage = "Please enter status")]
        public string Status { get; set; }
        [Required(ErrorMessage = "Please enter gender")]
        public string Gender { get; set; }
        [Required(ErrorMessage = "Please enter image")]
        public string Image { get; set; }
        [Required]
        public Guid AnimalId { get; set; }
        [Required]
        public Guid CustomerId { get; set; }
    }
}
