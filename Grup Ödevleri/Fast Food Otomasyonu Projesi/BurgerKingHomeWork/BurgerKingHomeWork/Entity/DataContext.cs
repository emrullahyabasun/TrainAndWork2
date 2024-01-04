using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

using System.Data;
using BurgerKingHomeWork.Models;

namespace EfFrormExample.Entity
{
    public class DataContext : DbContext
    {
        public DataContext() : base("DbConnection") { }

        public DbSet<Category> Category { get; set; }
        public DbSet<Product> Product { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<Tablo> Tablo { get; set; }
        public DbSet<TCPData> TCPData { get; set; }


    }
}
