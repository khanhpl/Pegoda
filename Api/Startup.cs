using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Api.Repositories;
using Api.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using quiz_app_dotnet_api.Helper;

namespace Api
{
    public class Startup
    {
        private readonly IConfiguration _config;
        public Startup(IConfiguration configuration)
        {
            _config = configuration;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<DataContext>(options => options.UseSqlServer(_config.GetConnectionString("DbConnection")));
            services.AddRouting(options => options.LowercaseUrls = true);

            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(options =>
            {
                options.SaveToken = true;
                options.RequireHttpsMetadata = false;
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuerSigningKey = true,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["JWT:Key"])),
                    RoleClaimType = "Role" // important
                };
            });

            services.AddCors(options =>
            {
                options.AddDefaultPolicy(builder =>
                {
                    builder.WithOrigins("http://localhost:3000", "http://localhost:3001", "https://www.pegoda.xyz")
                        .AllowAnyHeader()
                        .AllowAnyMethod()
                        .AllowCredentials();
                });
            });

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.EnableAnnotations();
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Api", Version = "v1" });
            });
            services.AddTransient<IRoleRepository<Role>, RoleRepository>();
            services.AddTransient<RoleService, RoleService>();
            services.AddTransient<IAnimalRepository<Animal>, AnimalRepository>();
            services.AddTransient<AnimalService, AnimalService>();
            services.AddTransient<ICenterRepository<Center>, CenterRepository>();
            services.AddTransient<CenterService, CenterService>();
            services.AddTransient<IServiceRepository<Service>, ServiceRepository>();
            services.AddTransient<ServiceService, ServiceService>();
            services.AddTransient<ICustomerRepository<Customer>, CustomerRepository>();
            services.AddTransient<CustomerService, CustomerService>();
            services.AddTransient<IPetRepository<Pet>, PetRepository>();
            services.AddTransient<PetService, PetService>();
            services.AddTransient<IOrderRepository<Order>, OrderRepository>();
            services.AddTransient<OrderService, OrderService>();
            services.AddTransient<IOrderItemRepository<OrderItem>, OrderItemRepository>();
            services.AddTransient<OrderItemService, OrderItemService>();
            services.AddTransient<IStaffRepository<Staff>, StaffRepository>();
            services.AddTransient<StaffService, StaffService>();
            services.AddTransient<IUserRepository<User>, UserRepository>();
            services.AddTransient<UserService, UserService>();
            services.AddTransient<IPaymentRepository<Payment>, PaymentRepository>();
            services.AddTransient<PaymentService, PaymentService>();
            services.AddTransient<IJwtHelper, JwtHelper>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            // if (env.IsDevelopment())
            // {
            app.UseDeveloperExceptionPage();
            app.UseSwagger();
            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Api v1"));
            // }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseCors();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
