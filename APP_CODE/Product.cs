using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///Product 的摘要说明
/// </summary>
public class Product
{
	public Product()
	{
	}
    private String code;
    private String shape;
    private String size;
    private String imageUrl;

    public String ImageUrl
    {
        get { return imageUrl; }
        set { imageUrl = value; }
    }
    public String Size
    {
        get { return size; }
        set { size = value; }
    }
    public String Shape
    {
        get { return shape; }
        set { shape = value; }
    }
    public String Code
    {
        get { return code; }
        set { code = value; }
    }

}