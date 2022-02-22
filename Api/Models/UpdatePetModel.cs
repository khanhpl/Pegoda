﻿using System;
namespace Api.Models
{
    public class UpdatePetModel
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Status { get; set; }
        public string Gender { get; set; }
        public string Image { get; set; }
        public Guid AnimalId { get; set; }
        public Guid CustomerId { get; set; }
    }
}
