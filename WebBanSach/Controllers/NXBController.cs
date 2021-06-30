using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class NXBController : Controller
    {
        // GET: NXB
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SachNXB(int id)
        {
            DataBookDataContext data = new DataBookDataContext();
            var sach = data.SACHes.Where(m => m.MaNXB == id).ToList();
            return View(sach);
        }
    }

}