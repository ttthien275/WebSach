using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace WebBanSach.Controllers
{
    public class QLSachController : Controller
    {
        DataBookDataContext data = new DataBookDataContext();
        // GET: QLSach
        //public ActionResult Index()
        //{
        //    return View();
        //}


        //1. Hiện thị danh muc các quyển sách
        public ActionResult Sach(int ? page)
        {
            int pagesize = 7;
            int pagenum = (page ?? 1); //if page on null then return 1 else return page
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
                 return View(data.SACHes.ToList().OrderByDescending(n => n.MaSach).ToPagedList(pagenum,pagesize));
        }

        //2. Xem CHI TIẾT SÁCH 
        public ActionResult Detail(int id)
        {
            //kiem tra dang nhap
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                var sach = from s in data.SACHes where s.MaSach == id select s;
                return View(sach.SingleOrDefault());
            }
        }
        //3. xóa 1 quyển sách
        [HttpGet]
        public ActionResult Delete(int id)
        {
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                SACH sach = data.SACHes.SingleOrDefault(n => n.MaSach == id);
                return View(sach);
            }
        }

        [HttpPost,ActionName("Delete")]
        public ActionResult ConfirmDelete(int id)
        {
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                SACH sach = data.SACHes.SingleOrDefault(n => n.MaSach == id);
                data.SACHes.DeleteOnSubmit(sach);
                data.SubmitChanges();
                return RedirectToAction("Sach", "QLSach");
            }
        }
        //4. thêm mới sách
        [HttpGet]

        public ActionResult Create()
        {
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                ViewBag.MaCD = new SelectList(data.CHUDEs.ToList().OrderBy(n => n.TenChuDe).ToList(), "MaCD", "TenChuDe");
                ViewBag.MaNXB = new SelectList(data.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB).ToList(), "MaNXB", "TenNXB");
                return View();
            }
        }

        //[HttpPost]
        //public ActionResult Create(SACH sach)
        //{
        //    if (Session["username_Admin"] == null)
        //    {
        //        ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
        //        return RedirectToAction("DangNhapAdmin", "Admin");
        //    }
        //    else
        //    {
        //        data.SACHes.InsertOnSubmit(sach);
        //        data.SubmitChanges();
        //        return RedirectToAction("Sach", "QLSach");
        //    }
        //}
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(SACH sach, HttpPostedFileBase fileupload)
        {
            //Dua du lieu vao dropdownload
            //ViewBag.MaCD = new SelectList(data.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude");
            //ViewBag.MaNXB = new SelectList(data.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                //Kiem tra duong dan file
                if (fileupload == null)
                {
                    ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                    return View();
                }
                //Them vao CSDL
                else
                {
                    if (ModelState.IsValid)
                    {
                        //Luu ten fie, luu y bo sung thu vien using System.IO;
                        var fileName = Path.GetFileName(fileupload.FileName);
                        //Luu duong dan cua file
                        var path = Path.Combine(Server.MapPath("~/images"), fileName);
                        //Kiem tra hình anh ton tai chua?
                        if (System.IO.File.Exists(path))
                            ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                        else
                        {
                            //Luu hinh anh vao duong dan
                            fileupload.SaveAs(path);
                        }
                        sach.AnhBia = fileName;
                        //Luu vao CSDL
                        data.SACHes.InsertOnSubmit(sach);
                        data.SubmitChanges();
                    }
                    return RedirectToAction("Sach");
                }
            }
        }
        //5 ĐIỀU CHỈNH THÔNG TIN 1 CUỐN SÁCH
        [HttpGet]
        public ActionResult Edit(int id)
        {
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                SACH sach = data.SACHes.SingleOrDefault(n => n.MaSach == id);
                ViewBag.MaCD = new SelectList(data.CHUDEs.OrderBy(n => n.TenChuDe).ToList(), "MaCD", "TenChuDe",sach.MaCD);
                ViewBag.MaNXB = new SelectList(data.NHAXUATBANs.OrderBy(n => n.TenNXB).ToList(), "MaNXB", "TenNXB",sach.MaNXB);
                return View(sach);
            }
        }
        
        [HttpPost, ActionName("Edit")]

        public ActionResult ConfirmEdit(int id)
        {
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                SACH sach = data.SACHes.SingleOrDefault(n => n.MaSach == id);
                UpdateModel(sach);
                data.SubmitChanges();
                return RedirectToAction("Sach", "QLSach");
            }
        }

    }  
}