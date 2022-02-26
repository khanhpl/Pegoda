using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class Order
    {
        [Required]
        public Guid Id { get; set; }
        [Required(ErrorMessage = "Please enter date")]
        [DataType(DataType.DateTime)]
        public DateTime Date { get; set; }
        [Required]
        [Range(0, 999999999999, ErrorMessage = "Please enter correct value")]
        public float TotalPrice { get; set; }
        [Required(ErrorMessage = "Please enter status")]
        public string Status { get; set; }
        [Required]
        [Range(0, 10, ErrorMessage = "Please enter correct value")]
        public string Scores { get; set; }
        [Required(ErrorMessage = "Please enter feedback")]
        public string Feedback { get; set; }
        [Required]
        public Guid CenterId { get; set; }
        public virtual Center Center { get; set; }
        [Required]
        public Guid PetId { get; set; }
        public virtual Pet Pet { get; set; }
    }
}