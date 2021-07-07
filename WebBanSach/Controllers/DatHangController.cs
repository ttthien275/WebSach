using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class DatHangController : Controller
    {
        // GET: DatHang
        public ActionResult DatHang()
        {
            //kiểm tra xem có đăng nhập ko chỉ đc đặt hàng khi dăng nhập
            if (Session["USERNAME"] == null || Session["USERNAME"].ToString()=="")
            {
                TempData["dangnhap"] = "Bạn cần đăng nhập để thực hiện đặt hàng và thanh toán!";
                return RedirectToAction("DangNhap", "Login");
               
            }

            if (Session["Giohang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            
            return View();
        }
        [HttpPost]
        public ActionResult DatHang(FormCollection collection)
        {
            DataBookDataContext data = new DataBookDataContext();
            //Them don hang
            DONDATHANG ddh = new DONDATHANG();
            TAIKHOAN tk = (TAIKHOAN)Session["USERNAME"];
            List<Giohang> gh = Session["Giohang"] as List<Giohang>;

            ddh.ID_TAIKHOAN = tk.ID;
            ddh.CREATEDATE = DateTime.Now;
            ddh.NgayDat = DateTime.Now;
            var ngaygiao = String.Format("{0:dd/MM/yyyy}", collection["ngaygiao"]);
            ddh.NgayGiao = DateTime.Parse(ngaygiao);
            ViewBag.ngaygiao = DateTime.Parse(ngaygiao);
            ddh.DaThanhToan = true;
            ddh.TRANGTHAI = "Đang giao";
            ddh.TinhTrangGiaoHang = false;
            decimal ghTongTien = gh.Sum(n => n.ghThanhTien);
            ddh.THANHTIEN_HOADON = (double?)ghTongTien;
            data.DONDATHANGs.InsertOnSubmit(ddh);
            data.SubmitChanges();
            //Them chi tiết đơn đặt sách
            foreach (var item in gh)
            {
                CHITIETDATHANG ctdh = new CHITIETDATHANG();
                ctdh.SoDH = ddh.SoDH;
                ctdh.MaSach = item.ghMaSach;
                ctdh.SoLuong = item.ghSoLuong;
                ctdh.DonGia = (decimal)item.ghGiaBan;
                data.CHITIETDATHANGs.InsertOnSubmit(ctdh);
            }
            data.SubmitChanges();
            Session["Giohang"] = null;
            //cái trnag đặt hàng tên gì z, view đặt hàng
            //này là m đã đăng nhập r đúng k ừ này là cc á đạt hn thanh cong
            return RedirectToAction("TheoDoiTinhTrangDH", "DatHang");
        }
        public ActionResult TheoDoiTinhTrangDH()
        {
            return View();
        }
    }
}