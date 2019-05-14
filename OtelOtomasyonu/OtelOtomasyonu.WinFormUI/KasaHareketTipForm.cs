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
    public partial class KasaHareketTipForm : Form
    {
        public KasaHareketTipForm()
        {
            InitializeComponent();
        }
        KasaHareketTipORM korm = new KasaHareketTipORM();
        private void btnEkle_Click(object sender, EventArgs e)
        {
            KasaHareketTip kEntity = new KasaHareketTip();
            kEntity.Adi = txtAdi.Text.ToString();

            bool sonuc = korm.Insert(kEntity);
            if (sonuc)
            {
                MessageBox.Show("Kayıt Eklenmiştir");
                dataGridView1.DataSource = korm.Select();
            }
            else
            {
                MessageBox.Show("Kayıt eklenirken hata oluştu");
            }
        }

        private void KasaHareketTipForm_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = korm.Select();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            KasaHareketTip kasaHareketTipEntity = new KasaHareketTip();
            kasaHareketTipEntity.Adi = txtAdi.Text;
            kasaHareketTipEntity.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
            bool sonuc = korm.Update(kasaHareketTipEntity);
            if (sonuc)
            {
                MessageBox.Show("Guncelleme başarılı");
                dataGridView1.DataSource = korm.Select();
            }
            else
            {
                MessageBox.Show("Guncelleme işlemi başarısız");
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
                KasaHareketTip kasaHareketTipEntity = new KasaHareketTip();
                kasaHareketTipEntity.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
                bool sonuc = korm.Delete(kasaHareketTipEntity);
                if (sonuc)
                {
                    MessageBox.Show("Kayıt silindi");
                    dataGridView1.DataSource = korm.Select();
                    txtAdi.Text = "";
                }
                else
                {
                    MessageBox.Show("Kayıt silinirken bir hata oluştu ");
                }

            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtAdi.Text = dataGridView1.CurrentRow.Cells["Adi"].Value.ToString();

        }
    }
}
