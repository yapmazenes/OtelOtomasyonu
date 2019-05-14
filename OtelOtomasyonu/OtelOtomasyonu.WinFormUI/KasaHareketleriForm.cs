﻿using OtelOtomasyonu.ORM.Facade;
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
    public partial class KasaHareketleriForm : Form
    {
        public KasaHareketleriForm()
        {
            InitializeComponent();
            
           
        }

        private void KasaHareketleriForm_Load(object sender, EventArgs e)
        {

            KasaHareketleriORM kOrm = new KasaHareketleriORM();
            dataGridView1.DataSource = kOrm.Select();
        }
    }
}
