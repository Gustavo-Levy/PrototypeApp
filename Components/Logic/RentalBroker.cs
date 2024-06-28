using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;


namespace PrototypeApp.Logic
{
    internal class RentalBroker
    {
        private readonly SystemDB systemDB;

        public List<Rental> rentalList;
        public RentalBroker()
        {
            systemDB = new SystemDB();
            rentalList = new List<Rental>();
        }

        public Rental CreateNewRental( int rentalId, int customerId,int equipmentId, string lastName, DateTime rentalDate, DateTime returnDate, double totalCost)
        {
            return systemDB.CreateNewRental(rentalId, customerId, equipmentId, lastName, rentalDate, returnDate, totalCost);
        }

        public Rental SearchRental(int rentalId)
        {
            return systemDB.SearchRental(rentalId);
        }

        public void GenerateSalesByDateReport(DateTime startDate, DateTime endDate)
        {
            systemDB.GenerateSalesByDateReport(startDate, endDate);
        }

        public void GenerateSalesByCustomerReport()
        {
            systemDB.GenerateSalesByCustomerReport();
        }

        public void ListItemsByCategory()
        {
            systemDB.ListItemsByCategory();
        }
    }
}


