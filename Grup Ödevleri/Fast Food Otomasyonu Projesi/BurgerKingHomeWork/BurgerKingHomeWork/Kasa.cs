using BurgerKingHomeWork.Entity;
using BurgerKingHomeWork.Entity.Functions;
using BurgerKingHomeWork.Models;
using EfFrormExample.Entity;
using SimpleTCP;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Sockets;
using System.Net;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.Serialization.Formatters.Binary;

namespace BurgerKingHomeWork
{
    public partial class Kasa : Form
    {

        public static Kasa instance;
        public DataGridView dgw;

        int orderId = 0;

        DataContext db = new DataContext();
        ProductCrud productCrud = new ProductCrud();
        CategoryCrud categoryCrud = new CategoryCrud();
        Functions functions = new Functions();

        Product product = new Product();
        List<Order> gosterilecekveri = new List<Order>();


        public Kasa()
        {
            InitializeComponent();
            instance = this;
            dgw = KasaDisplayList;

        }
        SimpleTcpClient client;
        private void WhoperMenuBtn_Click(object sender, EventArgs e)
        {




        }

        private void BurgerMenulerBtn_Click(object sender, EventArgs e)
        {
            BurgerMenuler burgerMenuler = new BurgerMenuler();
            burgerMenuler.ShowDialog();
        }

        private void CocukMenuleriBtn_Click(object sender, EventArgs e)
        {
            CocukMenuleri cocukMenuleri = new CocukMenuleri();
            cocukMenuleri.ShowDialog();
        }

        private void YanUrunlerBtn_Click(object sender, EventArgs e)
        {
            YanUrunler yanUrunler = new YanUrunler();
            yanUrunler.ShowDialog();
        }

        private void BurgerlerBtn_Click(object sender, EventArgs e)
        {
            Burgerler burgerler = new Burgerler();
            burgerler.ShowDialog();
        }

        private void SoslarBtn_Click(object sender, EventArgs e)
        {
            Soslar soslar = new Soslar();
            soslar.ShowDialog();
        }

        private void IceceklerBtn_Click(object sender, EventArgs e)
        {
            Icecekler icecekler = new Icecekler();
            icecekler.ShowDialog();
        }

        private void Promosyonlar_Click(object sender, EventArgs e)
        {

        }


        private void Kasa_Load(object sender, EventArgs e)
        {
            PaketorHereLbl.Visible = false;
            db.Order.RemoveRange(db.Order.ToList());
            db.Tablo.RemoveRange(db.Tablo.ToList());
            db.SaveChanges();

            KasaDisplayList.SelectionChanged += KasaDisplayList_SelectionChanged;




        }

        private void ClassicBurgerBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(5);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;

        }

        private void CheeseBurgerBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(10);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;


        }

        private void RestorandaBtn_Click(object sender, EventArgs e)
        {
            var sepet = db.Tablo.ToList();

            foreach (var item in sepet)
            {
                item.IsTakeAway = false;
            }
            db.SaveChanges();
            PaketorHereLbl.Text = "Restoranda";
            PaketorHereLbl.Visible = true;
        }

        private void PaketBtn_Click(object sender, EventArgs e)
        {
            var sepet = db.Tablo.ToList();

            foreach (var item in sepet)
            {
                item.IsTakeAway = true;
            }
            db.SaveChanges();
            PaketorHereLbl.Text = "Paket";
            PaketorHereLbl.Visible = true;
        }

        private void PaketorHereBtn_Click(object sender, EventArgs e)
        {

        }


        private void KasaDisplayList_SelectionChanged(object sender, EventArgs e)
        {
            UrunIptalBtn.Enabled = KasaDisplayList.SelectedRows.Count > 0;
        }

        private void SiparısıTamamla_Click(object sender, EventArgs e)
        {
            List<TCPData> tcpDatagidecek = new List<TCPData>();

            if (db.Tablo.Count() > 0)
            {
                orderId++;
                foreach (var item in db.Tablo.ToList())
                {
                    TCPData tCPData = new TCPData();
                    item.OrderId = orderId;
                    tCPData.OrderId = item.OrderId;
                    tCPData.ProductName = item.ProductName;
                    tCPData.Quantity = item.Quantity;    
                    tCPData.IsReady = false;
                    tCPData.IsTakeAway = false;

                    tCPData.OrderTime = DateTime.Now;

                    db.TCPData.Add(tCPData);


                }

                
                KasaDisplayList.DataSource = null;
                db.Order.RemoveRange(db.Order.ToList());

                db.SaveChanges();

                //string tcpDataString = "";
                //foreach (var item in db.TCPData.ToList())
                //{
                //    string quantity = Convert.ToString(item.Quantity);
                //    string orderId = Convert.ToString(item.OrderId);
                //    string productName = Convert.ToString(item.ProductName);
                //    tcpDataString += productName + "/" + quantity+ "/" + orderId+"/";
                   
                //}
                //MessageBox.Show(tcpDataString);
                //string[] enes = tcpDataString.Split('/');
                //foreach (var item in enes)
                //{
                //    MessageBox.Show(item);
                //}

                TCPData tCPData1 = new TCPData();
            foreach (var item in db.Tablo.ToList())
            {



                tCPData1.OrderId = item.OrderId;
                tCPData1.ProductName = item.ProductName;
                tCPData1.Quantity = item.Quantity;
                tCPData1.ProductId = item.ProductId;
                tCPData1.IsReady = false;
                tCPData1.IsTakeAway = false;

                tCPData1.OrderTime = DateTime.Now;

            


            }
            tcpDatagidecek.Add(tCPData1);
            TcpSendData(tcpDatagidecek);
        }
            else
            {
                MessageBox.Show("Ürün Eklemediniz");
            }


      }
        public void TcpSendData(List<TCPData> tcpDatagidecek, string IpAdress = "172.20.10.4", int serverPort = 2050)
        {
            IPAddress serverAddr = IPAddress.Parse(IpAdress);
            Task.Run(() =>
            {
                using (TcpClient client = new TcpClient(serverAddr.ToString(), serverPort))
                using (NetworkStream stream = client.GetStream())
                {
                    string json = JsonSerializer.Serialize(tcpDatagidecek);
                    byte[] jsonBytes = Encoding.UTF8.GetBytes(json);
                    byte[] lengthPrefix = BitConverter.GetBytes(jsonBytes.Length);
                    stream.Write(lengthPrefix, 0, lengthPrefix.Length);
                    stream.Write(jsonBytes, 0, jsonBytes.Length);
                }
            });
        }



        private void UyeGirisiBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = db.Tablo.ToList();
        }

        private void UrunIptalBtn_Click(object sender, EventArgs e)
        {

            if (KasaDisplayList.SelectedRows.Count > 0)
            {
                int selectedRowIndex = KasaDisplayList.SelectedRows[0].Index;

                var secilenId = Convert.ToInt32(KasaDisplayList.Rows[selectedRowIndex].Cells["ProductId"].Value);
                var secilenQunatity = Convert.ToInt32(KasaDisplayList.Rows[selectedRowIndex].Cells["Quantity"].Value);


                Tablo yenitablo = db.Tablo.FirstOrDefault(x => x.ProductId == secilenId);
                Order order = db.Order.FirstOrDefault(x => x.ProductId == secilenId);

                if (yenitablo.Quantity > 1)
                {
                    yenitablo.Quantity = secilenQunatity - 1;

                }
                else
                {
                    db.Tablo.Remove(yenitablo);
                }
                db.Order.Remove(order);
            }

            db.SaveChanges();

            KasaDisplayList.DataSource = db.Tablo.ToList();

            KasaDisplayList.Refresh();
        }


        private void SatirSilBtn_Click(object sender, EventArgs e)
        {
            if (KasaDisplayList.SelectedRows.Count > 0)
            {
                int selectedRowIndex = KasaDisplayList.SelectedRows[0].Index;

                var secilenId = Convert.ToInt32(KasaDisplayList.Rows[selectedRowIndex].Cells["ProductId"].Value);
                var secilenQunatity = Convert.ToInt32(KasaDisplayList.Rows[selectedRowIndex].Cells["Quantity"].Value);

                var silinecekTablodan = db.Tablo.Where(x => x.ProductId == secilenId).ToList();
                var silinecekOrderdan = db.Order.Where(x => x.ProductId == secilenId).ToList();

        
               
                    db.Tablo.RemoveRange(silinecekTablodan);
                    db.Order.RemoveRange(silinecekOrderdan);
                    db.SaveChanges();

            }



            KasaDisplayList.DataSource = db.Tablo.ToList();

            KasaDisplayList.Refresh();
        }

        private void ClassicBurgerMenuBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(15);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;
        }

        private void CheeseburgerMenuBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(19);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;
        }

        private void BaconBurgerMenuBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(14);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;
        }

        private void MushroomSwissBurgerMenuBtn_Click(object sender, EventArgs e)
        {

        }

        private void BbqBurgerBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(1);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;
        }

        private void VeggieBurgerBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(2);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;
        }

        private void SpicyChickenBurgerBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(3);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;
        }

        private void FishBurgerBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(6);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;
        }

        private void CrispyChickenBurgerBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(7);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;
        }

        private void EtliBarbekuBurgerBtn_Click(object sender, EventArgs e)
        {
            KasaDisplayList.DataSource = null;
            var item = productCrud.Get(8);

            functions.SepeteEkle(item.Id);


            KasaDisplayList.DataSource = db.Tablo.ToList();
            KasaDisplayList.Columns["Id"].Visible = false;
            KasaDisplayList.Columns["ProductId"].Visible = false;
            KasaDisplayList.Columns["OrderId"].Visible = false;
        }

        private void BigSizeBtn_Click(object sender, EventArgs e)
        {

            Kasa.instance.dgw.DataSource = null;
            var item = productCrud.Get(37);

            functions.SepeteEkle(item.Id);


            Kasa.instance.dgw.DataSource = db.Tablo.ToList();
            Kasa.instance.dgw.Columns["Id"].Visible = false;
            Kasa.instance.dgw.Columns["ProductId"].Visible = false;
            Kasa.instance.dgw.Columns["OrderId"].Visible = false;
        }

        private void MushroomSwissBurgerBtn_Click(object sender, EventArgs e)
        {
         
        }

        private void button10_Click(object sender, EventArgs e)
        {
            
        }
    }

}


    

