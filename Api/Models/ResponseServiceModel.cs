using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class ResponseServiceModel
    {
        [Required(ErrorMessage = "Please enter name"), MaxLength(100)]
        public string Name { get; set; }
        [Required]
        [Range(0, 999999999999999, ErrorMessage = "Please enter correct value")]
        public float Price { get; set; }
        [Required(ErrorMessage = "Please enter description")]
        public string Description { get; set; }
        [Required(ErrorMessage = "Please enter image")]
        public string Image { get; set; }
        [Required]
        [Range(0, 999999999, ErrorMessage = "Please enter correct value")]
        public int Duration { get; set; }
        [Required]
        public Guid CenterId { get; set; }
        [Required]
        public Guid AnimalId { get; set; }

    }
}
