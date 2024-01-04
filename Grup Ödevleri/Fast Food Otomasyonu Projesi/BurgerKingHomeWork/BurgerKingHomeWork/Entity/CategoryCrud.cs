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
    public class CategoryCrud : ICrud<Category>
    {
        DataContext db = new DataContext();
        public bool Add(Category entity)
        {
           if(entity != null)
            {
                
                db.SaveChanges();
                return true;
            }
           return false;
        }

        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Category Get(int id)
        {
            var category = db.Category.Find(id);

            if (category != null)
            {
                return category;
            }
            return null;
        }

        public List<Category> GetAll()
        {
            return db.Category.ToList();
        }

        public bool Update(Category entity, int id)
        {
            throw new NotImplementedException();
        }
    }
}
