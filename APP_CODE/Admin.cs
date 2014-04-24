using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///Admin 的摘要说明
/// </summary>
public class Admin
{
	public Admin()
	{
	}
    private String name;
    private String password;
    private int productPermission;
    private int collectionPermission;
    private int designerPermission;
    private int superPermission;

    public int SuperPermission
    {
        get { return superPermission; }
        set { superPermission = value; }
    }
    public int DesignerPermission
    {
        get { return designerPermission; }
        set { designerPermission = value; }
    }
    public int CollectionPermission
    {
        get { return collectionPermission; }
        set { collectionPermission = value; }
    }
    public int ProductPermission
    {
        get { return productPermission; }
        set { productPermission = value; }
    }
    public String Password
    {
        get { return password; }
        set { password = value; }
    }

    public String Name
    {
        get { return name; }
        set { name = value; }
    }
}