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
    public partial class Icecekler : Form
    {
        public static Icecekler instance;
        DataContext db = new DataContext();
        Functions functions = new Functions();
        ProductCrud productCrud = new ProductCrud();
        public Icecekler()
        {
            InitializeComponent();
            instance = this;
        }

        private void Icecekler_Load(object sender, EventArgs e)
        {

        }

        private void CocaColaSBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(38);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void CocaColaMBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(39);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void CocaColaLBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(40);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void AyranSBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(41);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void AyranMBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(42);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void AyranLBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(43);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void FantaSBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(44);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void FantaMBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(45);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void FantaLBtn_Click(object sender, EventArgs e)
        {
            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(46);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }
    }
}
