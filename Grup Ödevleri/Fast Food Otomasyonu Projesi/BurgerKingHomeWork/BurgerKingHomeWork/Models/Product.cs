using BurgerKingHomeWork.Entity.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BurgerKingHomeWork.Models
{
    public class Product : Common
    {
        public string Name { get; set; }

        public double Price { get; set; }

        public double TotalPrepTime { get; set; }

        public int CategoryId { get; set; }

        public Category Category { get; set; }

    }
}
