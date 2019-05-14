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
    public partial class OdalarForm : Form
    {
        public OdalarForm()
        {
            InitializeComponent();
        }
        OdalarORM odaORM = new OdalarORM();

        private void btn_OdaEkle_Click(object sender, EventArgs e)
        {
            Odalar oda = new Odalar
            {
                Aciklama = txt_Aciklama.Text,
                OdaTurID = (int)cmb_OdaTuru.SelectedValue,
                Aktif = true
            };
            if (!string.IsNullOrEmpty(txt_OdaAdi.Text)) oda.Adi = txt_OdaAdi.Text;

            bool snc = odaORM.Insert(oda);
            if (snc)
            {
                MessageBox.Show("Oda Başarıyla Eklendi");
                dataGridView1.DataSource = odaORM.Select();
            }
            else
            {
                MessageBox.Show("HATA");
            }
        }

        private void OdalarForm_Load(object sender, EventArgs e)
        {
            OdaTurleriORM odaTür = new OdaTurleriORM();
            cmb_OdaTuru.DataSource = odaTür.Select();
            cmb_OdaTuru.DisplayMember = "Adi";
            cmb_OdaTuru.ValueMember = "Id";
            dataGridView1.DataSource = odaORM.Select();

        }

        private void silToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Odalar oda = new Odalar();
            oda.Id = Convert.ToInt16(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
            bool sonuc = odaORM.Delete(oda);
            if (sonuc)
            {
                MessageBox.Show("Silindi");
                dataGridView1.DataSource = odaORM.Select();
            }
            else MessageBox.Show("Hata");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Odalar oda = new Odalar
            {
                Aciklama = txt_Aciklama.Text,
                OdaTurID = (int)cmb_OdaTuru.SelectedValue,
                Aktif = true
            };
            oda.Id = Convert.ToInt16(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
            if (!string.IsNullOrEmpty(txt_OdaAdi.Text)) oda.Adi = txt_OdaAdi.Text;

            bool snc = odaORM.Update(oda);
            if (snc)
            {
                MessageBox.Show("Oda Başarıyla Güncellendi");
                dataGridView1.DataSource = odaORM.Select();
            }
            else
            {
                MessageBox.Show("HATA");
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_OdaAdi.Text = dataGridView1.CurrentRow.Cells["Adi"].Value.ToString();
            txt_Aciklama.Text = dataGridView1.CurrentRow.Cells["Aciklama"].Value.ToString();
            cmb_OdaTuru.SelectedIndex = cmb_OdaTuru.FindString(dataGridView1.CurrentRow.Cells["OdaTürü"].Value.ToString());
          

        }
    }
}
