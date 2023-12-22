using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Sockets;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MusteriEkrani
{
    public partial class Form1 : Form
    {
        GroupBox UserGb;
        Label OrderFullNameLbl;
        Label OrderId;
        List<Ekran> currentOrdersFromTcp = new List<Ekran>();
        public Form1()
        {
            InitializeComponent();
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            label1.Visible = false;
            int formWidth = (panel1.Width / 2) - (UserListTitleLbl.Width / 2);
            int formHeight = (panel1.Height / 2) - (UserListTitleLbl.Height / 2);
            UserListTitleLbl.Location = new Point(formWidth, formHeight);
            JsonVeriDinle(); // JsonVeriDinle() metodu çağrılıyor.
        }

        private void Form1_SizeChanged(object sender, EventArgs e)
        {
            int formWidth = (panel1.Width / 2) - (UserListTitleLbl.Width / 2);
            int formHeight = (panel1.Height / 2) - (UserListTitleLbl.Height / 2);
            UserListTitleLbl.Location = new Point(formWidth, formHeight);
            MusreiOrderListingIntoPanel();
        }

        public void MusreiOrderListingIntoPanel()
        {
            int xStart = 20;
            int yStart = 20;
            int i = 0;
            int step = 170;
            int PanelWidth = panel2.Width - xStart;
            int UserGbCount = (PanelWidth - ((PanelWidth) % step)) / step;
            foreach (var user in currentOrdersFromTcp) // Her bir currentOrdersFromTcp öğesi için döngü
            {
                if (i == UserGbCount) // Eğer kullanılabilir GroupBox sayısına ulaşıldıysa yeni satıra geç
                {
                    yStart += step + 90;
                    i = 0;
                }
                UserGb = new GroupBox()
                {
                    Name = "UserGb_" + user.OrderId,
                    //Text = roleCrud.Get(user.RoleId).Name,
                    Size = new Size(150, 240),
                    BackColor = Color.White,
                    Location = new Point(xStart + (step * i), yStart),
                };

                OrderFullNameLbl = new Label()
                {
                    Text = $"{user.ProductName} x {user.Quantity}\n",
            
                    Size = new Size(120, 40), // Boyutu ayarla ki tüm metin sığsın
                    AutoSize = true, // Metin boyutuna göre otomatik ayarla

                    Name = "UserFullName_" + user.ProductId,
                    
                    Location = new Point(15, 155)
                };
                OrderId = new Label()
                {
                    Text = "OrderId: "+ Convert.ToString(user.OrderId),

                    Size = new Size(120, 40), // Boyutu ayarla ki tüm metin sığsın
                    AutoSize = true, // Metin boyutuna göre otomatik ayarla

                    Name =  Convert.ToString(user.OrderId),

                    Location = new Point(15, 120)
                };
                ;
                UserGb.Controls.Add(OrderFullNameLbl);// Label'ı GroupBox içine ekle
                UserGb.Controls.Add(OrderId);
                panel2.Controls.Add(UserGb); // Oluşturulan GroupBox'ı panel içine ekle
                i++; // Sıradaki GroupBox için sayaç artır
            }
        }
        public void JsonVeriDinle()
        {
            IPAddress localAddr = IPAddress.Parse("172.20.10.3"); //berke ip4
            int port = 2031; //fatih port
            // 
            TcpListener server = new TcpListener(IPAddress.Any, port);
            server.Start();
            Task.Run(() =>
            {
                while (true)
                {
                    using (TcpClient client = server.AcceptTcpClient())
                    using (NetworkStream stream = client.GetStream())
                    {
                        byte[] lengthBytes = new byte[4];
                        stream.Read(lengthBytes, 0, 4);
                        int length = BitConverter.ToInt32(lengthBytes, 0);

                        byte[] jsonBytes = new byte[length];
                        stream.Read(jsonBytes, 0, jsonBytes.Length);

                        string jsonString = Encoding.UTF8.GetString(jsonBytes);

                        List<Ekran> receivedOrders = System.Text.Json.JsonSerializer.Deserialize<List<Ekran>>(jsonString);

                        if (receivedOrders != null)
                        {
                            this.Invoke((MethodInvoker)delegate
                            {
                                currentOrdersFromTcp.Clear(); // Mevcut siparişleri temizle
                                foreach (Ekran order in receivedOrders)
                                {
                                    currentOrdersFromTcp.Add(order);
                                }
                                MusreiOrderListingIntoPanel(); // Ekranı güncelle
                            });
                        }
                    }
                }
            });
        }
    }
}
