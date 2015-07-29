using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminCollection : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    private Table_Collection collection = new Table_Collection();
    protected static List<Table_Collection> collections = new List<Table_Collection>();
    protected static List<Table_Designer> designers = new List<Table_Designer>();
    private Table_Designer designer =new Table_Designer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            collections = dbc.GetALLCollection();
            designers = dbc.GetALLDesigner();
            button6.Attributes.Add("onclick", "return confirm('Delete confirmed?');");
        }
    }
    protected void button1_Click(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        foreach (Table_Designer designer in designers)
            DropDownList1.Items.Add(designer.name);
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
        DropDownList2.Items.Clear();
        foreach (Table_Collection collection in collections)
            DropDownList2.Items.Add(collection.id.ToString());
        DropDownList3.Items.Clear();
        foreach (Table_Designer designer in designers)
            DropDownList3.Items.Add(designer.name);
        Label14.Text = Label15.Text = String.Empty;
        textbox3.Text = String.Empty;
        DropDownList2_SelectedIndexChanged(sender, e);
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
        DropDownList4.Items.Clear();
        foreach (Table_Collection collection in collections)
            DropDownList4.Items.Add(collection.id.ToString());
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

            Table_Collection collection = new Table_Collection();
            collection.name = textbox1.Text;
            collection.description = textbox2.Text;
            collection.designer = DropDownList1.SelectedItem.ToString();
            collection.imageUrl = @"images/collection/" + FileUpload1.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(collection.imageUrl);
            FileUpload1.PostedFile.SaveAs(mappath);
            dbc.AddCollection(collection);
            collections.Add(collection);
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
            Table_Collection collection = new Table_Collection();
            collection.id = Convert.ToInt32(DropDownList2.SelectedItem.Text);
            collection.name = textbox4.Text;
            collection.designer = DropDownList3.SelectedItem.ToString();
            collection.description = textbox3.Text;
            if (checkbox1.Checked == true)
            {
                collection.imageUrl = dbc.GetCollectionById(collection.id).imageUrl;
            }
            else
            {
                collection.imageUrl = @"images/collection/" + FileUpload2.PostedFile.FileName.ToString();
                String mappath = Server.MapPath(collection.imageUrl);
                FileUpload2.PostedFile.SaveAs(mappath);
            }
            dbc.UpdateCollection(collection);
            foreach (Table_Collection c in collections)
            {
                if (c.name == collection.name)
                {
                    c.description = collection.description;
                    c.designer = collection.designer;
                    c.imageUrl = collection.imageUrl;
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
            dbc.DeleteCollection(Convert.ToInt32(DropDownList4.SelectedItem.ToString()));
            for (int i = 0; i < collections.Count; i++)
            {
                if (collections[i].id == Convert.ToInt32(DropDownList4.SelectedItem.ToString()))
                {
                    collections.RemoveAt(i);
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
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (Table_Collection collection in collections)
        {
            if (collection.id == Convert.ToInt32(DropDownList2.SelectedItem.ToString()))
            {
                textbox4.Text = collection.name;
                textbox3.Text = collection.description;
                break;
            }
        }
    }

    protected void checkbox1_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload2.Visible = checkbox1.Checked == true ? false : true;
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