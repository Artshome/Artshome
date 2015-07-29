using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminBespoke : System.Web.UI.Page
{
    private DataClassesDataContext data = new DataClassesDataContext();
    protected static Table_Bespoke bespoke = new Table_Bespoke();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var q = from s in data.Table_Bespoke
                    select s;
            bespoke = q.First();
            textarea1.Value = bespoke.contentText;
        }
    }
    protected void button1_Click(object sender, EventArgs e)
    {
        if (textarea1.Value.Equals(String.Empty) || (checkbox1.Checked == false && !FileUpload1.HasFile))
        {
            Response.Write("<script>alert('All input fields can not be empty!');</script>");
            return;
        }
        bespoke.id = 1;
        bespoke.contentText = textarea1.Value;
        if (checkbox1.Checked == true)
        {
            bespoke.imageUrl = bespoke.imageUrl;
        }
        else
        {
            bespoke.imageUrl = @"images/bespoke/" + FileUpload1.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(bespoke.imageUrl);
            FileUpload1.PostedFile.SaveAs(mappath);
        }
        var q = from s in data.Table_Bespoke
                select s;
        data.Table_Bespoke.DeleteAllOnSubmit(q);
        data.Table_Bespoke.InsertOnSubmit(bespoke);
        data.SubmitChanges();
        Response.Write("<script>alert('Update success.');</script>");
    }
    protected void checkbox1_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload1.Visible = checkbox1.Checked ? false : true;
    }
}