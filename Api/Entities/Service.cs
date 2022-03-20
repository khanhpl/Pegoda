using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class Service
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public float Price { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public int Duration { get; set; }
        public string Status { get; set; }
        public Guid CenterId { get; set; }
        public virtual Center Center { get; set; }
        public Guid AnimalId { get; set; }
        public virtual Animal Animal { get; set; }
        public Guid ServiceTypeId { get; set; }
        public virtual ServiceType ServiceType { get; set; }
    }
}