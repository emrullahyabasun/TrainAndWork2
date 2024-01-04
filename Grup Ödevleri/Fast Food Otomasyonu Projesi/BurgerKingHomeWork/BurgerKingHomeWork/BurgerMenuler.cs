using BurgerKingHomeWork.Entity.Functions;
using BurgerKingHomeWork.Entity;
using EfFrormExample.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BurgerKingHomeWork
{
    public partial class BurgerMenuler : Form
    {
        public static BurgerMenuler instance;
        DataContext db = new DataContext();
        Functions functions = new Functions();
        ProductCrud productCrud = new ProductCrud();
        public BurgerMenuler()
        {
            InitializeComponent();
            instance = this;
        }


        private void BurgerMenuler_Load(object sender, EventArgs e)
        {

        }

        private void BbqBurgerMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(11);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void VeggieBurgerMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(12);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void SpicyChickenBurgerMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(13);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void BaconBurgerMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(14);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void ClassicBurgerMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(15);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void FishBurgerMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(16);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void CrispyChickenBurgerMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(17);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void EtliBarbekuMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(18);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void CheeseburgerMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(19);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void AlaturkaBurgerMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(20);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }
    }
}
