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
    public partial class Soslar : Form
    {
        public static Soslar instance;
        DataContext db = new DataContext();
        Functions functions = new Functions();
        ProductCrud productCrud = new ProductCrud();
        public Soslar()
        {
            InitializeComponent();
            instance = this;
        }

        private void Soslar_Load(object sender, EventArgs e)
        {

        }

        private void KetcapBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(30);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void MayonezBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(31);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void AcıSosBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(32);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void BarbeküSosBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(33);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void RanchSosBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(34);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void HardalBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(35);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void SarımsaklıMayonezBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(36);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }
    }
}
