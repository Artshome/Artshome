using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class readNews : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    protected static Table_News news = new Table_News();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            news = dbc.GetNewsById(Convert.ToInt32(Request["newsid"].ToString()));

        }
    }
}