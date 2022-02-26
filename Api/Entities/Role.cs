using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class Role
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
    }
}