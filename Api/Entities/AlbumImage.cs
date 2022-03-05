using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class AlbumImage
    {
        public Guid Id { get; set; }
        public string UrlImage { get; set; }
        public Guid? CenterId { get; set; }
        public Center Center { get; set; }
        public Guid? PetId { get; set; }
        public Pet Pet { get; set; }
    }
}