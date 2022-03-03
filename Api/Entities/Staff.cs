using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Policy;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class Staff
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
        public string Image { get; set; }
        public Guid CenterId { get; set; }
        public virtual Center Center { get; set; }
    }
}