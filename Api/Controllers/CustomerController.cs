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
    public class CustomerController : BaseApiController
    {
        private readonly CustomerService _service;
        public CustomerController(CustomerService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new customer")]
        public async Task<ActionResult> Create(ResponseCustomerModel newCustomer)
        {
            Customer customer = new Customer
            {
                Name = newCustomer.Name,
                Email = newCustomer.Email,
                Age = newCustomer.Age,
                Gender = newCustomer.Gender,
                Image = newCustomer.Image,
                Address = newCustomer.Address
            };

            await _service.Create(customer);
            return CreatedAtAction(nameof(GetById), new { id = customer.Id }, customer);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update customer")]
        public async Task<ActionResult> Update(Guid id, Customer updateCustomer)
        {
            if (id != updateCustomer.Id)
            {
                return BadRequest();
            }
            bool check = await _service.Update(updateCustomer);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get customer by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Customer customer = await _service.GetById(id);
            if (customer == null)
            {
                return NotFound();
            }
            return Ok(customer);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get list customer")]
        public ActionResult GetList()
        {
            List<Customer> listCustomers = _service.GetList();

            return Ok(listCustomers);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete customer by Id")]
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
