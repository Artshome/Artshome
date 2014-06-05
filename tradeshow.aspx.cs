using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tradeshow : System.Web.UI.Page
{
    private Dbc dbc = new Dbc();
    protected static List<Table_TradeShow> tradeshowlist = new List<Table_TradeShow>();
    //protected static Table_TradeShow tradeshow10 = new Table_TradeShow();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tradeshowlist = dbc.GetALLTradeShow();
            //tradeshow10 = dbc.GetTradeShowByName(Request["tradeshowName"]);
        }
    }
}