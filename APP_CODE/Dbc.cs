using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class Dbc
{
    private DataClassesDataContext data = new DataClassesDataContext();
    //添加新的展会
    public void AddTradeShow(Table_TradeShow tradeshow)
    {
        data.Table_TradeShow.InsertOnSubmit(tradeshow);
        data.SubmitChanges();
    }
    //根据ID获取展会
    public Table_TradeShow GetTradeShowByName(string name)
    {
        var q = from s in data.Table_TradeShow
                where s.name == name
                select s;
        return q.Count() == 0 ? null : q.First();
    }
    //获取所有展会
    public List<Table_TradeShow> GetALLTradeShow()
    {
        var q = from s in data.Table_TradeShow
                select s;
        return q.ToList();
    }
    //更新展会
    public void UpdateTradeShow(Table_TradeShow tradeshow)
    {
        var q = from s in data.Table_TradeShow
                where s.name == tradeshow.name
                select s;
        foreach (Table_TradeShow c in q)
        {
            c.date = tradeshow.date;
            c.location = tradeshow.location;
            c.image = tradeshow.image;
            c.link = tradeshow.link;
        }
        data.SubmitChanges();
    }
    //删除展会
    public void DeleteTradeShow(string name)
    {
        var q = from s in data.Table_TradeShow
                where s.name == name
                select s;
        data.Table_TradeShow.DeleteAllOnSubmit(q);
        data.SubmitChanges();
    }
    //添加新的collection
    public void AddCollection(Table_Collection collection)
    {
        data.Table_Collection.InsertOnSubmit(collection);
        data.SubmitChanges();
    }

    //删除collection
    public void DeleteCollection(String name)
    {
        var q = from s in data.Table_Collection
                where s.name == name
                select s;
        data.Table_Collection.DeleteAllOnSubmit(q);
        data.SubmitChanges();
    }

    //更新已有的collection
    public void UpdateCollection(Table_Collection collection)
    {
        var q = from s in data.Table_Collection
                where s.name == collection.name
                select s;
        foreach (Table_Collection c in q)
        {
            c.designer = collection.designer;
            c.description = collection.description;
            c.imageUrl = collection.imageUrl;
        }
        data.SubmitChanges();
    }

    //读取所有collection
    public List<Table_Collection> GetALLCollection()
    {
        var q = from s in data.Table_Collection
                select s;
        return q.ToList();
    }

    //根据设计师名读取collection
    public List<Table_Collection> GetCollectionByDesignerName(String designerName)
    {
        var q = from s in data.Table_Collection
                where s.designer == designerName
                select s;
        return q.ToList();
    }

    //根据名称读取collection
    public Table_Collection GetCollectionByName(String name)
    {
        var q = from s in data.Table_Collection
                where s.name == name
                select s;
        return q.Count() == 0 ? null : q.First();
    }
    //添加新的product
    public void AddProduct (Table_Product  product)
    {
        data.Table_Product.InsertOnSubmit(product);
        data.SubmitChanges();
    }

    //删除product
    public void DeleteProduct(String code)
    {
        var q = from s in data.Table_Product
                where s.code == code
                select s;
        data.Table_Product.DeleteAllOnSubmit(q);
        data.SubmitChanges();
    }

    //更新product
    public void UpdateProduct(Table_Product product)
    {
        var q = from s in data.Table_Product
                where s.code == product.code
                select s;
        foreach (Table_Product c in q)
        {
            c.shape = product.shape;
            c.size = product.size;
            c.imageUrl = product.imageUrl;
            c.collection = product.collection;
        }
        data.SubmitChanges();
    }
    //获取所有product
    public List<Table_Product> GetAllProduct()
    {
        var q = from s in data.Table_Product
                select s;
        return q.ToList();
    }

    //根据编码读取product
    public Table_Product GetProductByCode(String code)
    {
        var q = from s in data.Table_Product
                where s.code == code
                select s;
        return q.Count() == 0 ? null : q.First();
    }

    //根据collection名读取product
    public List<Table_Product> GetProductByCollectionName(String collectionName)
    {
        var q = from s in data.Table_Product
                where s.collection == collectionName
                select s;
        return q.ToList();
    }

    //添加新设计师
    public void AddDesigner(Table_Designer designer)
    {
        data.Table_Designer.InsertOnSubmit(designer);
        data.SubmitChanges();
    }
    //删除设计师
    public void DeleteDesigner(String name)
    {
        var q = from s in data.Table_Designer
                where s.name == name
                select s;
        data.Table_Designer.DeleteAllOnSubmit(q);
        data.SubmitChanges();
    }
    //更新已存在设计师
    public void UpdateDesigner(Table_Designer designer)
    {
        var q = from s in data.Table_Designer
                where s.name == designer.name
                select s;
        foreach (Table_Designer c in q)
        {
            c.description = designer.description;
            c.imageUrl = designer.imageUrl;
        }
        data.SubmitChanges();
    }
    //根据姓名获取设计师
    public Table_Designer GetDesignerByName(String name)
    {
        var q = from s in data.Table_Designer
                where s.name == name
                select s;
        return q.Count() == 0 ? null : q.First();
    }
    //获取所有设计师
    public List<Table_Designer> GetALLDesigner()
    {
        var q = from s in data.Table_Designer
                select s;
        return q.ToList();
    }
    //添加新管理员
    public void AddAdmin(Table_Admin admin)
    {
        data.Table_Admin.InsertOnSubmit(admin);
        data.SubmitChanges();
    }
    //删除管理员
    public void DeleteAdmin(String name)
    {
        var q = from s in data.Table_Admin
                where s.name == name
                select s;
        data.Table_Admin.DeleteAllOnSubmit(q);
        data.SubmitChanges();
    }
    //更新已存在管理员
    public void UpdateAdmin(Table_Admin admin)
    {
        var q = from s in data.Table_Admin
                where s.name == admin.name
                select s;
        foreach (Table_Admin c in q)
        {
            c.password = admin.password;
            c.productPermission = admin.productPermission;
            c.collectionPermission = admin.collectionPermission;
            c.designerPermission = admin.designerPermission;
            c.superPermission = admin.superPermission;
        }
        data.SubmitChanges();
    }
    //根据姓名获取管理员
    public Table_Admin GetAdminByName(String name)
    {
        var q = from s in data.Table_Admin
                where s.name == name
                select s;
        return q.Count() == 0 ? null : q.First();
    }
    //获取所有管理员
    public List<Table_Admin> GetALLAdmin()
    {
        var q = from s in data.Table_Admin
                select s;
        return q.ToList();
    }
    //添加新的新闻
    public void AddNews(Table_News news)
    {
        data.Table_News.InsertOnSubmit(news);
        data.SubmitChanges();
    }
    //根据ID获取新闻
    public Table_News GetNewsById(int id)
    {
        var q = from s in data.Table_News
                where s.Id == id
                select s;
        return q.Count() == 0 ? null : q.First();
    }
    //获取所有新闻
    public List<Table_News> GetAllNews()
    {
        var q = from s in data.Table_News
                select s;
        return q.ToList();
    }
    //更新新闻
    public void UpdateNews(Table_News news)
    {
        var q = from s in data.Table_News
                where s.Id == news.Id
                select s;
        foreach (Table_News c in q)
        {
            c.Title = news.Title;
            c.Body = news.Body;
            c.Date = news.Date;
            
        }
        data.SubmitChanges();
    }
    //删除新闻
    public void DeleteNews(int id)
    {
        var q = from s in data.Table_News
                where s.Id == id
                select s;
        data.Table_News.DeleteAllOnSubmit(q);
        data.SubmitChanges();
    }

}