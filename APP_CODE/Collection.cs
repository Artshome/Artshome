using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///Collection 的摘要说明
/// </summary>
public class Collection
{
	public Collection()
	{
		
	}
    private String name;
    private String description;
    private String imageUrl;
    private List<Product> product;

    public List<Product> Product
    {
        get { return product; }
        set { product = value; }
    }

    public String ImageUrl
    {
        get { return imageUrl; }
        set { imageUrl = value; }
    }
    public String Description
    {
        get { return description; }
        set { description = value; }
    }
    public String Name
    {
        get { return name; }
        set { name = value; }
    }
}