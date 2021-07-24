using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class QLTaikhoanKHController : Controller
    {
        DataBookDataContext data = new DataBookDataContext();
        // GET: QLTaikhoanKH
        public ActionResult Index()
        {
            var listKh = data.TAIKHOANs.Where(p => p.ID_LOAITK == 2 || p.ID_LOAITK == 3).ToList();
            return View(listKh);
        }

        public ActionResult Create()
        {
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            return View();
        }
        //post
        [HttpPost, ActionName("Create")]
        public ActionResult comfirmCreate(TAIKHOAN tk)
        {
            data.TAIKHOANs.InsertOnSubmit(tk);
            data.SubmitChanges();
            return RedirectToAction("Index", "QLTaikhoanKH");
        }

        public ActionResult Delete(int id)
        {
            //kiem tra dang nhap
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                TAIKHOAN tk = data.TAIKHOANs.SingleOrDefault(p => p.ID == id);

                return View(tk);
            }

        }
        //post
        [HttpPost, ActionName("Delete")]
        public ActionResult comfirmDelete(int id)
        {
            TAIKHOAN tk = data.TAIKHOANs.SingleOrDefault(p => p.ID == id);
            if (tk != null)
            {
                var dem = data.DONDATHANGs.Count(p => p.ID_TAIKHOAN == id);
                for (int i = 0; i < dem; i++)
                {
                    DONDATHANG ddh = data.DONDATHANGs.FirstOrDefault(p => p.ID_TAIKHOAN == id);
                    data.DONDATHANGs.DeleteOnSubmit(ddh);
                    data.SubmitChanges();
                }
                var dem2 = data.RATINGs.Count(p => p.IDUser == id);
                for (int i = 0; i < dem2; i++)
                {
                    RATING rat = data.RATINGs.FirstOrDefault(p => p.IDUser == id);
                    data.RATINGs.DeleteOnSubmit(rat);
                    data.SubmitChanges();
                }
                data.TAIKHOANs.DeleteOnSubmit(tk);
                
                //var listĐH=data.DONDATHANGs.Where(p => p.ID_TAIKHOAN == id).ToList();
                //foreach(var item in listĐH) {
                //    DONDATHANG dh=data.DONDATHANGs.SingleOrDefault(p=>p.ID_TAIKHOAN==id)
                //    data.DONDATHANGs.DeleteAllOnSubmit(dh);
                //}
                data.SubmitChanges();
                return RedirectToAction("Index", "QLTaikhoanKH");
            }
            return HttpNotFound();

        }

        public ActionResult Edit(int id)
        {
            //kiem tra dang nhap
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                TAIKHOAN tk = data.TAIKHOANs.SingleOrDefault(p => p.ID == id);
                
                return View(tk);
            }
        }
        //post
        [HttpPost, ActionName("Edit")]
        public ActionResult comfirmEdit(int id)
        {
            TAIKHOAN tk = data.TAIKHOANs.SingleOrDefault(p => p.ID == id);
            if (tk != null)
            {
                UpdateModel(tk);
                data.SubmitChanges();
                return RedirectToAction("Index", "QLNhaCC");
            }
            return HttpNotFound();
        }

        public ActionResult Details(int id)
        {
            //kiem tra dang nhap
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                TAIKHOAN tk = data.TAIKHOANs.SingleOrDefault(p => p.ID == id);

                return View(tk);
            }

        }
    }
}