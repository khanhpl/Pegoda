using System;
namespace Api.Models
{
    public class UpdateCustomerModel
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string Image { get; set; }
        public string Address { get; set; }
        public Guid CenterId { get; set; }
    }
}
