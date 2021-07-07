using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

using PagedList;
using PagedList.Mvc;
namespace WebBanSach.Controllers
{
    public class ChudeController : Controller
    {
        // GET: Chude
        public ActionResult Index()
        {
            return View();
        }

        //public ActionResult SChuDe(int id)
        //{
            
        //    DataBookDataContext data = new DataBookDataContext();
        //    var sach = data.SACHes.Where(m => m.MaCD == id).ToList();
          
        //    return View(sach);
        //}
        public ActionResult SChuDe(int id, int? page)
        {
            int pageSize = 3;
            int pageNum = (page ?? 1);
            DataBookDataContext data = new DataBookDataContext();
            var sach = data.SACHes.Where(m => m.MaCD == id).ToList();
            Session["Chude"] = id;
            return View(sach.ToPagedList(pageNum, pageSize));
        }
    }
}