using BurgerKingHomeWork.Entity.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BurgerKingHomeWork.Models
{
    public class Order:Common
    {
        public string Name { get; set; }
        public double PrepTime { get; set; }

        public double Price { get; set; }

        public DateTime OrderTime { get; set; }

        public bool IsDelete { get; set; }

        public bool IsReady { get; set; }

        public bool IsTakeAway { get; set; }

        public bool PaymentType { get; set; }

        public int Quantity { get; set; }
        public int ProductId { get; set; }

        public Product Product { get; set; }


    }
}
