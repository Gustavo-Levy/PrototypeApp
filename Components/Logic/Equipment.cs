using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrototypeApp.Logic
{ 
    internal class Equipment
    {
        public int EquipmentId { get; set; }
        public string Name { get; set; }
        public double DailyCost { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; }

        public Equipment(int equipmentId, string name, string description, double dailyCost, int categoryId)
        {
            EquipmentId = equipmentId;
            Name = name;
            Description = description;
            DailyCost = dailyCost;
            CategoryId = categoryId;
        }

        public override string ToString()
        {
            return $"{EquipmentId}, {Name}, {CategoryId}, {Description}, {DailyCost}";
        }
    }
}
