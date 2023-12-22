//using EfFrormExample.Entity;
//using System;
//using System.Collections.Generic;
//using System.ComponentModel;
//using System.Data;
//using System.Drawing;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using System.Windows.Forms;

//namespace BurgerKingHomeWork
//{
//    public partial class Mutfak : Form
//    {

//        DataContext db = new DataContext();
//        Label OrderFullNameLbl;
//        GroupBox MutfakGb;
//        Button SiparisHazirBtn;
//        public Mutfak()
//        {
//            InitializeComponent();
//        }

//        private void Mutfak_Load(object sender, EventArgs e)
//        {
//            int formWidth = (panel1.Width / 2) - (MutfakListTitleLbl.Width / 2);
//            int formHeight = (panel1.Height / 2) - (MutfakListTitleLbl.Height / 2);
//            MutfakListTitleLbl.Location = new Point(formWidth, formHeight);
//        }


//        private void Mutfak_SizeChanged(object sender, EventArgs e)
//        {
//            int formWidth = (panel1.Width / 2) - (MutfakListTitleLbl.Width / 2);
//            int formHeight = (panel1.Height / 2) - (MutfakListTitleLbl.Height / 2);
//            MutfakListTitleLbl.Location = new Point(formWidth, formHeight);
//            panel2.Controls.Clear();
//            OrderListingIntoPanel();
//        }

//        public void OrderListingIntoPanel()
//        {
//            int tcpOrderId = 0;
//            int xStart = 20;
//            int yStart = 20;
//            int i = 0;
//            int step = 170;
//            int PanelWidth = panel2.Width - xStart;
//            int OrderGbCount = (PanelWidth - ((PanelWidth) % step)) / step;

//            var groupedOrders = receivedOrders.GroupBy(order => order.OrderId).ToList();

//            foreach (var group in groupedOrders)
//            {
//                MutfakGb = new GroupBox()
//                {
//                    Name = "MutfakGb_" + tcpOrderId,
//                    //Text = $"OrderId: {group.Key\n}";
//                    Size = new Size(150, 240),
//                    BackColor = Color.White,
//                    Location = new Point(xStart + (step * i), yStart),

//                };

//                OrderFullNameLbl = new Label()
//                {
//                    Name = "OrderFullName_" + tcpOrderId,
//                    Text = $"OrderId: {group.Key\n}";
//                Location = new Point(15, 155),
//                };
//            SiparisHazirBtn = new Button()
//            {

//                Text = "Hazır",
//                Location = new Point(15, 185),
//                Size = new Size(120, 40),
//                FlatStyle = FlatStyle.Popup,
//                BackColor = Color.Green,
//                ForeColor = Color.White,
//                Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)))
//            };
//            foreach (var order in group)
//            {
//                OrderFullNameLbl.Text = $"{order.PrdocutName} x {order.Quantity} \n";
//            }

//            MutfakGb.Controls.Add(OrderFullNameLbl);
//            Button orderButton = new Button();

//            orderButton.Text = "Hazir"

//                SiparisHazirBtn.Click += OrderButton_Click;

//            MutfakGb.Controls.Add(SiparisHazirBtn);



//            panel2.Controls.Add(MutfakGb);
//            i++;
//        }
//    }



//    // Buton click event handler'ı.
//    private void OrderButton_Click(object sender, EventArgs e)
//    {
//        Button clickedButton = sender as Button;
//        if (clickedButton != null)
//        {
//            int orderId = (int)clickedButton.Tag;
//            foreach (var order in receivedOrders.Where(o => o.OrderId == orderId))
//            {
//                order.IsReady = true;
//            }
//            // İsteğe bağlı: Kullanıcıya bilgi vermek veya UI'ı güncellemek için bir işlem yapın.
//        }
//    }
//}
//}