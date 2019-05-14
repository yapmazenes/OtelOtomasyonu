namespace OtelOtomasyonu.WinFormUI
{
    partial class SatisFORM
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cmb_Müsteri = new System.Windows.Forms.ComboBox();
            this.cmb_Oda = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.nmr_OdaFiyatı = new System.Windows.Forms.NumericUpDown();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btn_Kaydet = new System.Windows.Forms.Button();
            this.cmbKasaTip = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.nmr_OdaFiyatı)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // cmb_Müsteri
            // 
            this.cmb_Müsteri.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_Müsteri.FormattingEnabled = true;
            this.cmb_Müsteri.Location = new System.Drawing.Point(13, 40);
            this.cmb_Müsteri.Name = "cmb_Müsteri";
            this.cmb_Müsteri.Size = new System.Drawing.Size(121, 21);
            this.cmb_Müsteri.TabIndex = 0;
            // 
            // cmb_Oda
            // 
            this.cmb_Oda.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_Oda.FormattingEnabled = true;
            this.cmb_Oda.Location = new System.Drawing.Point(140, 40);
            this.cmb_Oda.Name = "cmb_Oda";
            this.cmb_Oda.Size = new System.Drawing.Size(121, 21);
            this.cmb_Oda.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(18, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Müşteri";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(137, 18);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(27, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Oda";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(264, 18);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(54, 13);
            this.label3.TabIndex = 1;
            this.label3.Text = "Oda Fiyatı";
            // 
            // nmr_OdaFiyatı
            // 
            this.nmr_OdaFiyatı.Location = new System.Drawing.Point(268, 40);
            this.nmr_OdaFiyatı.Maximum = new decimal(new int[] {
            9999,
            0,
            0,
            0});
            this.nmr_OdaFiyatı.Name = "nmr_OdaFiyatı";
            this.nmr_OdaFiyatı.Size = new System.Drawing.Size(144, 20);
            this.nmr_OdaFiyatı.TabIndex = 2;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(13, 67);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(643, 281);
            this.dataGridView1.TabIndex = 3;
            // 
            // btn_Kaydet
            // 
            this.btn_Kaydet.Location = new System.Drawing.Point(418, 38);
            this.btn_Kaydet.Name = "btn_Kaydet";
            this.btn_Kaydet.Size = new System.Drawing.Size(75, 23);
            this.btn_Kaydet.TabIndex = 4;
            this.btn_Kaydet.Text = "Kaydet";
            this.btn_Kaydet.UseVisualStyleBackColor = true;
            this.btn_Kaydet.Click += new System.EventHandler(this.btn_Kaydet_Click);
            // 
            // cmbKasaTip
            // 
            this.cmbKasaTip.FormattingEnabled = true;
            this.cmbKasaTip.Location = new System.Drawing.Point(499, 38);
            this.cmbKasaTip.Name = "cmbKasaTip";
            this.cmbKasaTip.Size = new System.Drawing.Size(74, 21);
            this.cmbKasaTip.TabIndex = 5;
            // 
            // SatisFORM
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(669, 360);
            this.Controls.Add(this.cmbKasaTip);
            this.Controls.Add(this.btn_Kaydet);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.nmr_OdaFiyatı);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmb_Oda);
            this.Controls.Add(this.cmb_Müsteri);
            this.Name = "SatisFORM";
            this.Text = "SatisFORM";
            this.Load += new System.EventHandler(this.SatisFORM_Load);
            ((System.ComponentModel.ISupportInitialize)(this.nmr_OdaFiyatı)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cmb_Müsteri;
        private System.Windows.Forms.ComboBox cmb_Oda;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.NumericUpDown nmr_OdaFiyatı;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btn_Kaydet;
        private System.Windows.Forms.ComboBox cmbKasaTip;
    }
}