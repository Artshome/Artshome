using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private Dbc dbc = new Dbc();
    private DataClassesDataContext data = new DataClassesDataContext();
    protected static List<Table_Designer> designers = new List<Table_Designer>();
    protected static List<Table_Collection> collections = new List<Table_Collection>();
    protected static String companyName = String.Empty;
    protected static Table_Info info = new Table_Info();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            designers = dbc.GetALLDesigner();
            collections = dbc.GetALLCollection();
            var q = from s in data.Table_Info
                    select s.CompanyName;
            companyName = q.First();
            var p = from s in data.Table_Info
                    select s;
            info = p.First();
        }
    }

}
