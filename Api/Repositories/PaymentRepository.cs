using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;

namespace Api.Repositories
{
    public class PaymentRepository : IPaymentRepository<Payment>
    {
        private readonly DataContext _context;
        public PaymentRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Payment> Create(Payment payment)
        {
            await _context.Payments.AddAsync(payment);
            await _context.SaveChangesAsync();
            return payment;
        }

        public async Task<bool> Delete(Guid id)
        {
            Payment payment = await _context.Payments.FirstOrDefaultAsync(x => x.Id == id);
            if (payment == null)
            {
                return false;
            }
            _context.Payments.Remove(payment);
            await _context.SaveChangesAsync();
            return true;
        }

        public List<Payment> GetAll()
        {
            return _context.Payments.ToList();
        }

        public async Task<Payment> GetById(Guid id)
        {
            Payment payment = await _context.Payments.FirstOrDefaultAsync(x => x.Id == id);
            if (payment == null)
            {
                return null;
            }
            return payment;
        }

        public async Task<bool> Update(Payment newPayment)
        {
            Payment payment = await _context.Payments.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newPayment.Id);
            if (payment == null)
            {
                return false;
            }
            _context.Payments.Update(newPayment);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
