using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminAdmin : System.Web.UI.Page
{
    private Dbc dbc =new Dbc();
    protected static List<Admin> admins = new List<Admin>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            admins = dbc.GetALLAdmin();
            button6.Attributes.Add("onclick", "return confirm('Delete confirmed?');");
        }
    }

    protected void button1_Click(object sender, EventArgs e)
    {
        Label6.Text = Label7.Text = Label8.Text = Label9.Text = String.Empty;
        textbox1.Text = textbox2.Text = textbox3.Text = String.Empty;
        panel1.Visible = true;
        panel2.Visible = false;
        panel3.Visible = false;
        panel4.Visible = false;
    }
    protected void button2_Click(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        foreach (Admin admin in admins)
        {
            DropDownList1.Items.Add(admin.Name);
        }
        DropDownList1_SelectedIndexChanged(sender, e);
        Label14.Text = Label16.Text = Label18.Text = String.Empty;
        textbox4.Text = textbox5.Text = String.Empty;
        panel1.Visible = false;
        panel2.Visible = true;
        panel3.Visible = false;
        panel4.Visible = false;
    }
    protected void button3_Click(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        foreach (Admin admin in admins)
        {
            DropDownList2.Items.Add(admin.Name);
        }
        panel1.Visible = false;
        panel2.Visible = false;
        panel3.Visible = true;
        panel4.Visible = false;

    }
    protected void button4_Click(object sender, EventArgs e)
    {

        Label6.Text = Label7.Text = Label8.Text = Label9.Text = String.Empty;

        if (textbox1.Text.Equals(String.Empty) ||
            textbox2.Text.Equals(String.Empty) ||
            textbox3.Text.Equals(String.Empty))
        {
            if (textbox1.Text.Equals(String.Empty))
                Label6.Text = "*";
            if (textbox2.Text.Equals(String.Empty))
                Label7.Text = "*";
            if (textbox3.Text.Equals(String.Empty))
                Label8.Text = "*";
            Label9.Text = "Input mark by * is required.";
            return;
        }

        if (!this.textbox2.Text.Equals(this.textbox3.Text))
        {
            this.Label9.Text = "Passwords must be matched.";
            return;
        }
        try
        {
            if (dbc.GetAdminByName(this.textbox1.Text) == null)
            {
                Admin admin = new Admin();
                admin.Name = textbox1.Text;
                admin.Password = textbox2.Text;
                admin.ProductPermission = checkbox1.Checked == true ? 1 : 0;
                admin.CollectionPermission = checkbox2.Checked == true ? 1 : 0;
                admin.DesignerPermission = checkbox3.Checked == true ? 1 : 0;
                admin.SuperPermission = checkbox4.Checked == true ? 1 : 0;
                dbc.AddAdmin(admin);
                admins.Add(admin);
                panel1.Visible = false;
                Label20.Text = "Successfully Added.";
                panel4.Visible = true;
                return;
            }
            else
            {
                this.Label9.Text = "Admin name is already exist.";
                return;
            }
        }
        catch (Exception e1)
        {
            Console.Write(e1.ToString());
        }
    }
    protected void button5_Click(object sender, EventArgs e)
    {
        Label14.Text = Label16.Text = Label18.Text = String.Empty;

        if (textbox4.Text.Equals(String.Empty) ||
            textbox5.Text.Equals(String.Empty))
        {
            if (textbox4.Text.Equals(String.Empty))
                Label14.Text = "*";
            if (textbox5.Text.Equals(String.Empty))
                Label16.Text = "*";
            Label18.Text = "Input mark by * is required.";
            return;
        }
        if (!this.textbox4.Text.Equals(this.textbox5.Text))
        {
            this.Label18.Text = "Passwords must be matched.";
            return;
        }
        try
        {

            Admin admin = new Admin();
            admin.Name = DropDownList1.SelectedItem.ToString();
            admin.Password = textbox4.Text;
            admin.ProductPermission = checkbox5.Checked == true ? 1 : 0;
            admin.CollectionPermission = checkbox6.Checked == true ? 1 : 0;
            admin.DesignerPermission = checkbox7.Checked == true ? 1 : 0;
            admin.SuperPermission = checkbox8.Checked == true ? 1 : 0;
            dbc.UpdateAdmin(admin);
            for (int i = 0; i < admins.Count; i++)
            {
                if (admins[i].Name == admin.Name)
                {
                    admins[i].Password = admin.Password;
                    admins[i].DesignerPermission = admin.DesignerPermission;
                    admins[i].SuperPermission = admin.SuperPermission;
                    admins[i].CollectionPermission = admin.CollectionPermission;
                    admins[i].ProductPermission = admin.ProductPermission;
                    break;
                }
            }
            panel2.Visible = false;
            Label20.Text = "Successfully updated.";
            panel4.Visible = true;
            return;
        }
        catch (Exception e1)
        {
            Console.Write(e1.ToString());
        }
    }
    protected void button6_Click(object sender, EventArgs e)
    {
        try
        {
            dbc.DeleteAdmin(DropDownList2.SelectedItem.ToString());
            for (int i = 0; i < admins.Count; i++)
            {
                if (admins[i].Name == DropDownList2.SelectedItem.ToString())
                {
                    admins.RemoveAt(i);
                    break;
                }
            }
            panel3.Visible = false;
            Label20.Text = "Successfully deleted.";
            panel4.Visible = true;
        }
        catch (Exception e1)
        {
            Console.Write(e1.ToString());
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (Admin admin in admins)
        {
            if (admin.Name == DropDownList1.SelectedItem.ToString())
            {
                checkbox5.Checked = admin.ProductPermission == 1 ? true : false;
                checkbox6.Checked = admin.CollectionPermission == 1 ? true : false;
                checkbox7.Checked = admin.DesignerPermission == 1 ? true : false;
                checkbox8.Checked = admin.SuperPermission == 1 ? true : false;
                break;
            }
        }
    }

    
}