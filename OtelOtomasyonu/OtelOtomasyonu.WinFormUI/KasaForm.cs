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
    public partial class KasaForm : Form
    {
        public KasaForm()
        {
            InitializeComponent();
        }
        KasaORM kOrm = new KasaORM();
            
        private void btn_KasaEkle_Click(object sender, EventArgs e)
        {
            Kasa kasaEntity = new Kasa();
            if (!string.IsNullOrEmpty(txt_KasaAdi.Text)) kasaEntity.Adi = txt_KasaAdi.Text;
            if (!string.IsNullOrEmpty(txt_Aciklama.Text)) kasaEntity.Aciklama = txt_Aciklama.Text;
            
            bool sonuc = kOrm.Insert(kasaEntity);
            if (sonuc)
            { 
                MessageBox.Show("Kasa Ekleme başarılı");
                dataGridView1.DataSource = kOrm.Select();
            }
            else
            {
                MessageBox.Show("Ekleme işlemi başarısız");
            }

        }

        private void KasaForm_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource=kOrm.Select();
        }

        private void silToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Kayıt Seçiniz");
            }
            else
            {
                Kasa kasaEntity = new Kasa();
                kasaEntity.Adi = txt_KasaAdi.Text;
                kasaEntity.Aciklama = txt_Aciklama.Text;                
                kasaEntity.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
                bool sonuc = kOrm.Delete(kasaEntity);
                if (sonuc)
                {
                    MessageBox.Show("Kayıt silindi");
                    dataGridView1.DataSource = kOrm.Select();
                }
                else
                {
                    MessageBox.Show("Kayıt silinirken bir hata oluştu ");
                }
               
            }
        }

      

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_KasaAdi.Text = dataGridView1.CurrentRow.Cells["Adi"].Value.ToString();
            txt_Aciklama.Text = dataGridView1.CurrentRow.Cells["Aciklama"].Value.ToString();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            Kasa kasaEntity = new Kasa();
            kasaEntity.Adi = txt_KasaAdi.Text;
            kasaEntity.Aciklama = txt_Aciklama.Text;
            kasaEntity.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
            bool sonuc = kOrm.Update(kasaEntity);
            if (sonuc)
            {
                MessageBox.Show("Kasa Guncelleme başarılı");
                dataGridView1.DataSource = kOrm.Select();
            }
            else
            {
                MessageBox.Show("Guncelleme işlemi başarısız");
            }

        }
    }
}
