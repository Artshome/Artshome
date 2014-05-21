using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminNews : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    protected static List<Table_News> news = new List<Table_News>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            news = dbc.GetAllNews();
            button6.Attributes.Add("onclick", "return confirm('Delete confirmed?');");
        }
    }
    protected void button1_Click(object sender, EventArgs e)
    {
        Label6.Text = Label7.Text = Label9.Text = String.Empty;
        textbox1.Text = textarea1.Value = String.Empty;
        panel1.Visible = true;
        panel2.Visible = false;
        panel3.Visible = false;
        panel4.Visible = false;
    }
    protected void button2_Click(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        Label4.Text = Label8.Text = Label18.Text = String.Empty;
        textarea2.Value = textbox3.Text = String.Empty;
        foreach (Table_News _news in news)
        {
            DropDownList1.Items.Add(_news.Id.ToString());
        }
        DropDownList1_SelectedIndexChanged(sender, e);
        
        panel1.Visible = false;
        panel2.Visible = true;
        panel3.Visible = false;
        panel4.Visible = false;
    }
    protected void button3_Click(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        foreach (Table_News _news in news)
        {
            DropDownList2.Items.Add(_news.Id.ToString());
        }
        panel1.Visible = false;
        panel2.Visible = false;
        panel3.Visible = true;
        panel4.Visible = false;
    }
    protected void button4_Click(object sender, EventArgs e)
    {
        Label6.Text = Label7.Text = Label9.Text = String.Empty;
        if (textbox1.Text.Equals(String.Empty) ||
            textarea1.Value.Equals(String.Empty))
        {
            if (textbox1.Text.Equals(String.Empty))
                Label6.Text = "*";
            if (textarea1.Value.Equals(String.Empty))
                Label7.Text = "*";
            Label9.Text = "Input mark by * is required.";
            return;
        }
        try
        {

            Table_News _news = new Table_News();
            _news.Title = textbox1.Text;
            _news.Body = textarea1.Value;
            _news.Date = DateTime.Now;
            dbc.AddNews(_news);
            news.Add(_news);
            panel1.Visible = false;
            Label20.Text = "Successfully Added.";
            panel4.Visible = true;
            return;
        }
        catch (Exception e1)
        {
            Console.Write(e1.ToString());
        }
    }
    protected void button5_Click(object sender, EventArgs e)
    {
        Label4.Text = Label8.Text = Label18.Text = String.Empty;

        if (textbox3.Text.Equals(String.Empty) ||
            textarea2.Value.Equals(String.Empty))
        {
            if (textbox3.Text.Equals(String.Empty))
                Label4.Text = "*";
            if (textarea2.Value.Equals(String.Empty))
                Label8.Text = "*";
            Label18.Text = "Input mark by * is required.";
            return;
        }
        try
        {
            Table_News _news = new Table_News();
            _news.Id = Convert.ToInt32(DropDownList1.SelectedItem.ToString());
            _news.Title = textbox3.Text;
            _news.Body = textarea2.Value;
            _news.Date = DateTime.Now;
            dbc.UpdateNews(_news);
            for (int i = 0; i < news.Count; i++)
            {
                if (news[i].Id == _news.Id)
                {
                    news[i].Title = _news.Title;
                    news[i].Body = _news.Body;
                    news[i].Date = _news.Date;

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
            dbc.DeleteNews(Convert.ToInt32(DropDownList2.SelectedItem.ToString()));
            for (int i = 0; i < news.Count; i++)
            {
                if (news[i].Id.ToString() == DropDownList2.SelectedItem.ToString())
                {
                    news.RemoveAt(i);
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
        foreach (Table_News _news in news)
        {
            if (_news.Id.ToString()== DropDownList1.SelectedItem.ToString())
            {
                textbox3.Text = _news.Title;
                textarea2.Value = _news.Body;
                break;
            }
        }
    }
}