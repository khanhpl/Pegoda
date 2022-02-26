using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class ResponseOrderModel
    {
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
        [Required]
        public Guid PetId { get; set; }
    }
}
