namespace OtelOtomasyonu.WinFormUI
{
    partial class OdaOzellikForm
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.list_Ozellikler = new System.Windows.Forms.ListBox();
            this.btn_Ekle = new System.Windows.Forms.Button();
            this.cmb_Odalar = new System.Windows.Forms.ComboBox();
            this.txt_Deger = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(27, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Oda";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 49);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(49, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Özellikler";
            // 
            // list_Ozellikler
            // 
            this.list_Ozellikler.FormattingEnabled = true;
            this.list_Ozellikler.Location = new System.Drawing.Point(12, 65);
            this.list_Ozellikler.Name = "list_Ozellikler";
            this.list_Ozellikler.Size = new System.Drawing.Size(169, 212);
            this.list_Ozellikler.TabIndex = 3;
            // 
            // btn_Ekle
            // 
            this.btn_Ekle.Location = new System.Drawing.Point(188, 49);
            this.btn_Ekle.Name = "btn_Ekle";
            this.btn_Ekle.Size = new System.Drawing.Size(75, 23);
            this.btn_Ekle.TabIndex = 4;
            this.btn_Ekle.Text = "Ekle";
            this.btn_Ekle.UseVisualStyleBackColor = true;
            this.btn_Ekle.Click += new System.EventHandler(this.btn_Ekle_Click);
            // 
            // cmb_Odalar
            // 
            this.cmb_Odalar.FormattingEnabled = true;
            this.cmb_Odalar.Location = new System.Drawing.Point(12, 25);
            this.cmb_Odalar.Name = "cmb_Odalar";
            this.cmb_Odalar.Size = new System.Drawing.Size(169, 21);
            this.cmb_Odalar.TabIndex = 5;
            // 
            // txt_Deger
            // 
            this.txt_Deger.Location = new System.Drawing.Point(188, 25);
            this.txt_Deger.Name = "txt_Deger";
            this.txt_Deger.Size = new System.Drawing.Size(100, 20);
            this.txt_Deger.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(185, 9);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(36, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "Değer";
            // 
            // OdaOzellikForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(492, 294);
            this.Controls.Add(this.txt_Deger);
            this.Controls.Add(this.cmb_Odalar);
            this.Controls.Add(this.btn_Ekle);
            this.Controls.Add(this.list_Ozellikler);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label1);
            this.Name = "OdaOzellikForm";
            this.Text = "OdaOzellikForm";
            this.Load += new System.EventHandler(this.OdaOzellikForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ListBox list_Ozellikler;
        private System.Windows.Forms.Button btn_Ekle;
        private System.Windows.Forms.ComboBox cmb_Odalar;
        private System.Windows.Forms.TextBox txt_Deger;
        private System.Windows.Forms.Label label3;
    }
}