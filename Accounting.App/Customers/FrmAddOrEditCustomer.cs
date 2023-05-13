using Accounting.DataLayer;
using Accounting.DataLayer.Context;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ValidationComponents;

namespace Accounting.App
{
    public partial class FrmAddOrEditCustomer : Form
    {
        public int customerId=0;
        public FrmAddOrEditCustomer()
        {
            InitializeComponent();
        }

        private void btnSelectPhoto_Click(object sender, EventArgs e)
        {
           OpenFileDialog openfile=new OpenFileDialog();
            if (openfile.ShowDialog() == DialogResult.OK)
            {
                pcCustomer.ImageLocation = openfile.FileName;
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            
            if (BaseValidator.IsFormValid(this.components))
            {
                using(UnitOfWork db= new UnitOfWork()) {
                    string ImageName = Guid.NewGuid().ToString() + Path.GetExtension(pcCustomer.ImageLocation);
                    string path=Application.StartupPath + "/Images/";
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                     pcCustomer.Image.Save (path + ImageName);

                    Customers customer = new Customers()
                    {
                        FullName = txtName.Text,
                        Mobile=txtMobile.Text,
                        Emaill=txtEmail.Text,
                        Address=txtAddress.Text,
                        CustomerImage= ImageName
                    };
                    if(customerId == 0)
                    {
                        db.CustomerRepository.InsertCustomer(customer);

                    }
                    else
                    {
                        //var Customers = new Customers();
                       //Customers.CustomerID = customerId;
                        customer.CustomerID = customerId;
                        db.CustomerRepository.UpdateCustomer(customer);
                    }
                    db.Save();
                    DialogResult = DialogResult.OK;
                    RtlMessageBox.Show("عملیات با موفقیت انجام شد");
                }
            }
        }

        private void FrmAddOrEditCustomer_Load(object sender, EventArgs e)
        {
            if (customerId != 0)
            {
                this.Text = "ویرایش شخص";
                btnSave.Text = "ویرایش";

                using (UnitOfWork db = new UnitOfWork())
                {
                    Customers customer = db.CustomerRepository.GetCustomerById(customerId);
                    txtName.Text = customer.FullName;
                    txtMobile.Text = customer.Mobile;
                    txtEmail.Text = customer.Emaill;
                    txtAddress.Text = customer.Address;
                    pcCustomer.ImageLocation = Application.StartupPath + "/images/" + customer.CustomerImage;
                }
            }

        }
    }
}
