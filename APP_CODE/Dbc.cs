using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class Dbc
{
    private readonly String HOSTSTR = "Server=a2a5bad2-d4fc-47f9-b241-a2ed00d7fc16.sqlserver.sequelizer.com;Database=dba2a5bad2d4fc47f9b241a2ed00d7fc16;User ID=tnucjrzwvfrcgpqd;Password=mHVvDSviXMhKcMseBMbVNP4Vh3jhscQ78mgy2jRciNpRGuYn4LKLHZBEN8oJGoYU;";
    private SqlConnection dbConnection;
    private SqlCommand cmd;
	public Dbc()
	{
        dbConnection = new SqlConnection(HOSTSTR);
	}
    //添加新设计师
    public bool AddDesigner(Designer designer)
    {
        try
        {
            dbConnection.Open();
            cmd = new SqlCommand("insert into Table_Designer values('"
                + designer.Name + "','"
                + designer.Description + "','"
                + designer.ImageUrl + "')"
                , dbConnection);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception e)
        {
            Console.Write(e.ToString());
            return false;
        }
        finally
        {
            dbConnection.Close();
        }
    }
    //删除设计师
    public bool DeleteDesigner(String name)
    {
        try
        {
            dbConnection.Open();
            cmd = new SqlCommand("delete from Table_Designer where name = '" + name + "'", dbConnection);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception e)
        {
            Console.Write(e.ToString());
            return false;
        }
        finally
        {
            dbConnection.Close();
        }
    }
    //更新已存在设计师
    public bool UpdateDesigner(Designer designer)
    {
        try
        {
            dbConnection.Open();
            cmd = new SqlCommand("update Table_Designer set description='"
                + designer.Description + "',imageUrl='"
                + designer.ImageUrl + "' where name='"
                + designer.Name + "'", dbConnection);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception e)
        {
            Console.Write(e.ToString());
            return false;
        }
        finally
        {
            dbConnection.Close();
        }
    }
    //根据姓名获取设计师
    public Designer GetDesignerByName(String name)
    {
        try
        {
            dbConnection.Open();
            cmd = new SqlCommand("Select * from Table_Designer where name ='" + name + "'", dbConnection);
            SqlDataReader result = cmd.ExecuteReader();
            while (result.Read())
            {
                Designer designer = new Designer();
                designer.Name = result.GetString(0);
                designer.Description = result.GetString(1);
                designer.ImageUrl = result.GetString(2);
                return designer;
            }
            return null;
        }
        catch (Exception e)
        {
            Console.Write(e.ToString());
            return null;
        }
        finally
        {
            dbConnection.Close();
        }
    }
    //获取所有设计师
    public List<Designer> GetALLDesigner()
    {
        try
        {
            dbConnection.Open();
            cmd = new SqlCommand("Select * from Table_Designer", dbConnection);
            SqlDataReader result = cmd.ExecuteReader();
            List<Designer> designers = new List<Designer>();
            while (result.Read())
            {
                Designer designer = new Designer();
                designer.Name = result.GetString(0);
                designer.Description = result.GetString(1);
                designer.ImageUrl = result.GetString(2);
                designers.Add(designer);
            }
            return designers;
        }
        catch (Exception e)
        {
            Console.Write(e.ToString());
            return null;
        }
        finally
        {
            dbConnection.Close();
        }
    }
    //添加新管理员
    public bool AddAdmin(Admin admin)
    {
        try
        {
            dbConnection.Open();
            cmd = new SqlCommand("insert into Table_Admin values('"
                + admin.Name + "','"
                + admin.Password + "','"
                + admin.ProductPermission.ToString() + "','"
                + admin.CollectionPermission.ToString() + "','"
                + admin.DesignerPermission.ToString() + "','"
                + admin.SuperPermission.ToString() + "')"
                , dbConnection);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception e)
        {
            Console.Write(e.ToString());
            return false;
        }
        finally
        {
            dbConnection.Close();
        }
    }
    //删除管理员
    public bool DeleteAdmin(String name)
    {
        try
        {
            dbConnection.Open();
            cmd = new SqlCommand("delete from Table_Admin where name = '" + name + "'", dbConnection);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception e)
        {
            Console.Write(e.ToString());
            return false;
        }
        finally
        {
            dbConnection.Close();
        }
    }
    //更新已存在管理员
    public bool UpdateAdmin(Admin admin)
    {
        try
        {
            dbConnection.Open();
            cmd = new SqlCommand("update Table_Admin set password='"
                + admin.Password + "',productPermission='"
                + admin.ProductPermission.ToString() + "',collectionPermission='"
                + admin.CollectionPermission.ToString() + "',designerPermission='"
                + admin.DesignerPermission.ToString() + "',superPermission='"
                + admin.SuperPermission.ToString() + "' where name='"
                + admin.Name + "'", dbConnection);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception e)
        {
            Console.Write(e.ToString());
            return false;
        }
        finally
        {
            dbConnection.Close();
        }
    }
    //根据姓名获取管理员
    public Admin GetAdminByName(String name)
    {
        try
        {
            dbConnection.Open();
            cmd = new SqlCommand("Select * from Table_Admin where name ='" + name + "'", dbConnection);
            SqlDataReader result = cmd.ExecuteReader();
            while (result.Read())
            {
                Admin admin = new Admin();
                admin.Name = result.GetString(0);
                admin.Password = result.GetString(1);
                admin.ProductPermission = result.GetInt32(2);
                admin.CollectionPermission = result.GetInt32(3);
                admin.DesignerPermission = result.GetInt32(4);
                admin.SuperPermission = result.GetInt32(5);
                return admin;
            }
            return null;
        }
        catch (Exception e)
        {
            Console.Write(e.ToString());
            return null;
        }
        finally
        {
            dbConnection.Close();
        }
    }
    //获取所有管理员
    public List<Admin> GetALLAdmin()
    {
        try
        {
            dbConnection.Open();
            cmd = new SqlCommand("Select * from Table_Admin", dbConnection);
            SqlDataReader result = cmd.ExecuteReader();
            List<Admin> admins = new List<Admin>();
            while (result.Read())
            {
                Admin admin = new Admin();
                admin.Name = result.GetString(0);
                admin.Password = result.GetString(1);
                admin.ProductPermission = result.GetInt32(2);
                admin.CollectionPermission = result.GetInt32(3);
                admin.DesignerPermission = result.GetInt32(4);
                admin.SuperPermission = result.GetInt32(5);
                admins.Add(admin);
            }
            return admins;
        }
        catch (Exception e)
        {
            Console.Write(e.ToString());
            return null;
        }
        finally
        {
            dbConnection.Close();
        }
    }
}