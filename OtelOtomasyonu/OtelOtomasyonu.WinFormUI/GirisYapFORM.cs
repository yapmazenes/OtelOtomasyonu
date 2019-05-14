using OtelOtomasyonu.ORM.Entity;
using OtelOtomasyonu.ORM.Facade;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OtelOtomasyonu.WinFormUI
{
    public partial class GirisYapFORM : Form
    {
        public GirisYapFORM()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            PersonellerORM porm = new PersonellerORM();
            Personeller p = new Personeller();
            p.KullaniciAdi = txt_Kadi.Text;
            p.Sifre = txt_Sifre.Text;
            Personeller aktif = porm.GirisYap(p);
            if (aktif == null)
                MessageBox.Show("Kullanıcı adı veya Parola hatalı");
            else
            {
                PersonellerORM.aktifKullanici = aktif;
                Form1 f = new Form1();
                this.Visible = false;
                f.ShowDialog();
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }
    }
}
