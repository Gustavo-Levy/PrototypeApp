using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrototypeApp.Logic
{
    internal class Rental
    {
        public int RentalId { get; set; }
        public int CustomerId { get; set; }
        public int EquipmentId { get; set; }
        public string LastName { get; set; }
        public DateTime RentalDate { get; set; }
        public DateTime ReturnDate { get; set; }
        public double FinalPrice { get; set; }


        public Rental(int rentalId, int customerId, int equipmentId, string lastName, DateTime rentalDate, DateTime returnDate, double finalPrice)
        {
            RentalId = rentalId;
            CustomerId = customerId;
            EquipmentId = equipmentId;
            LastName = lastName;
            RentalDate = rentalDate;
            ReturnDate = returnDate;
            FinalPrice = finalPrice;
        }

        public override string ToString()
        {
            return $"{RentalId}, {CustomerId}, {EquipmentId}, {LastName}, {RentalDate}, {ReturnDate}, {FinalPrice}";
        }
    }
}
