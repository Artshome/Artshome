using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bespoke : System.Web.UI.Page
{
    private DataClassesDataContext data = new DataClassesDataContext();
    protected static Table_Bespoke bespoke1 = new Table_Bespoke();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var q = from s in data.Table_Bespoke
                    select s;
            bespoke1 = q.First();
        }
    }
}