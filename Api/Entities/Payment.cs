using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class Payment
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public int Amount { get; set; }
        public string PaymentCode { get; set; }
        public string Image { get; set; }
        public Guid OrderId { get; set; }
        public virtual Order Order { get; set; }
    }
}