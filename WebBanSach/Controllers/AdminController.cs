using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class AdminController : Controller
    {
        DataBookDataContext data = new DataBookDataContext();
        // GET: Admin
        public ActionResult DangNhapAdmin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhapAdmin(FormCollection collection)
        {
            var USERNAME = collection["username"];
            var MATKHAU = collection["password"];
            if (ModelState.IsValid)
            {
                var model = (from m in data.TAIKHOANs
                             where m.USERNAME == USERNAME && m.MATKHAU== encryptorPass(MATKHAU) && (m.ID_LOAITK == 1||m.ID_LOAITK==2)
                             select m).Any();
                if (model)
                {
                    var loginInfo = data.TAIKHOANs.Where(x => x.USERNAME == USERNAME && x.MATKHAU == encryptorPass(MATKHAU)).FirstOrDefault();

                    Session["username_Admin"] = loginInfo.USERNAME;
                    Session["TAIKHOAN"] = loginInfo;


                    return RedirectToAction("Index", "DashBoard");
                }
                ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng");
            }

            return View();
        }



        public ActionResult Logout()
        {
            Session.Clear();
            Session["TAIKHOAN"] = null;
            return RedirectToAction("DangNhapAdmin", "Admin");
        }
        public static string encryptorPass(string originalPassword)
        {
            //Declarations
            Byte[] originalBytes;
            Byte[] encodedBytes;
            MD5 md5;

            //Instantiate MD5CryptoServiceProvider, get bytes for original password and compute hash (encoded password)
            md5 = new MD5CryptoServiceProvider();
            originalBytes = ASCIIEncoding.Default.GetBytes(originalPassword);
            encodedBytes = md5.ComputeHash(originalBytes);

            //Convert encoded bytes back to a 'readable' string
            return BitConverter.ToString(encodedBytes);
        }

        //CÁC CHỨC NĂNG QUẢN LÝ CHO TABLE SÁCH
        public ActionResult Sach(int? page)
        {
            //int pagesize = 7;
            //int pagenum = (page ?? 1);
            if (Session["TaikhoanAdmin"] == null)
                return RedirectToAction("DangNhapAdmin", "Admin");
            else
                return View(data.SACHes.ToList());
        }

    }
}