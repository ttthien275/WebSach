using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;
using WebBanSach.DAO;

namespace WebBanSach.Controllers
{
    public class ModuleController : Controller
    {
        // GET: Module
        public ActionResult MenuChuDe()
        {
            DataBookDataContext data = new DataBookDataContext();
            var listChude = from tt in data.CHUDEs select tt;
           // var listNXB = from tt in data.NHAXUATBANs select tt;
            return PartialView(listChude);
        }
        public ActionResult MenuNXB()
        {
            DataBookDataContext data = new DataBookDataContext();
            var listNXB = from tt in data.NHAXUATBANs select tt;
            // var listNXB = from tt in data.NHAXUATBANs select tt;
            return PartialView(listNXB);
        }

        public ActionResult All_Sach()
        {
            DataBookDataContext data = new DataBookDataContext();
            SachDAO a = new SachDAO();
            // var all_Sach = a.listSachmoi(3);
            var all_Sach = data.SACHes.ToList();
           // var first = all_Sach.Skip(3).Take(3).ToList();
            return View(all_Sach);
        }

        public ActionResult FilterChuDe()
        {
            DataBookDataContext data = new DataBookDataContext();
            var chude = data.CHUDEs.ToList();
            return PartialView(chude);
        }
        public ActionResult FilterNXB()
        {
            DataBookDataContext data = new DataBookDataContext();
            var nxb = data.NHAXUATBANs.ToList();
            return PartialView(nxb);
        }
        public ActionResult FilterGia()
        {
            return PartialView();
        }
        public ActionResult TopChuDe()
        {
            DataBookDataContext data = new DataBookDataContext();
            var chude = data.CHUDEs.Take(6).ToList();
            return PartialView(chude);
        }
    }
}