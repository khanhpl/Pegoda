using System;
using System.ComponentModel.DataAnnotations;

namespace Api.Models
{
    public class ResponseServiceModel
    {
        public string Name { get; set; }
        public float Price { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public int Duration { get; set; }
        public string Status { get; set; }
        public Guid CenterId { get; set; }
        public Guid AnimalId { get; set; }
        public Guid ServiceTypeId { get; set; }
    }
}
