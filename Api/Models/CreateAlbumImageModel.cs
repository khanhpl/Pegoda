using System;
namespace Api.Models
{
    public class CreateAlbumImageModel
    {
        public string UrlImage { get; set; }
        public Guid? CenterId { get; set; }
        public Guid? PetId { get; set; }
    }
}
