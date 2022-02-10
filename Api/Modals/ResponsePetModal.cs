using System;
namespace Api.Modals
{
    public class ResponsePetModal
    {
        public string Name { get; set; }
        public string Status { get; set; }
        public string Gender { get; set; }
        public string Image { get; set; }
        public Guid AnimalId { get; set; }
        public Guid CustomerId { get; set; }
    }
}
