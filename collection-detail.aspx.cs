using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    protected static List<Table_Product> productslist = new List<Table_Product>();
    protected static Table_Collection collection = new Table_Collection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            productslist = dbc.GetProductByCollectionName(Request["collectionName"]);
            collection = dbc.GetCollectionByName(Request["collectionName"]);
        }
    }
}