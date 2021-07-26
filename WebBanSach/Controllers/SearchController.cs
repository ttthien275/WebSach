using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search
        public ActionResult Search(int? page, object sender, EventArgs e)          
        {
            String text = Request.Form["search"];
            int pageSize = 8;
            int pageNum = (page ?? 1);
            List<SACH> all_Sach = new List<SACH>();
            DataBookDataContext data = new DataBookDataContext();
            ViewBag.text = text;
            if (!String.IsNullOrEmpty(text))
            {
                //test cai nay ok r
                all_Sach = data.SACHes.Where(l => l.TenSach.Contains(text)).ToList();
                return View(all_Sach.ToPagedList(pageNum, pageSize));
            }
            return View(all_Sach);
           }
    }
}