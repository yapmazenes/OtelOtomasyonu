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
    public partial class KategoriForm : Form
    {
        public KategoriForm()
        {
            InitializeComponent();
        }
        KategoriORM kOrm = new KategoriORM();

        private void btn_KategoriEkle_Click(object sender, EventArgs e)
        {
            Kategoriler k = new Kategoriler();
            if (!string.IsNullOrEmpty(txt_KategoriAdi.Text)) k.Adi = txt_KategoriAdi.Text;
            bool sonuc = kOrm.Insert(k);
            if (sonuc)
            {
                MessageBox.Show("Kayıt Eklenmiştir");
                dataGridView1.DataSource = kOrm.Select();
            }
            else
            {
                MessageBox.Show("Kategori eklenirken hata oluştu");
            }
        }

        private void KategoriForm_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = kOrm.Select();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Kategoriler kategorilerEntity = new Kategoriler();
            kategorilerEntity.Adi = txt_KategoriAdi.Text;
            kategorilerEntity.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
            bool sonuc = kOrm.Update(kategorilerEntity);
            if (sonuc)
            {
                MessageBox.Show("Guncelleme başarılı");
                dataGridView1.DataSource = kOrm.Select();
            }
            else
            {
                MessageBox.Show("Guncelleme işlemi başarısız");
            }

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_KategoriAdi.Text = dataGridView1.CurrentRow.Cells["Adi"].Value.ToString();
          
        }

        private void silToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Kayıt Seçiniz");
            }
            else
            {
                Kategoriler kategori= new Kategoriler();
                kategori.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
                bool sonuc = kOrm.Delete(kategori);
                if (sonuc)
                {
                    MessageBox.Show("Kayıt silindi");
                    dataGridView1.DataSource = kOrm.Select();
                    txt_KategoriAdi.Text = "";
                }
                else
                {
                    MessageBox.Show("Kayıt silinirken bir hata oluştu ");
                }

            }
        }
    }
}
