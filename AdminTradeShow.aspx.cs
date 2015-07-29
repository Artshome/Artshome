using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class AdminTradeShow : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    private Table_TradeShow tradeshow = new Table_TradeShow();
    protected static List<Table_TradeShow> tradeshows = new List<Table_TradeShow>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tradeshows = dbc.GetALLTradeShow();
            button6.Attributes.Add("onclick", "return confirm('Delete confirmed?');");
        }
    }

    protected void button1_Click(object sender, EventArgs e)
    {
        Label6.Text = Label7.Text = Label8.Text = Label24.Text = Label25.Text = String.Empty;
        textbox1.Text = textbox3.Text = textbox6.Text = String.Empty;
        Calendar1.SelectedDate = DateTime.Now;
        panel1.Visible = true;
        panel2.Visible = false;
        panel3.Visible = false;
        panel4.Visible = false;
        panel5.Visible = false;
    }

    protected void button2_Click(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        foreach (Table_TradeShow tradeshow in tradeshows)
            DropDownList1.Items.Add(tradeshow.id.ToString());
        Label14.Text = Label22.Text = Label16.Text = Label15.Text = String.Empty;
        textbox5.Text = textbox6.Text = String.Empty;
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
        foreach (Table_TradeShow tradeshow in tradeshows)
            DropDownList2.Items.Add(tradeshow.id.ToString());
        panel1.Visible = false;
        panel2.Visible = false;
        panel3.Visible = true;
        panel4.Visible = false;
        panel5.Visible = false;
    }

    protected void button4_Click(object sender, EventArgs e)
    {
        Label6.Text = Label7.Text = Label8.Text = Label24.Text = Label25.Text = String.Empty;
        if (textbox1.Text.Equals(String.Empty) ||
            
            textbox3.Text.Equals(String.Empty) ||
            textbox6.Text.Equals(String.Empty) ||
            FileUpload1.HasFile == false)
        {
            if (textbox1.Text.Equals(String.Empty))
                Label6.Text = "*";
            if (textbox3.Text.Equals(String.Empty))
                Label24.Text = "*";
            if (textbox6.Text.Equals(String.Empty))
                Label25.Text = "*";
            if (FileUpload1.HasFile == false)
                Label8.Text = "*";
            Label21.Text = "Input mark by * is required.";
            panel5.Visible = true;
            return;
        }
        try
        {

            DateTimeFormatInfo dtFormatInfo = new DateTimeFormatInfo();
            tradeshow.name = textbox1.Text;
            tradeshow.date = Calendar1.SelectedDate;
            tradeshow.date_end = Calendar3.SelectedDate;
            tradeshow.location = textbox3.Text;
            tradeshow.link = textbox6.Text;
            tradeshow.image = @"images/tradeshow/" + FileUpload1.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(tradeshow.image);
            FileUpload1.PostedFile.SaveAs(mappath);
            dbc.AddTradeShow(tradeshow);
            tradeshows.Add(tradeshow);
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
        Label14.Text = Label15.Text = Label22.Text = Label16.Text = String.Empty;

        if (textbox5.Text.Equals(String.Empty) ||
            textbox7.Text.Equals(String.Empty) ||
            (checkbox1.Checked == false && FileUpload2.HasFile == false))
        {
            if (textbox5.Text.Equals(String.Empty))
                Label15.Text = "*";
            if (textbox7.Text.Equals(String.Empty))
                textbox7.Text = "*";
            Label21.Text = "Input mark by * is required.";
            panel5.Visible = true;
            return;
        }
        try
        {
            Table_TradeShow tradeshow = new Table_TradeShow();
            tradeshow.id = Convert.ToInt32(DropDownList1.SelectedItem.ToString());
            tradeshow.name = textbox2.Text;
            tradeshow.date = Calendar2.SelectedDate;
            tradeshow.location = textbox5.Text;
            tradeshow.link = textbox7.Text;
            tradeshow.date_end = Calendar4.SelectedDate;
            if (checkbox1.Checked == true)
            {
                tradeshow.image = dbc.GetTradeShowById(tradeshow.id).image;
            }
            else
            {
                tradeshow.image = @"images/tradeshow/" + FileUpload2.PostedFile.FileName.ToString();
                String mappath = Server.MapPath(tradeshow.image);
                FileUpload2.PostedFile.SaveAs(mappath);
            }
            dbc.UpdateTradeShow(tradeshow);
            foreach (Table_TradeShow t in tradeshows)
            {
                if (t.id == tradeshow.id)
                {
                    t.name = tradeshow.name;
                    t.date = tradeshow.date;
                    t.location = tradeshow.location;
                    t.link = tradeshow.link;
                    t.image = tradeshow.image;
                    break;
                }
            }
            panel2.Visible = false;
            Label20.Text = "Successfully Udated.";
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
            dbc.DeleteTradeShow(Convert.ToInt32(DropDownList2.SelectedItem.ToString()));
            for (int i = 0; i < tradeshows.Count; i++)
            {
                if (tradeshows[i].id == Convert.ToInt32(DropDownList2.SelectedItem.ToString()))
                {
                    tradeshows.RemoveAt(i);
                    break;
                }
            }
            panel3.Visible = false;
            Label20.Text = "Successfully Deleted.";
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
        foreach (Table_TradeShow tradeshow in tradeshows)
        {
            if (tradeshow.id == Convert.ToInt32(DropDownList1.SelectedItem.ToString()))
            {
                Calendar2.SelectedDate = tradeshow.date;
                textbox2.Text = tradeshow.name;
                textbox5.Text = tradeshow.location;
                textbox7.Text = tradeshow.link;
                break;
            }
        }
    }

    protected void checkbox1_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload2.Visible = checkbox1.Checked == true ? false : true;
    }

}