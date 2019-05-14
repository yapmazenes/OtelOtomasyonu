using OtelOtomasyonu.ORM.Facade;
using OtelOtomasyonu.ORM.Entity;
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
    public partial class OzelliklerForm : Form
    {
        public OzelliklerForm()
        {
            InitializeComponent();
        }
        OzellikORM ozORM = new OzellikORM();
        private void btn_OzellikEkle_Click(object sender, EventArgs e)
        {
            Ozellikler oz = new Ozellikler
            {
                Aciklama = txt_Aciklama.Text,
                Aktif = true
            };
            if (!string.IsNullOrEmpty(txt_OzellikAdi.Text)) oz.Adi = txt_OzellikAdi.Text;

            bool snc=ozORM.Insert(oz);
            if (snc)
            {
                MessageBox.Show("Eklendi");
                dataGridView1.DataSource = ozORM.Select();
            }
            else
            {
                MessageBox.Show("Hata");
            }
        }

        private void OzelliklerForm_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = ozORM.Select();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_OzellikAdi.Text = dataGridView1.CurrentRow.Cells["Adi"].Value.ToString();
            txt_Aciklama.Text = dataGridView1.CurrentRow.Cells["Aciklama"].Value.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Ozellikler ozellikler= new Ozellikler();
            ozellikler.Adi = txt_OzellikAdi.Text;
            ozellikler.Aciklama = txt_Aciklama.Text;
            ozellikler.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
            bool sonuc = ozORM.Update(ozellikler);
            if (sonuc)
            {
                MessageBox.Show("Guncelleme başarılı");
                dataGridView1.DataSource = ozORM.Select();
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
                Ozellikler ozellikler = new Ozellikler();
                ozellikler.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
                bool sonuc = ozORM.Delete(ozellikler);
                if (sonuc)
                {
                    MessageBox.Show("Kayıt silindi");
                    dataGridView1.DataSource = ozORM.Select();
                    txt_OzellikAdi.Text = "";
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
