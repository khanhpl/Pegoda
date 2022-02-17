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
    public class PaymentController : BaseApiController
    {
        private readonly PaymentService _service;
        public PaymentController(PaymentService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new payment")]
        public async Task<ActionResult> Create(ResponsePaymentModal newPayment)
        {
            Payment payment = new Payment
            {
                Name = newPayment.Name,
                Amount = newPayment.Amount,
                PaymentCode = newPayment.PaymentCode,
                Image = newPayment.Image,
                OrderId = newPayment.OrderId
            };
            await _service.Create(payment);
            return CreatedAtAction(nameof(GetById), new { id = payment.Id }, payment);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update payment")]
        public async Task<ActionResult> Update(Guid id, UpdatePaymentModel updatePayment)
        {
            if (id != updatePayment.Id)
            {
                return BadRequest();
            }
            Payment payment = new Payment
            {
                Id = updatePayment.Id,
                Name = updatePayment.Name,
                Amount = updatePayment.Amount,
                PaymentCode = updatePayment.PaymentCode,
                Image = updatePayment.Image,
                OrderId = updatePayment.OrderId
            };
            bool check = await _service.Update(payment);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get payment by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Payment payment = await _service.GetById(id);
            if (payment == null)
            {
                return NotFound();
            }
            return Ok(payment);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get list payment")]
        public ActionResult GetList()
        {
            List<Payment> listPayments = _service.GetList();

            return Ok(listPayments);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete payment by Id")]
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
