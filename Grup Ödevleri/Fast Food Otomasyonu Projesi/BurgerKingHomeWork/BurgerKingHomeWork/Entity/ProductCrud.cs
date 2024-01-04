using BurgerKingHomeWork.Entity.Interfaces;
using BurgerKingHomeWork.Models;
using EfFrormExample.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BurgerKingHomeWork.Entity
{
    public class ProductCrud : ICrud<Product>
    {
        DataContext db = new DataContext();
        public bool Add(Product entity)
        {
            throw new NotImplementedException();
        }

        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Product Get(int id)
        {
            var category = db.Product.Find(id);

            if (category != null)
            {
                return category;
            }
            return null;
        }

        public List<Product> GetAll()
        {
            return db.Product.ToList();
        }

        public bool Update(Product entity, int id)
        {
            throw new NotImplementedException();
        }
    }
}
