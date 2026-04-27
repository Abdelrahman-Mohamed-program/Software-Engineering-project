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
            this.txt_title = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btn_showCopies = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txt_title
            // 
            this.txt_title.Location = new System.Drawing.Point(160, 42);
            this.txt_title.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txt_title.Name = "txt_title";
            this.txt_title.Size = new System.Drawing.Size(261, 22);
            this.txt_title.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(36, 50);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(61, 16);
            this.label1.TabIndex = 3;
            this.label1.Text = "Film Title";
            // 
            // btn_showCopies
            // 
            this.btn_showCopies.Location = new System.Drawing.Point(160, 151);
            this.btn_showCopies.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btn_showCopies.Name = "btn_showCopies";
            this.btn_showCopies.Size = new System.Drawing.Size(173, 87);
            this.btn_showCopies.TabIndex = 14;
            this.btn_showCopies.Text = "Show movies";
            this.btn_showCopies.UseVisualStyleBackColor = true;
            this.btn_showCopies.Click += new System.EventHandler(this.btn_showCopies_Click);
            // 
            // Rental_Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(505, 415);
            this.Controls.Add(this.btn_showCopies);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txt_title);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "Rental_Form";
            this.Text = "Rental Form";
            this.Load += new System.EventHandler(this.Rental_Form_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txt_title;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btn_showCopies;
    }
}

