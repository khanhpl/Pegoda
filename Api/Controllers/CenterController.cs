using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class CenterController : BaseApiController
    {
        private readonly CenterService _centerService;
        private readonly UserService _userService;
        private readonly IDistributedCache _distributedCache;
        public CenterController(CenterService centerService, UserService userService, IDistributedCache distributedCache)
        {
            _centerService = centerService;
            _userService = userService;
            _distributedCache = distributedCache;
        }
        [HttpPost("Register")]
        [SwaggerOperation(Summary = "Create new center")]
        public async Task<ActionResult> Create(ResponseCenterModel newCenter)
        {
            Center center = new Center
            {
                Name = newCenter.Name,
                Email = newCenter.Email,
                Description = newCenter.Description,
                Address = newCenter.Address,
                Longitude = newCenter.Longitude,
                Latitude = newCenter.Latitude
            };
            User user = new User
            {
                Name = newCenter.Name,
                Email = newCenter.Email,
                Address = newCenter.Address,
                RoleId = new Guid("4aed7714-efbe-421c-5f5a-08d9f62291f6"),
            };
            User tempUser = await _userService.Create(user);
            if (tempUser == null)
            {
                return BadRequest(new { message = "Email has exist" });
            }

            await _centerService.Create(center);
            return CreatedAtAction(nameof(GetById), new { id = center.Id }, center);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update center")]
        public async Task<ActionResult> Update(Guid id, Center updateCenter)
        {
            if (id != updateCenter.Id)
            {
                return BadRequest();
            }
            bool check = await _centerService.Update(updateCenter);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get center by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Center center = await _centerService.GetById(id);
            if (center == null)
            {
                return NotFound();
            }
            return Ok(center);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete center by Id")]
        public async Task<ActionResult> Delete(Guid id)
        {
            bool check = await _centerService.Delete(id);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Search by name and address and pagination")]
        public async Task<ActionResult<dynamic>> SearchByAddressAndName(String name, String address, int pageNumber, int pageSize)
        {
            if (name == null || address == null)
            {
                // List<Center> listCenters = new List<Center>();
                var cacheKey = "listCenter";
                string serializedListCenter;
                var listCenter = new List<Center>();
                try
                {
                    var redisListCenter = await _distributedCache.GetAsync(cacheKey);
                    if (redisListCenter != null)
                    {
                        serializedListCenter = Encoding.UTF8.GetString(redisListCenter);
                        listCenter = JsonConvert.DeserializeObject<List<Center>>(serializedListCenter);
                    }
                    else
                    {
                        listCenter = _centerService.GetList(pageNumber, pageSize);
                        serializedListCenter = JsonConvert.SerializeObject(listCenter);
                        redisListCenter = Encoding.UTF8.GetBytes(serializedListCenter);
                        var options = new DistributedCacheEntryOptions()
                            .SetAbsoluteExpiration(DateTime.Now.AddMinutes(10))
                            .SetSlidingExpiration(TimeSpan.FromMinutes(2));
                        await _distributedCache.SetAsync(cacheKey, redisListCenter, options);
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                }
                // List<Center> listCenters = _centerService.GetList(pageNumber, pageSize);
                return Ok(listCenter);
            }
            else
            {
                List<Center> centers = await _centerService.SearchByAddressAndName(name, address, pageNumber, pageSize);
                if (centers == null)
                {
                    return null;
                }
                return centers;
            }
        }
    }
}
