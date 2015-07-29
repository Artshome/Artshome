using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminBanners : System.Web.UI.Page
{
    private DataClassesDataContext data = new DataClassesDataContext();
    protected static Table_Banners banners = new Table_Banners();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var q = from s in data.Table_Banners
                    select s;
            banners = q.First();

        }
    }
    protected void checkbox1_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload1.Visible = checkbox1.Checked ? false : true;
    }
    protected void checkbox2_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload2.Visible = checkbox1.Checked ? false : true;
    }
    protected void checkbox3_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload3.Visible = checkbox1.Checked ? false : true;
    }
    protected void checkbox4_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload4.Visible = checkbox1.Checked ? false : true;
    }
    protected void checkbox5_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload5.Visible = checkbox1.Checked ? false : true;
    }
    protected void checkbox6_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload6.Visible = checkbox1.Checked ? false : true;
    }
    protected void checkbox7_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload7.Visible = checkbox1.Checked ? false : true;
    }
    protected void checkbox8_CheckedChanged(object sender, EventArgs e)
    {
        FileUpload8.Visible = checkbox1.Checked ? false : true;
    }
    protected void button1_Click(object sender, EventArgs e)
    {
        if ((checkbox1.Checked == false && !FileUpload1.HasFile)||(checkbox2.Checked == false && !FileUpload2.HasFile)||(checkbox3.Checked == false && !FileUpload3.HasFile)||(checkbox4.Checked == false && !FileUpload4.HasFile)||(checkbox5.Checked == false && !FileUpload5.HasFile)||(checkbox6.Checked == false && !FileUpload6.HasFile)||(checkbox7.Checked == false && !FileUpload7.HasFile)||(checkbox8.Checked == false && !FileUpload8.HasFile))
        {
            Response.Write("<script>alert('All input fields can not be empty!');</script>");
            return;
        }
        banners.id=1;
        if (checkbox1.Checked == false)
        {
            banners.pic1Url = @"images/banners/" + FileUpload1.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(banners.pic1Url);
            FileUpload1.PostedFile.SaveAs(mappath);
        }
        if (checkbox2.Checked == false)
        {
            banners.pic2Url = @"images/banners/" + FileUpload2.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(banners.pic2Url);
            FileUpload2.PostedFile.SaveAs(mappath);
        }
        if (checkbox3.Checked == false)
        {
            banners.pic3Url = @"images/banners/" + FileUpload3.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(banners.pic3Url);
            FileUpload3.PostedFile.SaveAs(mappath);
        }
        if (checkbox4.Checked == false)
        {
            banners.pic4Url = @"images/banners/" + FileUpload4.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(banners.pic4Url);
            FileUpload4.PostedFile.SaveAs(mappath);
        }
        if (checkbox5.Checked == false)
        {
            banners.pic5Url = @"images/banners/" + FileUpload5.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(banners.pic5Url);
            FileUpload5.PostedFile.SaveAs(mappath);
        }
        if (checkbox6.Checked == false)
        {
            banners.pic6Url = @"images/banners/" + FileUpload6.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(banners.pic6Url);
            FileUpload6.PostedFile.SaveAs(mappath);
        }
        if (checkbox7.Checked == false)
        {
            banners.pic7Url = @"images/banners/" + FileUpload7.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(banners.pic7Url);
            FileUpload7.PostedFile.SaveAs(mappath);
        }
        if (checkbox8.Checked == false)
        {
            banners.pic8Url = @"images/banners/" + FileUpload8.PostedFile.FileName.ToString();
            String mappath = Server.MapPath(banners.pic8Url);
            FileUpload8.PostedFile.SaveAs(mappath);
        }
        var q = from s in data.Table_Banners
                select s;
        data.Table_Banners.DeleteAllOnSubmit(q);
        data.Table_Banners.InsertOnSubmit(banners);
        data.SubmitChanges();
        Response.Write("<script>alert('Update success.');</script>");



    }
}