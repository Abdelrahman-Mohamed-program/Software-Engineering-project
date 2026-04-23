namespace ODP2
{
    partial class Rental_Form
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
            this.txtMID = new System.Windows.Forms.TextBox();
            this.txtUID = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtRVal = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtRID = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btn_showCopies = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txtMID
            // 
            this.txtMID.Location = new System.Drawing.Point(160, 42);
            this.txtMID.Margin = new System.Windows.Forms.Padding(4);
            this.txtMID.Name = "txtMID";
            this.txtMID.Size = new System.Drawing.Size(261, 22);
            this.txtMID.TabIndex = 0;
            this.txtMID.TextChanged += new System.EventHandler(this.txt_title_TextChanged);
            // 
            // txtUID
            // 
            this.txtUID.Location = new System.Drawing.Point(160, 94);
            this.txtUID.Margin = new System.Windows.Forms.Padding(4);
            this.txtUID.Name = "txtUID";
            this.txtUID.Size = new System.Drawing.Size(261, 22);
            this.txtUID.TabIndex = 2;
            this.txtUID.TextChanged += new System.EventHandler(this.txt_memID_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(36, 50);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(60, 16);
            this.label1.TabIndex = 3;
            this.label1.Text = "Movie ID";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(36, 97);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(52, 16);
            this.label3.TabIndex = 5;
            this.label3.Text = "User ID";
            // 
            // txtRVal
            // 
            this.txtRVal.Location = new System.Drawing.Point(160, 141);
            this.txtRVal.Margin = new System.Windows.Forms.Padding(4);
            this.txtRVal.Name = "txtRVal";
            this.txtRVal.Size = new System.Drawing.Size(261, 22);
            this.txtRVal.TabIndex = 11;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(36, 147);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(82, 16);
            this.label6.TabIndex = 12;
            this.label6.Text = "Rating value";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // txtRID
            // 
            this.txtRID.Location = new System.Drawing.Point(160, 195);
            this.txtRID.Margin = new System.Windows.Forms.Padding(4);
            this.txtRID.Name = "txtRID";
            this.txtRID.Size = new System.Drawing.Size(261, 22);
            this.txtRID.TabIndex = 13;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(36, 201);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(62, 16);
            this.label2.TabIndex = 14;
            this.label2.Text = "Rating ID";
            this.label2.Click += new System.EventHandler(this.label2_Click_1);
            // 
            // btn_showCopies
            // 
            this.btn_showCopies.Location = new System.Drawing.Point(152, 281);
            this.btn_showCopies.Margin = new System.Windows.Forms.Padding(4);
            this.btn_showCopies.Name = "btn_showCopies";
            this.btn_showCopies.Size = new System.Drawing.Size(208, 44);
            this.btn_showCopies.TabIndex = 15;
            this.btn_showCopies.Text = "insert rating";
            this.btn_showCopies.UseVisualStyleBackColor = true;
            this.btn_showCopies.Click += new System.EventHandler(this.btn_showCopies_Click_1);
            // 
            // Rental_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(505, 415);
            this.Controls.Add(this.btn_showCopies);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtRID);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtRVal);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtUID);
            this.Controls.Add(this.txtMID);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Rental_Form";
            this.Text = "Rental Form";
            this.Load += new System.EventHandler(this.Rental_Form_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtMID;
        private System.Windows.Forms.TextBox txtUID;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtRVal;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtRID;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_showCopies;
    }
}

