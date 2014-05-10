using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    protected static List<Product> productslist = new List<Product>();
    protected static Collection collection = new Collection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            productslist = dbc.GetProductByCollectionName(Request["collectionName"]);
            collection = dbc.GetCollectionByName(Request["collectionName"]);
        }
    }
}