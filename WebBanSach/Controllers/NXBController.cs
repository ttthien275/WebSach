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
    public class NXBController : Controller
    {
        // GET: NXB
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SachNXB(int id, int ? page)
        {
            int pageSize = 3;
            int pageNum = (page ?? 1);
            DataBookDataContext data = new DataBookDataContext();
            var sach = data.SACHes.Where(m => m.MaNXB == id).ToList();
            NHAXUATBAN a = data.NHAXUATBANs.Single(l => l.MaNXB == id);
            ViewBag.TenNXB = a.TenNXB;
            return View(sach.ToPagedList(pageNum,pageSize));
        }
    }

}