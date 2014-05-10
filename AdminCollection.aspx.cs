using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminCollection : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    private Collection collection = new Collection();
    protected static List<Collection> collections = new List<Collection>();
    protected static List<Designer> designers = new List<Designer>();
    private Designer designer =new Designer();
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
        foreach (Designer designer in designers)
            DropDownList1.Items.Add(designer.Name);
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
        foreach (Collection collection in collections)
            DropDownList2.Items.Add(collection.Name);
        DropDownList3.Items.Clear();
        foreach (Designer designer in designers)
            DropDownList3.Items.Add(designer.Name);
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
        foreach (Collection collection in collections)
            DropDownList4.Items.Add(collection.Name);
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
            if (dbc.GetCollectionByName(this.textbox1.Text) == null)
            {
                Collection collection = new Collection();
                collection.Name = textbox1.Text;
                collection.Description = textbox2.Text;
                collection.DesignerName = DropDownList1.SelectedItem.ToString();
                collection.ImageUrl = @"images/collection/" + FileUpload1.PostedFile.FileName.ToString();
                String mappath = Server.MapPath(collection.ImageUrl);
                FileUpload1.PostedFile.SaveAs(mappath);
                dbc.AddCollection(collection);
                collections.Add(collection);
                panel1.Visible = false;
                Label20.Text = "Successfully Added.";
                panel4.Visible = true;
                panel5.Visible = false;
                return;
            }
            else
            {
                Label21.Text = "Collection name is already exist.";
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
            Collection collection = new Collection();
            collection.Name = DropDownList2.SelectedItem.ToString();
            collection.DesignerName = DropDownList3.SelectedItem.ToString();
            collection.Description = textbox3.Text;
            if (checkbox1.Checked == true)
            {
                collection.ImageUrl = dbc.GetCollectionByName(collection.Name).ImageUrl;
            }
            else
            {
                collection.ImageUrl = @"images/collection/" + FileUpload2.PostedFile.FileName.ToString();
                String mappath = Server.MapPath(collection.ImageUrl);
                FileUpload2.PostedFile.SaveAs(mappath);
            }
            dbc.UpdateCollection(collection);
            foreach (Collection c in collections)
            {
                if (c.Name == collection.Name)
                {
                    c.Description = collection.Description;
                    c.DesignerName = collection.DesignerName;
                    c.ImageUrl = collection.ImageUrl;
                    break;
                }
            }
            panel2.Visible = false;
            Label20.Text = "Successfully updated.";
            panel4.Visible = true;
            panel5.Visible = false;
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
            dbc.DeleteCollection(DropDownList4.SelectedItem.ToString());
            for (int i = 0; i < collections.Count; i++)
            {
                if (collections[i].Name == DropDownList4.SelectedItem.ToString())
                {
                    collections.RemoveAt(i);
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
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (Collection collection in collections)
        {
            if (collection.Name == DropDownList2.SelectedItem.ToString())
            {
                textbox3.Text = collection.Description;
                break;
            }
        }
    }

    protected void checkbox1_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload2.Visible = checkbox1.Checked == true ? false : true;
    }
}