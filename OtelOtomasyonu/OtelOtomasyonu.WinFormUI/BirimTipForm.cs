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
    public partial class BirimTipForm : Form
    {
        public BirimTipForm()
        {
            InitializeComponent();
        }
        BirimTipORM btORM = new BirimTipORM();

        private void btn_BirimTipEkle_Click(object sender, EventArgs e)
        {
            BirimTipleri btEntity = new BirimTipleri();
            if (!string.IsNullOrEmpty(txt_BirimTipAdi.Text)) btEntity.Adi = txt_BirimTipAdi.Text;

           bool etk=btORM.Insert(btEntity);
            if(etk)
            {
                MessageBox.Show("Birim tipi eklendi");
                dataGridView1.DataSource = btORM.Select();
            }
            else
                MessageBox.Show("Eklemede Hata!");

        }

        private void BirimTipForm_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = btORM.Select();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            BirimTipleri BirimTip = new BirimTipleri();

            BirimTip.Adi = txt_BirimTipAdi.Text;
            BirimTip.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
            bool sonuc = btORM.Update(BirimTip);
            if (sonuc)
            {
                MessageBox.Show("Guncelleme başarılı");
                dataGridView1.DataSource = btORM.Select();
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
                BirimTipleri BirimTip = new BirimTipleri();
                BirimTip.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
                bool sonuc = btORM.Delete(BirimTip);
                if (sonuc)
                {
                    MessageBox.Show("Kayıt silindi");
                    dataGridView1.DataSource = btORM.Select();
                    txt_BirimTipAdi.Text = "";
                }
                else
                {
                    MessageBox.Show("Kayıt silinirken bir hata oluştu ");
                }

            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_BirimTipAdi.Text = dataGridView1.CurrentRow.Cells["Adi"].Value.ToString();

        }
    }
}
