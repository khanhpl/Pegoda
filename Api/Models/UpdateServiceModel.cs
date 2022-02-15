using System;
namespace Api.Models
{
    public class UpdateServiceModel
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public float Price { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public int Duration { get; set; }
        public Guid CenterId { get; set; }
        public Guid AnimalId { get; set; }
    }
}
