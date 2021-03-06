﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDesigner : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    protected static List<Table_Designer> designers = new List<Table_Designer>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            designers = dbc.GetALLDesigner();
            button6.Attributes.Add("onclick", "return confirm('Delete confirmed?');");
        }
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
        DropDownList1.Items.Clear();
        foreach (Table_Designer designer in designers)
        {
            DropDownList1.Items.Add(designer.id.ToString());
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
        DropDownList2.Items.Clear();
        foreach (Table_Designer designer in designers)
        {
            DropDownList2.Items.Add(designer.id.ToString());
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
            !FileUpload1.HasFile)
        {
            if (textbox1.Text.Equals(String.Empty))
                Label6.Text = "*";
            if (textbox2.Text.Equals(String.Empty))
                Label7.Text = "*";
            if (!FileUpload1.HasFile)
                Label8.Text = "*";
            Label21.Text = "Input mark by * is required.";
            panel5.Visible = true;
            return;
        }
        try
        {

            Table_Designer designer = new Table_Designer();
            designer.name = textbox1.Text;
            designer.description = textbox2.Text;
            designer.imageUrl = @"images/designer/" + FileUpload1.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(designer.imageUrl);
            FileUpload1.PostedFile.SaveAs(mappath);
            dbc.AddDesigner(designer);
            designers.Add(designer);
            panel1.Visible = false;
            Label20.Text = "Successfully Added.";
            panel4.Visible = true;
            panel5.Visible = false;
            GridView1.DataBind();
            return;

        }
        catch (Exception e1)
        {
            Console.Write(e1.ToString());
        }
    }
    protected void button5_Click(object sender, EventArgs e)
    {
        Label14.Text = Label15.Text = String.Empty;

        if (textbox3.Text.Equals(String.Empty) || (checkbox1.Checked == false && !FileUpload2.HasFile))
        {
            if (textbox3.Text.Equals(String.Empty))
                Label14.Text = "*";
            if (checkbox1.Checked == false && !FileUpload2.HasFile)
                Label15.Text = "*";
            Label21.Text = "Input mark by * is required.";
            panel5.Visible = true;
            return;
        }
        try
        {
            Table_Designer designer = new Table_Designer();

            designer.id = Convert.ToInt32(DropDownList1.SelectedItem.ToString());
            designer.name = textbox4.Text;
            designer.description = textbox3.Text;
            if (checkbox1.Checked == true)
            {
                designer.imageUrl = dbc.GetDesignerById(designer.id).imageUrl;
            }
            else
            {
                designer.imageUrl = @"images/designer/" + FileUpload2.PostedFile.FileName.ToString();
                String mappath = Server.MapPath(designer.imageUrl);
                FileUpload2.PostedFile.SaveAs(mappath);
            }
            dbc.UpdateDesigner(designer);
            foreach (Table_Designer d in designers)
            {
                if (d.name == designer.name)
                {
                    d.imageUrl = designer.imageUrl;
                    d.description = designer.description;
                    break;
                }

            }
            panel2.Visible = false;
            Label20.Text = "Successfully updated.";
            panel4.Visible = true;
            panel5.Visible = false;
            GridView1.DataBind();
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
            dbc.DeleteDesigner(Convert.ToInt32(DropDownList2.SelectedItem.ToString()));
            for (int i = 0; i < designers.Count; i++)
            {
                if (designers[i].id == Convert.ToInt32(DropDownList2.SelectedItem.ToString()))
                {
                    designers.RemoveAt(i);
                    break;
                }
            }
            panel3.Visible = false;
            Label20.Text = "Successfully deleted.";
            panel4.Visible = true;
            GridView1.DataBind();
        }
        catch (Exception e1)
        {
            Console.Write(e1.ToString());
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (Table_Designer designer in designers)
        {
            if (designer.id == Convert.ToInt32(DropDownList1.SelectedItem.ToString()))
            {
                textbox4.Text = designer.name;
                textbox3.Text = designer.description;
                break;
            }
        }
    }
    protected void checkbox1_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload2.Visible = checkbox1.Checked? false : true;
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].Cells[2].Text.Length > 100)
            {
                GridView1.Rows[i].Cells[2].Text = GridView1.Rows[i].Cells[2].Text.Substring(0, 99);
                GridView1.Rows[i].Cells[2].Text += "...";
            }
        }
    }
}