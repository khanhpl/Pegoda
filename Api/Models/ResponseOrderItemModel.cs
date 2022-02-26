using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class ResponseOrderItemModel
    {
        [Required]
        [Range(0, 999999999999, ErrorMessage = "Please enter correct value")]
        public float Price { get; set; }
        [Required]
        [Range(0, 99999999, ErrorMessage = "Please enter correct value")]
        public int Quantity { get; set; }
        [Required(ErrorMessage = "Please enter status")]
        public string Status { get; set; }
        [Required(ErrorMessage = "Please enter booking time")]
        [DataType(DataType.DateTime)]
        public DateTime BookingTime { get; set; }
        [Required(ErrorMessage = "Please enter start time")]
        [DataType(DataType.DateTime)]
        public DateTime StartTime { get; set; }
        [Required(ErrorMessage = "Please enter end time")]
        [DataType(DataType.DateTime)]
        public DateTime EndTime { get; set; }
        [Required]
        public Guid OrderId { get; set; }
        [Required]
        public Guid ServiceId { get; set; }
        [Required]
        public Guid StaffId { get; set; }
    }
}
