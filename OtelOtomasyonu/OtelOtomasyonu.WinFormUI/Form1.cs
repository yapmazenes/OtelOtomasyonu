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

    public struct FormStruct<T> where T : Form
    {

        public static byte i = 0;
        public static T f;
        private static void fEKLE()
        {
           
            f = Activator.CreateInstance<T>();
            foreach (Form c in Form1.ActiveForm.MdiChildren)
            {
                c.Close();
            }
            f.MdiParent = Form1.ActiveForm;
           

            f.WindowState = FormWindowState.Maximized;
            f.Size = Form1.ActiveForm.Size;
            f.Show();
           
            
        }
        public void formEkle()
        {
            if (i == 0)
            {
                fEKLE();
                i = 1;
            }

            if (f.IsDisposed == true)
            {
                fEKLE();
            }
        }



    }
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            
        }
     

        private void birimTipleriToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FormStruct<BirimTipForm> bTForm = new FormStruct<BirimTipForm>();
            bTForm.formEkle();
        }

        private void kasaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<KasaForm> kasa = new FormStruct<KasaForm>();
            kasa.formEkle();
        }
        KategoriForm ktg = new KategoriForm();
        private void kategorilerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<KategoriForm> k = new FormStruct<KategoriForm>();
            k.formEkle();
        }

        private void toolStripMenuItem3_Click(object sender, EventArgs e)
        {
            FormStruct<UrunlerForm> u = new FormStruct<UrunlerForm>();
            u.formEkle();
        }

        private void odaTürleriToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<OdaTurleriForm> otForm = new FormStruct<OdaTurleriForm>();
            otForm.formEkle();
        }

        private void tanımlarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<OdalarForm> odaForm = new FormStruct<OdalarForm>();
            odaForm.formEkle();
        }

        private void özelliklerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<OzelliklerForm> oForm = new FormStruct<OzelliklerForm>();
            oForm.formEkle();
        }

        private void odaÖzellikleriToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<OdaOzellikForm> oOzelForm = new FormStruct<OdaOzellikForm>();
            oOzelForm.formEkle();  
        }

        private void müToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<MusteriFORM> MusterForm = new FormStruct<MusteriFORM>();
            MusterForm.formEkle(); 
        }

        private void personellerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<PersonellerFORM> PersForm = new FormStruct<PersonellerFORM>();
            PersForm.formEkle(); 
        }

        private void kasaHareketTipToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<KasaHareketTipForm> kasaTipForm = new FormStruct<KasaHareketTipForm>();
            kasaTipForm.formEkle();
        }

        private void kasaHareketleriToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<KasaHareketleriForm> kasaHareketleriForm = new FormStruct<KasaHareketleriForm>();
            kasaHareketleriForm.formEkle();
        }

        private void satışToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormStruct<SatisFORM> SatisForm = new FormStruct<SatisFORM>();
            SatisForm.formEkle();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if( PersonellerORM.aktifKullanici.Admin==true){
            personellerToolStripMenuItem.Visible = true;
            lblSatis.Text = PersonellerORM.aktifKullanici.SatisSayisi.ToString();
            lblSatisFiyat.Text = PersonellerORM.aktifKullanici.SatisFiyati.ToString();
           // this.ControlBox = false;
            //this.Text = String.Empty;
        }
            
        }

        private void çıkışToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            GirisYapFORM yonlendir = new GirisYapFORM();
            yonlendir.Show();
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }

        bool flag = false;



        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {
            flag = true;
        }

        private void Form1_MouseMove(object sender, MouseEventArgs e)
        {
            if (flag == true)
            {

                this.Location = Cursor.Position;

            }
        }

        private void Form1_MouseUp(object sender, MouseEventArgs e)
        {
            flag = false;


        }

    

       
    }
}
