using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class Order
    {
        public Guid Id { get; set; }
        public DateTime Date { get; set; }
        public float TotalPrice { get; set; }
        public string Status { get; set; }
        public string Scores { get; set; }
        public string Feedback { get; set; }
        public Guid CenterId { get; set; }
        public virtual Center Center { get; set; }
        public Guid PetId { get; set; }
        public virtual Pet Pet { get; set; }
    }
}