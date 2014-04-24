using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDesigner : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    private Designer designer = new Designer();
    private List<Designer> designers = new List<Designer>();
    protected void Page_Load(object sender, EventArgs e)
    {
        button6.Attributes.Add("onclick", "return confirm('Delete confirmed?');"); 
    }
    protected void button1_Click(object sender, EventArgs e)
    {
        Label6.Text = Label7.Text = Label8.Text = String.Empty;
        textbox1.Text = textbox2.Text = String.Empty;
        panel1.Visible = true;
        panel2.Visible = false;
        panel3.Visible = false;
        panel4.Visible = false;
        panel5.Visible = false;
    }
    protected void button2_Click(object sender, EventArgs e)
    {
        designers = dbc.GetALLDesigner();
        DropDownList1.Items.Clear();
        foreach (Designer designer in designers)
        {
            DropDownList1.Items.Add(designer.Name);
        }
        Label14.Text = Label15.Text = String.Empty;
        textbox3.Text = String.Empty;
        DropDownList1_SelectedIndexChanged(sender, e);
        checkbox1.Checked = true;
        checkbox1_CheckedChanged(sender, e);
        panel1.Visible = false;
        panel2.Visible = true;
        panel3.Visible = false;
        panel4.Visible = false;
        panel5.Visible = false;
    }
    protected void button3_Click(object sender, EventArgs e)
    {
        designers = dbc.GetALLDesigner();
        DropDownList2.Items.Clear();
        foreach (Designer designer in designers)
        {
            DropDownList2.Items.Add(designer.Name);
        }
        panel1.Visible = false;
        panel2.Visible = false;
        panel3.Visible = true;
        panel4.Visible = false;
        panel5.Visible = false;
    }
    protected void button4_Click(object sender, EventArgs e)
    {
        Label6.Text = Label7.Text = Label8.Text = String.Empty;

        if (textbox1.Text.Equals(String.Empty) ||
            textbox2.Text.Equals(String.Empty) ||
            FileUpload1.HasFile == false)
        {
            if (textbox1.Text.Equals(String.Empty))
                Label6.Text = "*";
            if (textbox2.Text.Equals(String.Empty))
                Label7.Text = "*";
            if (FileUpload1.HasFile == false)
                Label8.Text = "*";
            Label21.Text = "Input mark by * is required.";
            panel5.Visible = true;
            return;
        }
        try
        {
            if (dbc.GetDesignerByName(this.textbox1.Text) == null)
            {
                Designer designer = new Designer();
                designer.Name = textbox1.Text;
                designer.Description = textbox2.Text;
                designer.ImageUrl = @"images/designer/" + FileUpload1.PostedFile.FileName.ToString();
                String mappath = Server.MapPath(designer.ImageUrl);
                FileUpload1.PostedFile.SaveAs(mappath);
                dbc.AddDesigner(designer);
                panel1.Visible = false;
                Label20.Text = "Successfully Added.";
                panel4.Visible = true;
                return;
            }
            else
            {
                Label21.Text = "Designer name is already exist.";
                panel5.Visible = true;
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
        Label14.Text = Label15.Text = String.Empty;

        if (textbox3.Text.Equals(String.Empty) || (checkbox1.Checked == false && FileUpload2.HasFile == false))
        {
            if (textbox3.Text.Equals(String.Empty))
                Label14.Text = "*";
            if (checkbox1.Checked == false && FileUpload2.HasFile == false)
                Label15.Text = "*";
            Label21.Text = "Input mark by * is required.";
            panel5.Visible = true;
            return;
        }
        try
        {
            Designer designer = new Designer();
            designer.Name = DropDownList1.SelectedItem.ToString();
            designer.Description = textbox3.Text;
            if (checkbox1.Checked == true)
            {
                designer.ImageUrl = dbc.GetDesignerByName(designer.Name).ImageUrl;
            }
            else
            {
                designer.ImageUrl = @"images/designer/" + FileUpload2.PostedFile.FileName.ToString();
                String mappath = Server.MapPath(designer.ImageUrl);
                FileUpload2.PostedFile.SaveAs(mappath);
            }
            dbc.UpdateDesigner(designer);
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
            dbc.DeleteDesigner(DropDownList2.SelectedItem.ToString());
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
        designer = dbc.GetDesignerByName(DropDownList1.SelectedItem.ToString());
        textbox3.Text = designer.Description;
    }
    protected void checkbox1_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload2.Visible = checkbox1.Checked == true ? false : true;
    }
}