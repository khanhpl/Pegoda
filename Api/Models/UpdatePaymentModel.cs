using System;
namespace Api.Models
{
    public class UpdatePaymentModel
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public int Amount { get; set; }
        public string PaymentCode { get; set; }
        public string Image { get; set; }
        public Guid OrderId { get; set; }
    }
}
