using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class OrderController : BaseApiController
    {
        private readonly OrderService _service;
        public OrderController(OrderService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new order")]
        public async Task<ActionResult> Create(ResponseOrderModel newOrder)
        {
            Order order = new Order
            {
                Date = newOrder.Date,
                TotalPrice = newOrder.TotalPrice,
                Status = newOrder.Status,
                Scores = newOrder.Scores,
                Feedback = newOrder.Feedback,
                CenterId = newOrder.CenterId,
                PetId = newOrder.PetId
            };
            await _service.Create(order);
            return CreatedAtAction(nameof(GetById), new { id = order.Id }, order);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update order")]
        public async Task<ActionResult> Update(Guid id, UpdateOrderModel updateOrder)
        {
            if (id != updateOrder.Id)
            {
                return BadRequest();
            }
            Order order = new Order
            {
                Id = updateOrder.Id,
                Date = updateOrder.Date,
                TotalPrice = updateOrder.TotalPrice,
                Status = updateOrder.Status,
                Scores = updateOrder.Scores,
                Feedback = updateOrder.Feedback,
                CenterId = updateOrder.CenterId,
                PetId = updateOrder.PetId
            };
            bool check = await _service.Update(order);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get order by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Order order = await _service.GetById(id);
            if (order == null)
            {
                return NotFound();
            }
            return Ok(order);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get list order and list order by centerId and pagination")]
        public ActionResult GetList(int pageNumber, int pageSize, Guid centerId)
        {
            var listOrders = _service.GetList(pageNumber, pageSize, centerId);

            return Ok(listOrders);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete order by Id")]
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
