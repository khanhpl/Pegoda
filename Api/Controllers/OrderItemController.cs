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
    public class OrderItemController : BaseApiController
    {
        private readonly OrderItemService _service;
        public OrderItemController(OrderItemService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new order item")]
        public async Task<ActionResult> Create(ResponseOrderItemModel newOrderItem)
        {
            OrderItem orderItem = new OrderItem
            {
                Price = newOrderItem.Price,
                Quantity = newOrderItem.Quantity,
                Status = newOrderItem.Status,
                BookingTime = newOrderItem.BookingTime,
                StartTime = newOrderItem.StartTime,
                EndTime = newOrderItem.EndTime,
                OrderId = newOrderItem.OrderId,
                ServiceId = newOrderItem.ServiceId,
                StaffId = newOrderItem.StaffId
            };

            await _service.Create(orderItem);
            return CreatedAtAction(nameof(GetById), new { id = orderItem.Id }, orderItem);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update order item")]
        public async Task<ActionResult> Update(Guid id, UpdateOrderItemModel updateOrderItem)
        {
            if (id != updateOrderItem.Id)
            {
                return BadRequest();
            }
            OrderItem orderItem = new OrderItem
            {
                Id = updateOrderItem.Id,
                Price = updateOrderItem.Price,
                Quantity = updateOrderItem.Quantity,
                Status = updateOrderItem.Status,
                BookingTime = updateOrderItem.BookingTime,
                StartTime = updateOrderItem.StartTime,
                EndTime = updateOrderItem.EndTime,
                OrderId = updateOrderItem.OrderId,
                ServiceId = updateOrderItem.ServiceId,
                StaffId = updateOrderItem.StaffId
            };
            bool check = await _service.Update(orderItem);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get order item by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            OrderItem orderItem = await _service.GetById(id);
            if (orderItem == null)
            {
                return NotFound();
            }
            return Ok(orderItem);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get list order item")]
        public ActionResult GetAll()
        {
            List<OrderItem> listOrderItems = _service.GetList();

            return Ok(listOrderItems);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete order item by Id")]
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
