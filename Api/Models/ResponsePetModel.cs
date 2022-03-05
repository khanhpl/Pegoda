using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class ResponsePetModel
    {
        public string Name { get; set; }
        public string Status { get; set; }
        public string Gender { get; set; }
        public Guid AnimalId { get; set; }
        public Guid CustomerId { get; set; }
    }
}
