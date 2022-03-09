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
        private readonly CustomerService _customerService;
        private readonly UserService _userService;
        public CustomerController(CustomerService customerService, UserService userService)
        {
            _customerService = customerService;
            _userService = userService;
        }
        [HttpPost("Register")]
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

            User user = new User
            {
                Name = newCustomer.Name,
                Email = newCustomer.Email,
                Address = newCustomer.Address,
                Image = newCustomer.Image,
                RoleId = new Guid("142ed46c-3d55-4c0f-cef7-08d9fb4fdece"),
            };

            await _userService.Create(user);

            await _customerService.Create(customer);
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
            bool check = await _customerService.Update(updateCustomer);
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
            Customer customer = await _customerService.GetById(id);
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
            List<Customer> listCustomers = _customerService.GetList();

            return Ok(listCustomers);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete customer by Id")]
        public async Task<ActionResult> Delete(Guid id)
        {
            bool check = await _customerService.Delete(id);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
    }
}
