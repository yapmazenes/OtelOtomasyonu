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
    public partial class UrunlerForm : Form
    {
        public UrunlerForm()
        {
            InitializeComponent();
        }
        UrunORM uORM = new UrunORM();
        private void btn_UrunEkle_Click(object sender, EventArgs e)
        {
            Urunler u = new Urunler();
            if (!string.IsNullOrEmpty(txt_UrunAdi.Text)) u.Adi = txt_UrunAdi.Text;

            u.Fiyat = nmr_UrunFiyat.Value;
            u.Miktar = Convert.ToDouble(nmr_UrunMiktar.Value);
            u.BirimTipID = Convert.ToInt16(cmb_BirimTip.SelectedValue);
            u.KategoriID = Convert.ToInt16(cmb_Kategori.SelectedValue);
            bool sonuc = uORM.Insert(u);
            if (sonuc)
            {
                MessageBox.Show("Ürün Eklendi");
               dataGridView1.DataSource= uORM.Select();
            }

            else

                MessageBox.Show("Ürün eklenirken hata meydana geldi");


        }

        private void UrunlerForm_Load(object sender, EventArgs e)
        {
            KategoriORM kORM = new KategoriORM();
            BirimTipORM bORM = new BirimTipORM();
            cmb_Kategori.DataSource = kORM.Select();
            cmb_BirimTip.DataSource = bORM.Select();
            cmb_Kategori.DisplayMember = "Adi";
            cmb_Kategori.ValueMember = "Id";
            cmb_BirimTip.DisplayMember = "Adi";
            cmb_BirimTip.ValueMember = "Id";
            
            dataGridView1.DataSource = uORM.Select();
            dataGridView1.Columns["Id"].Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Urunler u = new Urunler();
            if (!string.IsNullOrEmpty(txt_UrunAdi.Text)) u.Adi = txt_UrunAdi.Text;
            u.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
            u.Fiyat = nmr_UrunFiyat.Value;
            u.Miktar = Convert.ToDouble(nmr_UrunMiktar.Value);
            u.BirimTipID = Convert.ToInt16(cmb_BirimTip.SelectedValue);
            u.KategoriID = Convert.ToInt16(cmb_Kategori.SelectedValue);
            bool sonuc = uORM.Update(u);
            if (sonuc)
            {
                MessageBox.Show("Ürün Güncellendi");
                dataGridView1.DataSource = uORM.Select();
            }

            else

                MessageBox.Show("Ürün güncellenirken hata meydana geldi");


        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_UrunAdi.Text = dataGridView1.CurrentRow.Cells["Adi"].Value.ToString();
            nmr_UrunFiyat.Text = dataGridView1.CurrentRow.Cells["Fiyat"].Value.ToString();
            nmr_UrunMiktar.Text = dataGridView1.CurrentRow.Cells["Miktar"].Value.ToString();
            cmb_Kategori.SelectedIndex= cmb_Kategori.FindString(dataGridView1.CurrentRow.Cells["KategoriAdi"].Value.ToString());
            cmb_BirimTip.SelectedIndex =cmb_BirimTip.FindString( dataGridView1.CurrentRow.Cells["BirimTipAdi"].Value.ToString());


        }

        private void silToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Kayıt Seçiniz");
            }
            else
            {
                Urunler urunler = new Urunler();
                urunler.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
                bool sonuc = uORM.Delete(urunler);
                if (sonuc)
                {
                    MessageBox.Show("Kayıt silindi");
                    dataGridView1.DataSource = uORM.Select();
                    txt_UrunAdi.Text = "";
                    nmr_UrunFiyat.ResetText();
                    nmr_UrunMiktar.ResetText();
                    cmb_Kategori.SelectedIndex = 0;
                    cmb_BirimTip.SelectedIndex = 0;
                }
                else
                {
                    MessageBox.Show("Kayıt silinirken bir hata oluştu ");
                }

            }
        }
    }
}
