using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class ResponseCustomerModel
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string Image { get; set; }
        public string Address { get; set; }
    }
}
