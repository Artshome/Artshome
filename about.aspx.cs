using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class about : System.Web.UI.Page
{
    private DataClassesDataContext data = new DataClassesDataContext();
    protected static Table_Info info = new Table_Info();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var q = from s in data.Table_Info
                    select s;
            info = q.First();
        }
    }
}