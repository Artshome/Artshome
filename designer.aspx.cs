using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class designer : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    protected static Designer _designer = new Designer();
    protected static List<Collection> collections = new List<Collection>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            _designer = dbc.GetDesignerByName(Request["designerName"]);
            collections = dbc.GetCollectionByDesignerName(Request["designerName"]);
        }
    }
}