using BurgerKingHomeWork.Models;
using EfFrormExample.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace BurgerKingHomeWork.Entity.Functions
{
    public class Functions
    {
        CategoryCrud categoryCrud = new CategoryCrud();
        ProductCrud productCrud = new ProductCrud();
        DataContext db = new DataContext();




        public List<Tablo> SepeteEkle(int productId)
        {


            var item = productCrud.Get(productId);
            Order order = new Order();

            order.Name = item.Name;
            order.PrepTime = item.TotalPrepTime;
            order.OrderTime = DateTime.Now;
            order.IsDelete = false;
            order.ProductId = item.Id;
            order.IsReady = false;
            order.IsTakeAway = false;
            order.Price = item.Price;
            order.Quantity = 1;

            db.Order.Add(order);
            db.SaveChanges();



            /////////*//////////////////////////////////////////////////////////////////////
            ///

            var ayniUrunSayisi = db.Order.Count(x => x.ProductId == item.Id);


            var element = db.Order.Where(x => x.ProductId == item.Id).FirstOrDefault();


            element.Name = item.Name;
            element.PrepTime = item.TotalPrepTime * ayniUrunSayisi;
            element.OrderTime = DateTime.Now;
            element.IsDelete = false;
            element.ProductId = item.Id;
            element.IsReady = false;
            element.IsTakeAway = false;
            element.Price = item.Price * ayniUrunSayisi;
            element.Quantity = 1 * ayniUrunSayisi;




            db.SaveChanges();

            var sonveri = db.Order.Where(x => x.IsDelete == false)
    .GroupBy(p => p.ProductId)
    .Select(group => group.FirstOrDefault())
    .ToList();



  //          var istenenKolonlar = sonveri
  //.Select(secilen => new
  //{
  //    ProductId = secilen.ProductId,
  //    ProductName = secilen.Name,
  //    Price = secilen.Price,
  //    Quantity = secilen.Quantity,
    


  //})
  //.ToList();

            List<Tablo> tablos = new List<Tablo>();

            foreach (var item1 in sonveri)
            {

                tablos.Add(new Tablo { ProductId = item1.ProductId, ProductName = item1.Name, Price = item1.Price, Quantity = item1.Quantity, IsTakeAway = false, IsReady = false, OrderTime = item1.OrderTime});

            }

            db.Tablo.RemoveRange(db.Tablo.ToList());

            db.Tablo.AddRange(tablos.ToList());
            db.SaveChanges();
            return tablos;
        }
    }
}
