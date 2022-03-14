using System;
namespace Api.Models
{
    public class ResponseAlbumImageModel
    {
        public Guid Id { get; set; }
        public string UrlImage { get; set; }
        public Guid? CenterId { get; set; }
        public Guid? PetId { get; set; }
    }
}
