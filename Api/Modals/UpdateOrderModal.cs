using System;
namespace Api.Modals
{
    public class UpdateOrderModal
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
