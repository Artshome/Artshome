using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///Designer 的摘要说明
/// </summary>
public class Designer
{
	public Designer()
	{
		
	}
    private String name;
    private String description;
    private String imageUrl;
    private List<Collection> collection;

    public String ImageUrl
    {
        get { return imageUrl; }
        set { imageUrl = value; }
    }
    public List<Collection> Collection
    {
        get { return collection; }
        set { collection = value; }
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