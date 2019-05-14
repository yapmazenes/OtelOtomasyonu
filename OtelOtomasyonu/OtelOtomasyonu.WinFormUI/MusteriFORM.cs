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
    public partial class MusteriFORM : Form
    {
        public MusteriFORM()
        {
            InitializeComponent();
        }
        MusteriORM mORM = new MusteriORM();

        private void btn_Ekle_Click(object sender, EventArgs e)
        {
            Musteriler m = new Musteriler
            {
                SirketAdi = txt_SirketAdi.Text,
                Aktif = true,
                DogumTarihi = dt_DogumTarih.Value,
                Cinsiyet = (Cinsiyet)Enum.Parse(typeof(Cinsiyet), cmb_Cinsiyet.SelectedItem.ToString()),
                MedeniDurum = (MedeniDurumTip)Enum.Parse(typeof(MedeniDurumTip), cmb_MedeniDurum.SelectedItem.ToString())
            };
            if (!string.IsNullOrWhiteSpace(txt_Adi.Text)) m.Adi = txt_Adi.Text;
            if (!string.IsNullOrWhiteSpace(txt_Soyad.Text)) m.Soyadi = txt_Soyad.Text;
            if (!string.IsNullOrWhiteSpace(mask_TCNO.Text)) m.Tckn = mask_TCNO.Text;
            if (!string.IsNullOrWhiteSpace(mask_TelNo.Text)) m.TelNo = mask_TelNo.Text;

            bool snc = mORM.Insert(m);
            if (snc)
            {
                MessageBox.Show("Müşteri Kaydı Başarıyla eklendi");
                dataGridView1.DataSource = mORM.Select();
            }
            else
            {
                MessageBox.Show("Hata");
            }
        }

        private void MusteriFORM_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = mORM.Select();
            dataGridView1.Columns["Id"].Visible = false;
            cmb_Cinsiyet.DataSource = Enum.GetNames(typeof(Cinsiyet));
            cmb_MedeniDurum.DataSource = Enum.GetNames(typeof(MedeniDurumTip));
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
               txt_Adi.Text =dataGridView1.CurrentRow.Cells["Adi"].Value.ToString();
             txt_Soyad.Text = dataGridView1.CurrentRow.Cells["Soyadi"].Value.ToString();
             txt_SirketAdi.Text =dataGridView1.CurrentRow.Cells["SirketAdi"].Value.ToString();
            
             mask_TCNO.Text = dataGridView1.CurrentRow.Cells["Tckn"].Value.ToString();
             mask_TelNo.Text = dataGridView1.CurrentRow.Cells["TelNo"].Value.ToString();
             dt_DogumTarih.Text = dataGridView1.CurrentRow.Cells["DogumTarihi"].Value.ToString();
             cmb_MedeniDurum.SelectedItem = dataGridView1.CurrentRow.Cells["MedeniDurum"].Value.ToString();
             cmb_Cinsiyet.SelectedItem = dataGridView1.CurrentRow.Cells["Cinsiyet"].Value.ToString();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Musteriler m = new Musteriler
            {
                SirketAdi = txt_SirketAdi.Text,
                Aktif = true,
                DogumTarihi = dt_DogumTarih.Value,
                Cinsiyet = (Cinsiyet)Enum.Parse(typeof(Cinsiyet), cmb_Cinsiyet.SelectedItem.ToString()),
                MedeniDurum = (MedeniDurumTip)Enum.Parse(typeof(MedeniDurumTip), cmb_MedeniDurum.SelectedItem.ToString())
            };
            m.Id= Convert.ToInt16(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());

            if (!string.IsNullOrWhiteSpace(txt_Adi.Text)) m.Adi = txt_Adi.Text;
            if (!string.IsNullOrWhiteSpace(txt_Soyad.Text)) m.Soyadi = txt_Soyad.Text;
            if (!string.IsNullOrWhiteSpace(mask_TCNO.Text)) m.Tckn = mask_TCNO.Text;
            if (!string.IsNullOrWhiteSpace(mask_TelNo.Text)) m.TelNo = mask_TelNo.Text;

            bool snc = mORM.Update(m);
            if (snc)
            {
                MessageBox.Show("Güncelleme Başarılı ");
                dataGridView1.DataSource = mORM.Select();
            }
            else
            {
                MessageBox.Show("Hata");
            }
        }

        private void silToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Kayıt Seçiniz");
            }
            else
            {
                Musteriler musteri = new Musteriler();
                musteri.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
                bool sonuc = mORM.Delete(musteri);
                if (sonuc)
                {
                    MessageBox.Show("Kayıt silindi");
                    dataGridView1.DataSource = mORM.Select();
                    txt_Adi.Text = "";
                    txt_Soyad.Text = "";
                    txt_SirketAdi.Text = "";

                    mask_TCNO.Text = "";
                    mask_TelNo.Text = "";
                    dt_DogumTarih.Text = "";
                }
                else
                {
                    MessageBox.Show("Kayıt silinirken bir hata oluştu ");
                }

            }
        }
    }
}
