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
    public partial class OdaTurleriForm : Form
    {
        public OdaTurleriForm()
        {
            InitializeComponent();
        }
        OdaTurleriORM otORM = new OdaTurleriORM();
        private void btn_Ekle_Click(object sender, EventArgs e)
        {
            OdaTurleri oT = new OdaTurleri();
            if (!string.IsNullOrEmpty(txt_Adi.Text)) oT.Adi = txt_Adi.Text;

            oT.Aciklama = txt_Aciklama.Text;
            bool snc = otORM.Insert(oT);
            if (snc)
            {
                MessageBox.Show("Oda Türü Eklendi");
                dataGridView1.DataSource = otORM.Select();

            }
            else
            {
                MessageBox.Show("HATA");
            }

        }

        private void OdaTurleriForm_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = otORM.Select();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OdaTurleri odaTurleri = new OdaTurleri();
            odaTurleri.Adi = txt_Adi.Text;
            odaTurleri.Aciklama = txt_Aciklama.Text;
            odaTurleri.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
            bool sonuc = otORM.Update(odaTurleri);
            if (sonuc)
            {
                MessageBox.Show("Guncelleme başarılı");
                dataGridView1.DataSource = otORM.Select();
            }
            else
            {
                MessageBox.Show("Guncelleme işlemi başarısız");
            }

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_Adi.Text = dataGridView1.CurrentRow.Cells["Adi"].Value.ToString();
            txt_Aciklama.Text = dataGridView1.CurrentRow.Cells["Aciklama"].Value.ToString();
        }

        private void silToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Kayıt Seçiniz");
            }
            else
            {
                OdaTurleri odaTurleri = new OdaTurleri();
                odaTurleri.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
                bool sonuc = otORM.Delete(odaTurleri);
                if (sonuc)
                {
                    MessageBox.Show("Kayıt silindi");
                    dataGridView1.DataSource = otORM.Select();
                    txt_Adi.Text = "";
                    txt_Aciklama.Text = "";

                }
                else
                {
                    MessageBox.Show("Kayıt silinirken bir hata oluştu ");
                }

            }
        }


    }
}
