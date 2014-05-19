using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class designer : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    protected static Table_Designer _designer = new Table_Designer();
    protected static List<Table_Collection> collections = new List<Table_Collection>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            _designer = dbc.GetDesignerByName(Request["designerName"]);
            collections = dbc.GetCollectionByDesignerName(Request["designerName"]);
        }
    }
}