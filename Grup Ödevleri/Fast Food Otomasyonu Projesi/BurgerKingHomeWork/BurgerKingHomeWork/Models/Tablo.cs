using BurgerKingHomeWork.Entity.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BurgerKingHomeWork.Models
{
    public class Tablo:Common
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }

        public double Price { get; set; }

        public int Quantity { get; set; }

        public int OrderId { get; set; }

        public DateTime OrderTime { get; set; }


        public bool IsReady { get; set; }

        public bool IsTakeAway { get; set; }

    }
}
