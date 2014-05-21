using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminInfo : System.Web.UI.Page
{
    private DataClassesDataContext data = new DataClassesDataContext();
    protected static Table_Info info = new Table_Info();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var q = from s in data.Table_Info
                    select s;
            info = q.First();
            TextBox1.Text = info.CompanyName;
            textarea1.Value = info.Description;
            TextBox2.Text = info.ContactAddress;
            TextBox3.Text = info.ContactRole;
            TextBox4.Text = info.ContactPhone;
            TextBox5.Text = info.ContactMobie;
            TextBox6.Text = info.ContactSkype;
        }

    }
    protected void button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox6.Text == "" || textarea1.Value == "")
        {
            Response.Write("<script>alert('All input fields can not be empty!');</script>");
            return;
        }
        Table_Info info = new Table_Info();
        info.Description = textarea1.Value;
        info.CompanyName = TextBox1.Text;
        info.ContactAddress = TextBox2.Text;
        info.ContactRole = TextBox3.Text;
        info.ContactPhone = TextBox4.Text;
        info.ContactMobie = TextBox5.Text;
        info.ContactSkype = TextBox6.Text;
        var q = from s in data.Table_Info
                select s;
        data.Table_Info.DeleteAllOnSubmit(q);
        data.Table_Info.InsertOnSubmit(info);
        data.SubmitChanges();
        Response.Write("<script>alert('Update success.');</script>");
    }
}