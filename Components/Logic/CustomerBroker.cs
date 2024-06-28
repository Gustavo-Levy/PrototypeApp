using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;


namespace PrototypeApp.Logic
{
    internal class CustomerBroker : SystemDB
    {
        private readonly MySqlConnection? connection;

        SystemDB systemDB;

        public List<Customer> customerList;


        public CustomerBroker(SystemDB systemDB)
        {
            this.systemDB = systemDB;
            this.systemDB.Initialize();
            customerList = new List<Customer>();

        }

        public Customer CreateCustomer(string lastName, string firstName, string phoneNumber, string emailAddress)
        {
            int newCustomerId = GetNewCustomerId(); // Assuming a method to get a new unique customer ID
            Customer newCustomer = new(newCustomerId, lastName, firstName, phoneNumber, emailAddress, false);

            systemDB.CreateNewCustomer(lastName, firstName, phoneNumber, emailAddress);
            return newCustomer;
        }

        public void ModifyCustomer(Customer customer)
        {
            systemDB.UpdateCustomerInfo(customer.CustomerId, customer.LastName, customer.FirstName, customer.PhoneNumber, customer.EmailAddress);
        }

        public void BanCustomer(int customerId)
        {
            // Assuming a method to fetch customer details from the database
            Customer customer = systemDB.SearchCustomer(customerId);
            if (customer != null)
            {
                customer.Banned = true;
                ModifyCustomer(customer);
            }
            else
            {
                Console.WriteLine("Customer with ID {0} not found.", customerId);
            }
        }


        public Customer SearchCustomer(int customerId)
        {
            return systemDB.SearchCustomer(customerId);
        }

        public static int GetNewCustomerId()
        {
            Random random = new Random();
            return random.Next(1000, 9999);
        }
    }
}

