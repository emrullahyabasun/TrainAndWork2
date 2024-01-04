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
    public class OrderCrud : ICrud<Order>
    {
        DataContext db = new DataContext();
        public bool Add(Order entity)
        {
            if (entity != null)
            {
                db.Order.Add(entity);
                db.SaveChanges();
                return true;
            }
            return false;
        }

        public bool Delete(int id)
        {
            var order = Get(id);
            if (order != null && !order.IsDelete)
            {
                order.IsDelete = true;
                db.SaveChanges();
                return true;
            }
            return false;
        }

        public Order Get(int id)
        {
            var order = db.Order.Find(id);

            if (order != null)
            {
                return order;
            }
            return null;
        }

        public List<Order> GetAll()
        {
            return db.Order.ToList();
        }

        public bool Update(Order entity, int id)
        {
            var order = Get(id);
            if (order != null && !order.IsDelete)
            {

                order.PrepTime = entity.PrepTime;
                order.Price = entity.Price;
                order.IsReady = entity.IsReady;

                db.SaveChanges();
                return true;
            }
            return false;
        }
    }
}
