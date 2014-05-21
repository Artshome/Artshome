using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news : System.Web.UI.Page
{
    private Dbc dbc= new Dbc();
    protected static List<Table_News> newslist=new List<Table_News>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            newslist = dbc.GetAllNews();

        }
    }
}