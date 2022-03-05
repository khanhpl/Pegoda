using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class AlbumImageController : BaseApiController
    {
        private readonly AlbumImageService _service;
        public AlbumImageController(AlbumImageService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new album image")]
        public async Task<ActionResult> Create(CreateAlbumImageModel newAlbumImage)
        {
            AlbumImage albumImage = new AlbumImage
            {
                UrlImage = newAlbumImage.UrlImage,
                PetId  = newAlbumImage.PetId,
                CenterId = newAlbumImage.CenterId
            };
            await _service.Create(albumImage);
            return CreatedAtAction(nameof(GetById), new { id = albumImage.Id }, albumImage);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update album image")]
        public async Task<ActionResult> Update(Guid id, ResponseAlbumImageModel updateAlbumImage)
        {
            if (id != updateAlbumImage.Id)
            {
                return BadRequest();
            }
            AlbumImage albumImage = new AlbumImage
            {
                Id = updateAlbumImage.Id,
                CenterId = updateAlbumImage.CenterId,
                PetId = updateAlbumImage.PetId,
                UrlImage = updateAlbumImage.UrlImage
            };
            bool check = await _service.Update(albumImage);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get album image by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            AlbumImage albumImage = await _service.GetById(id);
            if (albumImage == null)
            {
                return NotFound();
            }
            ResponseAlbumImageModel responseAlbumImageModel = new ResponseAlbumImageModel
            {
                Id = albumImage.Id,
                CenterId = albumImage.CenterId,
                PetId = albumImage.PetId,
                UrlImage = albumImage.UrlImage

            };
            return Ok(responseAlbumImageModel);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get album image by Center Id or by Pet Id and pagination")]
        public async Task<List<AlbumImage>> GetByCenterIdOrPetId(Guid CenterId, Guid PetId, int pageNumber, int pageSize)
        {
            if (CenterId == Guid.Empty || PetId == Guid.Empty)
            {
                return _service.GetList(pageNumber, pageSize);
            }
            else if (CenterId != Guid.Empty)
            {
                List<AlbumImage> listAlbumImagesByCenterId = await _service.GetByCenterId(CenterId, pageNumber, pageSize);

                return listAlbumImagesByCenterId;
            }
            else if (PetId != Guid.Empty)
            {
                List<AlbumImage> listAlbumImagesByPetId = await _service.GetByCenterId(PetId, pageNumber, pageSize);

                return listAlbumImagesByPetId;
            }
            return _service.GetList(pageNumber, pageSize);
        }

        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete Staff by Id")]
        public async Task<ActionResult> Delete(Guid id)
        {
            bool check = await _service.Delete(id);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
    }
}
