using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminProduct : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    private Table_Product product = new Table_Product();
    protected static List<Table_Product> products = new List<Table_Product>();
    protected static List<Table_Collection> collections = new List<Table_Collection>();
    private Table_Designer designer = new Table_Designer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            collections = dbc.GetALLCollection();
            products = dbc.GetAllProduct();
            button6.Attributes.Add("onclick", "return confirm('Delete confirmed?');");
        }
    }
    protected void button1_Click(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        foreach (Table_Collection collection in collections)
            DropDownList1.Items.Add(collection.name);
        Label6.Text = Label7.Text = Label8.Text = Label26.Text = String.Empty;
        textbox1.Text = textbox2.Text = textbox3.Text = String.Empty;
        panel1.Visible = true;
        panel2.Visible = false;
        panel3.Visible = false;
        panel4.Visible = false;
        panel5.Visible = false;
    }
    protected void button2_Click(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        foreach (Table_Product product in products)
            DropDownList2.Items.Add(product.code);
        DropDownList3.Items.Clear();
        foreach (Table_Collection collection in collections)
            DropDownList3.Items.Add(collection.name);
        Label14.Text = Label22.Text = String.Empty;
        textbox4.Text = textbox5.Text = String.Empty;
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
        foreach (Table_Product product in products)
            DropDownList4.Items.Add(product.code);
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
            textbox3.Text.Equals(String.Empty) ||
            FileUpload1.HasFile == false)
        {
            if (textbox1.Text.Equals(String.Empty))
                Label6.Text = "*";
            if (textbox2.Text.Equals(String.Empty))
                Label7.Text = "*";
            if (textbox3.Text.Equals(String.Empty))
                Label26.Text = "*";
            if (FileUpload1.HasFile == false)
                Label8.Text = "*";
            Label21.Text = "Input mark by * is required.";
            panel5.Visible = true;
            return;
        }
        try
        {
            if (dbc.GetProductByCode(this.textbox1.Text) == null)
            {
                Table_Product product = new Table_Product();
                product.code = textbox1.Text;
                product.shape = textbox2.Text;
                product.size = textbox3.Text;
                product.collection = DropDownList1.SelectedItem.ToString();
                product.imageUrl = @"images/product/" + FileUpload1.PostedFile.FileName.ToString();
                String mappath = Server.MapPath(product.imageUrl);
                FileUpload1.PostedFile.SaveAs(mappath);
                dbc.AddProduct(product);
                products.Add(product);
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
        Label14.Text = Label15.Text = Label22.Text =String.Empty;

        if (textbox4.Text.Equals(String.Empty) || 
            textbox5.Text.Equals(String.Empty) ||
            (checkbox1.Checked == false && FileUpload2.HasFile == false))
        {
            if (textbox4.Text.Equals(String.Empty))
                Label14.Text = "*";
            if (textbox5.Text.Equals(String.Empty))
                Label22.Text = "*";
            if (checkbox1.Checked == false && FileUpload2.HasFile == false)
                Label15.Text = "*";
            Label21.Text = "Input mark by * is required.";
            panel5.Visible = true;
            return;
        }
        try
        {
            Table_Product product = new Table_Product();
            product.code = DropDownList2.SelectedItem.ToString();
            product.shape = textbox4.Text;
            product.size = textbox5.Text;
            product.collection = DropDownList3.SelectedItem.ToString();
            if (checkbox1.Checked == true)
            {
                product.imageUrl = dbc.GetProductByCode(product.code).imageUrl;
            }
            else
            {
                product.imageUrl = @"images/product/" + FileUpload2.PostedFile.FileName.ToString();
                String mappath = Server.MapPath(product.imageUrl);
                FileUpload2.PostedFile.SaveAs(mappath);
            }
            dbc.UpdateProduct(product);
            foreach (Table_Product p in products)
            {
                if (p.code == product.code)
                {
                    p.shape = product.shape;
                    p.size = product.size;
                    p.collection = product.collection;
                    p.imageUrl = product.imageUrl;
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
            dbc.DeleteProduct(DropDownList4.SelectedItem.ToString());
            for (int i = 0; i < products.Count; i++)
            {
                if (products[i].code == DropDownList4.SelectedItem.ToString())
                {
                    products.RemoveAt(i);
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
        foreach (Table_Product product in products)
        {
            if (product.code == DropDownList2.SelectedItem.ToString())
            {
                textbox4.Text = product.shape;
				textbox5.Text = product.size;
                break;
            }
        }
    }

    protected void checkbox1_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload2.Visible = checkbox1.Checked == true ? false : true;
    }
}
