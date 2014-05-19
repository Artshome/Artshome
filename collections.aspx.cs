using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class collections : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    protected static List<Table_Collection> collectionslist = new List<Table_Collection>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            collectionslist = dbc.GetALLCollection();
        }
    }
}