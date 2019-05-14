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
    public partial class OdaOzellikForm : Form
    {
        public OdaOzellikForm()
        {
            InitializeComponent();
        }

        private void OdaOzellikForm_Load(object sender, EventArgs e)
        {
            OdalarORM odaORM = new OdalarORM();
            cmb_Odalar.DataSource = odaORM.Select();
            cmb_Odalar.DisplayMember = "Adi";
            cmb_Odalar.ValueMember = "Id";
            OzellikORM ozORM = new OzellikORM();
            list_Ozellikler.DataSource = ozORM.Select();
            list_Ozellikler.DisplayMember = "Adi";
            list_Ozellikler.ValueMember = "Id";
        }

        private void btn_Ekle_Click(object sender, EventArgs e)
        {
            OdaOzellikleriORM odaOzellikORM = new OdaOzellikleriORM();
            OdaOzellikleri odaOzellik = new OdaOzellikleri();
            odaOzellik.OdaID = (int)cmb_Odalar.SelectedValue;
            odaOzellik.OzellikID = Convert.ToInt16(list_Ozellikler.SelectedValue);
            short deger;
            if (short.TryParse(txt_Deger.Text, out deger))
                if (deger!=0)
                {
                    odaOzellik.Deger = deger;

                }
            bool snc = odaOzellikORM.Insert(odaOzellik);
            if (snc)
            {
                MessageBox.Show("Odaya Seçilen Özellik eklenmiştir");

            }
            else
            {
                MessageBox.Show("Özellik Atama Sırasında bir hata oluştu");
            }

        }
    }
}
