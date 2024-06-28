using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrototypeApp.Logic
{
    internal class RentalItem
    {
        private int EquipmentId { get; set; }
        private DateTime RentalDate { get; set; }
        private DateTime ReturnDate { get; set; }
        private double Total { get; set; }


        public RentalItem(int equipmentId, DateTime rentalDate, DateTime returnDate, double total)
        {
            EquipmentId = equipmentId;
            RentalDate = rentalDate;
            ReturnDate = returnDate;
            Total = total;
        }

        public override string ToString()
        {
            return $"{EquipmentId}, {RentalDate}, {ReturnDate}, {Total}";
        }
    }
}
