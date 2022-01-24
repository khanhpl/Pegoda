using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class OrderItem
    {
        public Guid Id { get; set; }
        public float Price { get; set; }
        public int Quantity { get; set; }
        public string Status { get; set; }
        public DateTime BookingTime { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public Guid OrderId { get; set; }
        public virtual Order Order { get; set; }
        public Guid ServiceId { get; set; }
        public virtual Service Service { get; set; }
        public Guid StaffId { get; set; }
        public virtual Staff Staff { get; set; }
    }
}