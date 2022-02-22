using System;
namespace Api.Models
{
    public class ResponseCenterModel
    {

        public string Name { get; set; }
        public string Service { get; set; }
        public string Address { get; set; }
        public float Longitude { get; set; }
        public float Latitude { get; set; }
    }
}
