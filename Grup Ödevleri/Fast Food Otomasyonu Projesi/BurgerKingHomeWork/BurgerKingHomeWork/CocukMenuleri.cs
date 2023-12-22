using BurgerKingHomeWork.Entity.Functions;
using BurgerKingHomeWork.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using EfFrormExample.Entity;

namespace BurgerKingHomeWork
{
    public partial class CocukMenuleri : Form
    {
        public static CocukMenuleri instance;
        DataContext db = new DataContext();
        Functions functions = new Functions();
        ProductCrud productCrud = new ProductCrud();
        public CocukMenuleri()
        {
            InitializeComponent();
            instance = this;
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            
        }

        private void HamburgerCocukMenuBtn_Click(object sender, EventArgs e)
        {


            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(21);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void PeynirliCocukMenuBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(22);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void TavukCocukMenu_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(23);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void TavukKanatlıCocukMenu_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(24);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void PeynirliTavukCocukMenu_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(25);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }
    }
}
