using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class ChudeController : Controller
    {
        // GET: Chude
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult SChuDe(int id)
        {
            DataBookDataContext data = new DataBookDataContext();
            var sach = data.SACHes.Where(m => m.MaCD == id).ToList();
            return View(sach);
        }
    }
}