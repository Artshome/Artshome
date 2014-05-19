using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminAdmin : System.Web.UI.Page
{
    private Dbc dbc =new Dbc();
    protected static List<Table_Admin> admins = new List<Table_Admin>();
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
        foreach (Table_Admin admin in admins)
        {
            DropDownList1.Items.Add(admin.name);
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
        foreach (Table_Admin admin in admins)
        {
            DropDownList2.Items.Add(admin.name);
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
                Table_Admin admin = new Table_Admin();
                admin.name = textbox1.Text;
                admin.password = textbox2.Text;
                admin.productPermission = checkbox1.Checked == true ? 1 : 0;
                admin.collectionPermission = checkbox2.Checked == true ? 1 : 0;
                admin.designerPermission = checkbox3.Checked == true ? 1 : 0;
                admin.superPermission = checkbox4.Checked == true ? 1 : 0;
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

            Table_Admin admin = new Table_Admin();
            admin.name = DropDownList1.SelectedItem.ToString();
            admin.password = textbox4.Text;
            admin.productPermission = checkbox5.Checked == true ? 1 : 0;
            admin.collectionPermission = checkbox6.Checked == true ? 1 : 0;
            admin.designerPermission = checkbox7.Checked == true ? 1 : 0;
            admin.superPermission = checkbox8.Checked == true ? 1 : 0;
            dbc.UpdateAdmin(admin);
            for (int i = 0; i < admins.Count; i++)
            {
                if (admins[i].name == admin.name)
                {
                    admins[i].password = admin.password;
                    admins[i].designerPermission = admin.designerPermission;
                    admins[i].superPermission = admin.superPermission;
                    admins[i].collectionPermission = admin.collectionPermission;
                    admins[i].productPermission = admin.productPermission;
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
                if (admins[i].name == DropDownList2.SelectedItem.ToString())
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
        foreach (Table_Admin admin in admins)
        {
            if (admin.name == DropDownList1.SelectedItem.ToString())
            {
                checkbox5.Checked = admin.productPermission == 1 ? true : false;
                checkbox6.Checked = admin.collectionPermission == 1 ? true : false;
                checkbox7.Checked = admin.designerPermission == 1 ? true : false;
                checkbox8.Checked = admin.superPermission == 1 ? true : false;
                break;
            }
        }
    }

    
}