using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class BookStoreController : Controller
    {
        DataBookDataContext data = new DataBookDataContext();
        // GET: BookStore
        public ActionResult Index()
        {
            
            var all = from tt in data.SACHes select tt;
            return View(all);
        }

        public ActionResult ChuDe()
        {
            var chude = from tt in data.CHUDEs select tt;
            return PartialView(chude);
        }
        public ActionResult Nhaxuatban()
        {
            var nhaxuatban = from tt in data.NHAXUATBANs select tt;
            return PartialView(nhaxuatban);
        }
    }
}