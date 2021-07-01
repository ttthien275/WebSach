﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class LoginController : Controller
    {
        DataBookDataContext data = new DataBookDataContext();
        [HttpGet]
        public ActionResult DangKi()
        {

            return View();
        }
        //post: nhận data từ form đăng kí và lưu data xuống DB
        [HttpPost]
        public ActionResult DangKi(FormCollection collection)
        {
            TAIKHOAN tk = new TAIKHOAN();
            DataBookDataContext data = new DataBookDataContext();
            //gán giá trị từ các ô đến các biến
            var hoten = collection["HOTEN"];
            var username = collection["USERNAME"];
            var matkhau = collection["MATKHAU"];
            var matkhaunhaplai = collection["MATKHAUNHAPLAI"];
            var diachi = collection["DIACHI_TK"];
            var email_tk = collection["EMAIL_TK"];
            var sdt = collection["SDT"];

            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["error-1"] = "Vui lòng điền đầy đủ họ và tên!";
            }
            else if (String.IsNullOrEmpty(username))
            {
                ViewData["error-2"] = "Vui lòng không bỏ trống tên đăng nhập!";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["error-3"] = "Vui lòng nhập mật khẩu!";
            }
            else if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["error-4"] = "Vui lòng nhập lại mật khẩu!";
            }
            else if (String.IsNullOrEmpty(diachi))
            {
                ViewData["error-5"] = "Vui lòng điền đủ thông tin địa chỉ!";
            }
            else if (String.IsNullOrEmpty(email_tk))
            {
                ViewData["error-6"] = "Vui lòng nhập email!";
            }
            else if (String.IsNullOrEmpty(sdt))
            {
                ViewData["error-7"] = "Vui lòng nhập số điện thoại!";
            }
            else
            {
                //gan gia tri ve doi tuong de luu vao database
                tk.HOTEN = hoten;
                tk.ID_LOAITK = 3;
                tk.USERNAME = username;
                tk.MATKHAU = matkhau;
                tk.DIACHI_TK = diachi;
                tk.SDT = sdt;
                tk.EMAIL_TK = email_tk;
                //data.TAIKHOANs.InsertOnSubmit(tk);
                data.TAIKHOANs.InsertOnSubmit(tk);
                data.SubmitChanges();
            }
            return this.DangKi();
        }
        // GET: Login

        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            var Username = collection["username"];
            var Password = collection["password"];
            if (String.IsNullOrEmpty(Username))
            {
                ViewData["error-1"] = "Vui lòng điền đầy đủ  tên!";
            }
            else if (String.IsNullOrEmpty(Password))
                {
                    ViewData["error-2"] = "Vui lòng không bỏ trống mật khẩu !";
                }
                else
                {
                TAIKHOAN tk = data.TAIKHOANs.SingleOrDefault(n => n.USERNAME == Username && n.MATKHAU == Password);
                if (tk != null)
                {

                    ViewBag.Thongbao = "chúc mừng đăng nhập thành công";
                    Session["USERNAME"] = tk;
                    return RedirectToAction("Index", "Home");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";


                }
            return View();
        }


        public ActionResult Index()
        {
            return View();
        }
    }
}