using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class ResponsePaymentModel
    {
        [Required(ErrorMessage = "Please enter status")]
        public string Name { get; set; }
        [Required]
        [Range(0, 99999999, ErrorMessage = "Please enter correct value")]
        public int Amount { get; set; }
        [Required]
        [Range(0, 999999, ErrorMessage = "Please enter correct code")]
        public string PaymentCode { get; set; }
        [Required(ErrorMessage = "Please enter image")]
        public string Image { get; set; }
        [Required]
        public Guid OrderId { get; set; }
    }
}
