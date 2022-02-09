using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Modals
{
    public class CreateStaffModal
    {
        public string Name { get; set; }
        public string Gender { get; set; }
        public string Image { get; set; }
        public Guid CenterId { get; set; }
    }
}