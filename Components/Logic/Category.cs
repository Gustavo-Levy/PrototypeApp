using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrototypeApp.Logic
{
    public class Category(int categoryId, string description)
    {
        public int CategoryId { get; set; } = categoryId;
        public string Description { get; set; } = description;
    }
}
