using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using mutfak.Model;
//using Newtonsoft.Json;

namespace mutfak
{
    public partial class Form1 : Form
    {
        List<Mutfak> receivedOrders = new List<Mutfak>();
        List<Mutfak> currentOrdersFromTcp = new List<Mutfak>();

        Label OrderFullNameLbl;
        GroupBox MutfakGb;
        Button SiparisHazirBtn;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //ReceiveDataFromCashierScreen();
            int formWidth = (panel1.Width / 2) - (MutfakListTitleLbl.Width / 2);
            int formHeight = (panel1.Height / 2) - (MutfakListTitleLbl.Height / 2);
            MutfakListTitleLbl.Location = new Point(formWidth, formHeight);


            JsonVeriDinle();
        }
        public void JsonVeriDinle()
        {
            IPAddress localAddr = IPAddress.Parse("172.20.10.4");
            int port = 2050;
            // 
            TcpListener server = new TcpListener(localAddr, port);
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

                        receivedOrders = System.Text.Json.JsonSerializer.Deserialize<List<Mutfak>>(jsonString);

                        this.Invoke((MethodInvoker)delegate
                        {

                            foreach (var order in receivedOrders)
                            {
                                currentOrdersFromTcp.Add(order);
                            }



                            //TcpSendData(receivedOrders);

                        });
                    }
                }
            });
        }

        private void Form1_SizeChanged(object sender, EventArgs e)
        {
            int formWidth = (panel1.Width / 2) - (MutfakListTitleLbl.Width / 2);
            int formHeight = (panel1.Height / 2) - (MutfakListTitleLbl.Height / 2);
            MutfakListTitleLbl.Location = new Point(formWidth, formHeight);
            panel2.Controls.Clear();
            OrderListingIntoPanel();
        }

        public void OrderListingIntoPanel()
        {

            int xStart = 20;
            int yStart = 20;
            int i = 0;
            int step = 170;
            int PanelWidth = panel2.Width - xStart;
            int OrderGbCount = (PanelWidth - ((PanelWidth) % step)) / step;

            var groupedOrders = currentOrdersFromTcp.GroupBy(order => order.OrderId).ToList();
            

            foreach (var group in groupedOrders)
            {
                MutfakGb = new GroupBox()
                {

                    //Text = $"OrderId: {group.Key\n}";
                    Size = new Size(150, 240),
                    BackColor = Color.White,
                    Location = new Point(xStart + (step * i), yStart),

                };

                OrderFullNameLbl = new Label()
                {

                    Text = $"OrderId: {group.Key}",
                    Location = new Point(15, 155)

                };


                SiparisHazirBtn = new Button()
                {

                    Text = "Hazır",
                    Location = new Point(15, 185),
                    Size = new Size(120, 40),
                    FlatStyle = FlatStyle.Popup,
                    BackColor = Color.Green,
                    ForeColor = Color.White,
                    Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)))
                };
                foreach (var order in group)
                {
                    
                    OrderFullNameLbl.Text = $"{order.ProductName} x {order.Quantity} \n";
                    
                    MutfakGb.Controls.Add(OrderFullNameLbl);
                }
               


                SiparisHazirBtn.Click += OrderButton_Click;

                MutfakGb.Controls.Add(SiparisHazirBtn);



                panel2.Controls.Add(MutfakGb);
                i++;
            };


        }





        private void OrderButton_Click(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;
            if (clickedButton != null)
            {
                foreach (var order in currentOrdersFromTcp)
                {
                    order.IsReady = true;
                   
                }
             
                // Butonun parent'ını bul (bu durumda GroupBox)
                GroupBox groupBoxToRemove = clickedButton.Parent as GroupBox;
                if (groupBoxToRemove != null)
                {
                    // GroupBox'ı panelin kontroller listesinden kaldır
                    panel2.Controls.Remove(groupBoxToRemove);
                }
            }
            TcpSendData(currentOrdersFromTcp);
            
        }
        public void TcpSendData(List<Mutfak> currentOrdersFromTcp, string IpAdress = "172.20.10.3", int serverPort = 2031)
        {
            IPAddress serverAddr = IPAddress.Parse(IpAdress);
            Task.Run(() =>
            {
                using (TcpClient client = new TcpClient(serverAddr.ToString(), serverPort))
                using (NetworkStream stream = client.GetStream())
                {
                    string json = JsonSerializer.Serialize(currentOrdersFromTcp);
                    byte[] jsonBytes = Encoding.UTF8.GetBytes(json);
                    byte[] lengthPrefix = BitConverter.GetBytes(jsonBytes.Length);
                    stream.Write(lengthPrefix, 0, lengthPrefix.Length);
                    stream.Write(jsonBytes, 0, jsonBytes.Length);
                }
            });
        }
    }
   

}




//private void CreateCardsAndButtons()
//{
//    foreach (var order in receivedOrders)
//    {
//        // Kart oluştur (burada panel kullanıldı, ancak ihtiyacınıza göre değiştirebilirsiniz)
//        Panel orderPanel = new Panel();
//        orderPanel.Size = new Size(200, 100); // Örnek boyut
//                                              // Diğer kart özellikleri...

//        // Buton oluştur
//        Button orderButton = new Button();
//        orderButton.Text = "Siparişi Hazırla";
//        orderButton.Tag = order.OrderId; // Butona OrderId'yi etiket olarak ekle
//        orderButton.Click += OrderButton_Click; // Click event handler'ı ekle

//        // Butonu ve diğer öğeleri kart'a ekle
//        orderPanel.Controls.Add(orderButton);

//        // Kartı (paneli) formunuzun veya bir container'ın içine ekleyin
//        this.Controls.Add(orderPanel);
//    }
//}

//private void OrderButton_Click(object sender, EventArgs e)
//{
//    Button clickedButton = sender as Button;
//    if (clickedButton != null)
//    {
//        int orderId = (int)clickedButton.Tag;
//        var order = receivedOrders.FirstOrDefault(o => o.OrderId == orderId);
//        if (order != null)
//        {
//            order.IsReady = true;
//            // İsteğe bağlı: Kullanıcıya bilgi vermek için bir mesaj göster
//        }
//    }
//}

//static void ReceiveDataFromCashierScreen()
//{
//    try
//    {
//        TcpClient client = new TcpClient("172.20.10.2", 12345);
//        NetworkStream stream = client.GetStream();

//        byte[] data = new byte[1024];
//        int bytesRead = stream.Read(data, 0, data.Length);
//        string receivedData = Encoding.UTF8.GetString(data, 0, bytesRead);
//        List<string> orderList = JsonConvert.DeserializeObject<List<string>>(receivedData);

//        // Burada elde edilen sipariş listesini işleyebilirsiniz
//        if (orderList != null)
//        {
//            foreach (var item in orderList)
//            {
//                MessageBox.Show("Sipariş: " + item);
//            }
//        }


//        client.Close();
//    }
//    catch (Exception e)
//    {
//        MessageBox.Show("Hata: " + e.Message);
//    }
//}


