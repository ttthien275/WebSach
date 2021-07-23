using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;
namespace WebBanSach.Controllers
{
    public class QLNhaCCController : Controller
    {
        DataBookDataContext data = new DataBookDataContext();
        // GET: QLNhaCC
        public ActionResult Index()
        {
            var dsnxb = data.NHAXUATBANs.ToList();
            return View(dsnxb);
        }
        //them
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
        public ActionResult comfirmCreate(NHAXUATBAN nxb)
        {
            data.NHAXUATBANs.InsertOnSubmit(nxb);
            data.SubmitChanges();
            return RedirectToAction("Index", "QLNhaCC");
        }
        //Xóa
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
                NHAXUATBAN nxb = data.NHAXUATBANs.SingleOrDefault(p=>p.MaNXB == id);

                return View(nxb);
            }
            
        }
        //post
        [HttpPost, ActionName("Delete")]
        public ActionResult comfirmDelete(int id)
        {
            NHAXUATBAN nxb = data.NHAXUATBANs.SingleOrDefault(p => p.MaNXB == id);
            if (nxb != null)
            {
                data.NHAXUATBANs.DeleteOnSubmit(nxb);
                data.SubmitChanges();
                return RedirectToAction("Index", "QLNhaCC");
            }
            return HttpNotFound();
            
        }  
        //cap nhat
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
                NHAXUATBAN nxb = data.NHAXUATBANs.SingleOrDefault(p => p.MaNXB == id);

                return View(nxb);
            }
        }
        //post
        [HttpPost, ActionName("Edit")]
        public ActionResult comfirmEdit(int id)
        {
            NHAXUATBAN nxb = data.NHAXUATBANs.SingleOrDefault(p => p.MaNXB == id);
            if (nxb != null)
            {
                UpdateModel(nxb);
                data.SubmitChanges();
                return RedirectToAction("Index", "QLNhaCC");
            }
            return HttpNotFound();
        }
    }
}