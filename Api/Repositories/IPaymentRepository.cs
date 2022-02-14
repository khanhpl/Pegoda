using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IPaymentRepository<T>
    {
        Task<Payment> Create(Payment payment);
        Task<bool> Update(Payment payment);
        Task<Payment> GetById(Guid id);
        List<Payment> GetAll();
        Task<bool> Delete(Guid id);
    }
}
