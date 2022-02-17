using System;
namespace Api.Models
{
    public class UpdateOrderModel
    {
        public Guid Id { get; set; }
        public DateTime Date { get; set; }
        public float TotalPrice { get; set; }
        public string Status { get; set; }
        public string Scores { get; set; }
        public string Feedback { get; set; }
        public Guid CenterId { get; set; }
        public Guid PetId { get; set; }
    }
}
