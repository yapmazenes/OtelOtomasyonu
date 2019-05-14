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
    public partial class SatisFORM : Form
    {
        public SatisFORM()
        {
            InitializeComponent();
        }

        private void SatisFORM_Load(object sender, EventArgs e)
        {
            MusteriORM mORM = new MusteriORM();
            cmb_Müsteri.DataSource = mORM.Select();
            cmb_Müsteri.DisplayMember = "Adi";
            cmb_Müsteri.ValueMember = "Id";

            KasaORM korm = new KasaORM();
            cmbKasaTip.DataSource = korm.Select();
            cmbKasaTip.DisplayMember = "Adi";
            cmbKasaTip.ValueMember = "Id";


            OdalarORM oORM = new OdalarORM();
            DataRow[] rows = oORM.Select().Select("Aktif='True'");
            if (rows.Length>0)
            {
                cmb_Oda.DataSource = rows.CopyToDataTable();
            }
            cmb_Oda.DisplayMember = "Adi";
            cmb_Oda.ValueMember = "Id";
            SatisORM s = new SatisORM();
            dataGridView1.DataSource = s.Select();
        }

       

        private void btn_Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                 SatisORM s = new SatisORM();
            Satis satisEntity = new Satis();
            satisEntity.MusteriID = (int)cmb_Müsteri.SelectedValue;
            satisEntity.OdaFiyati = nmr_OdaFiyatı.Value;
            int OdaID;
            bool kontrolOda = int.TryParse(cmb_Oda.SelectedValue.ToString(),out OdaID);
            if (kontrolOda == true) satisEntity.OdaID = OdaID;
            satisEntity.KasaID = (int)cmbKasaTip.SelectedValue;
            satisEntity.PersonelID = PersonellerORM.aktifKullanici.Id;
            bool kontrol = s.Insert(satisEntity);


            if (kontrol == true)
            {
                MessageBox.Show("Oda Satıldı");
                dataGridView1.DataSource = s.Select();
                OdalarORM oORM = new OdalarORM();
                cmb_Oda.DataSource = oORM.Select();
                PersonellerORM porm = new PersonellerORM();
                Personeller p = PersonellerORM.aktifKullanici;
               
                Personeller aktif = porm.GirisYap(p);
                ControlCollection mdiControls= (ControlCollection)this.MdiParent.Controls;
                mdiControls["lblSatis"].Text=aktif.SatisSayisi.ToString();
                mdiControls["lblSatisFiyat"].Text = aktif.SatisFiyati.ToString();


            }
            }
            catch (Exception)
            {
                
                  MessageBox.Show("Satış sırasında bir hata meydana geldi");
            }
           
          

        }

       
    }
}
