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
    public partial class YanUrunler : Form
    {
        public static YanUrunler instance;
        DataContext db = new DataContext();
        Functions functions = new Functions();
        ProductCrud productCrud = new ProductCrud();
        public YanUrunler()
        {
            InitializeComponent();
            instance = this;
        }

        private void YanUrunler_Load(object sender, EventArgs e)
        {

        }

        private void NuggetBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(26);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void SoganHalkasıBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(27);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void TavukKanatBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(28);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void PeynirCubuklarıBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(28);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }
    }
}
