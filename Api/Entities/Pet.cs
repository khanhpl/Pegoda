using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class Pet
    {
        [Required]
        public Guid Id { get; set; }
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
        public virtual Animal Animal { get; set; }
        [Required]
        public Guid CustomerId { get; set; }
        public virtual Customer Customer { get; set; }
    }
}