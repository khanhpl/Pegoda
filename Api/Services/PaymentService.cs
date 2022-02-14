using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class PaymentService
    {
        private readonly IPaymentRepository<Payment> _repo;
        public PaymentService(IPaymentRepository<Payment> repo)
        {
            _repo = repo;
        }
        public async Task<Payment> Create(Payment payment)
        {
            return await _repo.Create(payment);
        }
        public async Task<bool> Update(Payment newPayment)
        {
            return await _repo.Update(newPayment);
        }
        public async Task<Payment> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public List<Payment> GetAll()
        {
            return _repo.GetAll();
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
    }
}
