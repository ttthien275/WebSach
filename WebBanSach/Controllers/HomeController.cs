using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;
using WebBanSach.DAO;

namespace WebBanSach.Controllers
{
    public class HomeController : Controller
    {
        DataBookDataContext data = new DataBookDataContext();
        public ActionResult Index()
        {
            SachDAO sachDAO = new SachDAO();
            var all = sachDAO.listSachmoi(8);
            return View(all);
        }


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Details(int id)
        {
            var sach = from s in data.SACHes
                       where s.MaSach == id
                       select s; 
            return View(sach.Single()); 
        }

    
    }
}