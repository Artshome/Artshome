using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void button1_Click(object sender, EventArgs e)
    {
        Label1.Text = Label2.Text = Label3.Text = String.Empty;
        if (textbox1.Text.Equals(String.Empty) ||
            textbox2.Text.Equals(String.Empty))
        {
            if (textbox1.Text.Equals(String.Empty))
                Label1.Text = " *";
            if (textbox2.Text.Equals(String.Empty))
                Label2.Text = " *";
            Label3.Text = "Input mark by * is required.";
            return;
        }
        try
        {
            Dbc dbc = new Dbc();
            Admin admin = dbc.GetAdminByName(this.textbox1.Text);
            if (admin!=null && admin.Password == this.textbox2.Text)
            {
                Session["adminName"] = admin.Name.Trim();
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "updateScript", "window.location.href='AdminDefault.aspx'", true);
                return;
            }
            else
            {
                this.Label3.Text = "Bad name or password.";
                return;
            }
        }
        catch (Exception e1)
        {
            Console.Write(e1.ToString());
        }
    }
    
}