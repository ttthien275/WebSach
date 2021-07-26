using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;
using WebBanSach.DAO;

using PagedList;
using PagedList.Mvc;

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

        public ActionResult All_Sach(int ? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);

            DataBookDataContext data = new DataBookDataContext();
            SachDAO a = new SachDAO();
            var all_Sach = data.SACHes.ToList();
            return View(all_Sach.ToPagedList(pageNum, pageSize));
        }
       


        public ActionResult SapXep(int? page, int keysx)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            DataBookDataContext data = new DataBookDataContext();
            List<SACH> lst = new List<SACH>();
            int key = keysx;
            if (key == 1)
            {
                ViewBag.SX = "Sắp xếp theo tên sách (A-Z)";
                lst = data.SACHes.OrderBy(l => l.TenSach).ToList();
                return View(lst.ToPagedList(pageNum, pageSize));
            }
            else if (key == 2)
            {
                ViewBag.SX = "Sắp xếp theo tên sách (Z-A)";
                lst = data.SACHes.OrderByDescending(l => l.TenSach).ToList();
                return View(lst.ToPagedList(pageNum, pageSize));
            }
            else if (key == 3)
            {
                ViewBag.SX = "Sắp xếp theo giá (Thấp - Cao)";
                lst = data.SACHes.OrderBy(l => l.GiaBan).ToList();
                return View(lst.ToPagedList(pageNum, pageSize));
            }
            else if (key == 4)
            {
                ViewBag.SX = "Sắp xếp theo giá (Cao - Thấp)";
                lst = data.SACHes.OrderByDescending(l => l.GiaBan).ToList();
                return View(lst.ToPagedList(pageNum, pageSize));
            }
            else if (key == 5)
            {
                ViewBag.SX = "Sắp xếp theo tên Nhà XB (A - Z)";
                lst = data.SACHes.OrderBy(l => l.NHAXUATBAN.TenNXB).ToList();
                return View(lst.ToPagedList(pageNum, pageSize));
            }
            else if (key == 6)
            {
                ViewBag.SX = "Sắp xếp theo tên Nhà XB (Z - A)";
                lst = data.SACHes.OrderByDescending(l => l.NHAXUATBAN.TenNXB).ToList();
                return View(lst.ToPagedList(pageNum, pageSize));
            }
            return View(lst.ToPagedList(pageNum, pageSize));
        }


        public ActionResult FilterChuDe(int ? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            DataBookDataContext data = new DataBookDataContext();
            var chude = data.CHUDEs.ToList();
            return PartialView(chude.ToPagedList(pageNum, pageSize));
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