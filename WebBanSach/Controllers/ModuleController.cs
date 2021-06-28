using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

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
    }
}