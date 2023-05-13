﻿
using Accounting.DataLayer;
using Accounting.DataLayer.Repositories;
using Accounting.DataLayer.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ICustomerRepository customer= new CustomerRepository();
            Customers AddCustomer = new Customers()
            {
                FullName ="علی مولایی",
                Mobile = "09166666666",
                CustomerImage = "ندارد",
            };
            customer.InsertCustomer(AddCustomer);
            customer.Save();

           
            var list =customer.GetAllCustomers().ToList();
        }
    }
}
