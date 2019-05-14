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
    public partial class PersonellerFORM : Form
    {
        public PersonellerFORM()
        {
            InitializeComponent();
        }
        PersonellerORM orm = new PersonellerORM();
        private void PersonellerFORM_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = orm.Select();
            cmb_Cinsiyet.DataSource = Enum.GetNames(typeof(Cinsiyet));
            dataGridView1.Columns["Id"].Visible = false;
        }

        private void btn_Ekle_Click(object sender, EventArgs e)
        {
            Personeller p = new Personeller
            {

                Adres = txt_Adres.Text,
                DogumTarihi = dt_DogumTarih.Value,
                Cinsiyet = (Cinsiyet)Enum.Parse(typeof(Cinsiyet), cmb_Cinsiyet.SelectedItem.ToString()),
                IseGirisTarihi = dt_IseGiris.Value,
                Maas = nmr_Maas.Value,
                KullaniciAdi = txt_KullaniciAdi.Text,
                Sifre = txt_Parola.Text,
                Admin = chkAdmin.Checked,
                Aktif = true
            };

            if (!string.IsNullOrWhiteSpace(txt_Adi.Text)) p.Adi = txt_Adi.Text;
            if (!string.IsNullOrWhiteSpace(txt_Soyadi.Text)) p.Soyadi = txt_Soyadi.Text;
            if (!string.IsNullOrWhiteSpace(txtmsk_TCKN.Text)) p.Tckn = txtmsk_TCKN.Text;
            if (!string.IsNullOrWhiteSpace(txtmsk_TEL.Text)) p.TelNo = txtmsk_TEL.Text;

            bool snc = orm.Insert(p);
            if (snc)
            {
                MessageBox.Show("Personel kaydı başarılı");
                dataGridView1.DataSource = orm.Select();
            }
            else
            {
                MessageBox.Show("Personel kaydı başarısız");
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
                Personeller personel = new Personeller();
                personel.Id = int.Parse(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
                bool sonuc = orm.Delete(personel);
                if (sonuc)
                {
                    MessageBox.Show("Kayıt silindi");
                    dataGridView1.DataSource = orm.Select();
                    txt_Adi.Text = "";
                    txt_Soyadi.Text = "";
                    cmb_Cinsiyet.Text = "";

                    txtmsk_TCKN.Text = "";
                    txtmsk_TEL.Text = "";
                    dt_DogumTarih.Text = "";
                    dt_IseGiris.Text = "";
                    nmr_Maas.ResetText();
                    txt_KullaniciAdi.Text = "";
                    txt_Parola.Text = "";
                    chkAdmin.Checked = false;
                    txt_Adres.Text = "";
                }
                else
                {
                    MessageBox.Show("Kayıt silinirken bir hata oluştu ");
                }

            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_Adi.Text = dataGridView1.CurrentRow.Cells["Adi"].Value.ToString();
            txt_Soyadi.Text = dataGridView1.CurrentRow.Cells["Soyadi"].Value.ToString();
            cmb_Cinsiyet.SelectedItem = dataGridView1.CurrentRow.Cells["Cinsiyet"].Value.ToString();

            txtmsk_TCKN.Text = dataGridView1.CurrentRow.Cells["Tckn"].Value.ToString();
            txtmsk_TEL.Text = dataGridView1.CurrentRow.Cells["TelNo"].Value.ToString();
            dt_DogumTarih.Text = dataGridView1.CurrentRow.Cells["DogumTarihi"].Value.ToString();
            dt_IseGiris.Text = dataGridView1.CurrentRow.Cells["IseGirisTarihi"].Value.ToString();
            nmr_Maas.Value = Convert.ToDecimal(dataGridView1.CurrentRow.Cells["Maas"].Value.ToString());
            txt_KullaniciAdi.Text = dataGridView1.CurrentRow.Cells["KullaniciAdi"].Value.ToString();
            txt_Parola.Text = dataGridView1.CurrentRow.Cells["Sifre"].Value.ToString();
            txt_Adres.Text = dataGridView1.CurrentRow.Cells["Adres"].Value.ToString();
            chkAdmin.Checked = false;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Personeller p = new Personeller
            {

                Adres = txt_Adres.Text,
                DogumTarihi = dt_DogumTarih.Value,
                Cinsiyet = (Cinsiyet)Enum.Parse(typeof(Cinsiyet), cmb_Cinsiyet.SelectedItem.ToString()),
                IseGirisTarihi = dt_IseGiris.Value,
                Maas = nmr_Maas.Value,
                KullaniciAdi = txt_KullaniciAdi.Text,
                Sifre = txt_Parola.Text,
                Admin = chkAdmin.Checked,
                Aktif = true
            };
            p.Id = Convert.ToInt16(dataGridView1.CurrentRow.Cells["Id"].Value.ToString());
            if (!string.IsNullOrWhiteSpace(txt_Adi.Text)) p.Adi = txt_Adi.Text;
            if (!string.IsNullOrWhiteSpace(txt_Soyadi.Text)) p.Soyadi = txt_Soyadi.Text;
            if (!string.IsNullOrWhiteSpace(txtmsk_TCKN.Text)) p.Tckn = txtmsk_TCKN.Text;
            if (!string.IsNullOrWhiteSpace(txtmsk_TEL.Text)) p.TelNo = txtmsk_TEL.Text;

            bool snc = orm.Update(p);
            if (snc)
            {
                MessageBox.Show("Guncelleme başarılı");
                dataGridView1.DataSource = orm.Select();
            }
            else
            {
                MessageBox.Show("Guncelleme başarısız");
            }
        }
    }
}
