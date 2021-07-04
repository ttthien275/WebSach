using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class GioHangController : Controller
    {
        DataBookDataContext data = new DataBookDataContext();
        // GET: GioHang
        public List<Giohang> Laygiohang()
        {
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<Giohang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }

        public ActionResult Themgiohang(int id, int sl,string strUrl)
        {
            List<Giohang> lstGiohang = Laygiohang();

            Giohang sanpham = lstGiohang.Find(n => n.ghMaSach == id);
            if (sanpham == null)
            {
                sanpham = new Giohang(id);
                sanpham.ghSoLuong = sl;
                lstGiohang.Add(sanpham);
                return Redirect(strUrl);
            }
            else
            {
                sanpham.ghSoLuong+=sl;
                return Redirect(strUrl);
            }
        }

        public ActionResult RemoveInCart(int id, string strUrl)
        {
            List<Giohang> lstGiohang = Laygiohang();

            Giohang sanpham = lstGiohang.Find(n => n.ghMaSach == id);
            if (sanpham != null)
            {
                
                lstGiohang.Remove(sanpham);
            }
            return Redirect(strUrl);
        }

        public ActionResult UpdateCart(int id, FormCollection f)
        {
            List<Giohang> lstGiohang = Laygiohang();

            Giohang sanpham = lstGiohang.SingleOrDefault(m => m.ghMaSach == id);
            if (sanpham != null)
            {

                sanpham.ghSoLuong = int.Parse(f["txtSoluong"].ToString());
                //lstGiohang = Laygiohang();

            }
            return RedirectToAction("Giohang");
        }

        public ActionResult UpdateCartIndex(int id, FormCollection f, string strUrl)
        {
            List<Giohang> lstGiohang = Laygiohang();

            Giohang sanpham = lstGiohang.SingleOrDefault(m => m.ghMaSach == id);
            if (sanpham != null)
            {

                sanpham.ghSoLuong = sanpham.ghSoLuong + int.Parse(f["txtSoluong"].ToString());
                //lstGiohang = Laygiohang();

            }
            else
            {
                sanpham = new Giohang(id);
                sanpham.ghSoLuong = int.Parse(f["txtSoluong"].ToString());
                lstGiohang.Add(sanpham); 
            }
            return Redirect(strUrl);
        }


        private int TongSoLuong()
        {
            int ghTongSOLuong = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                ghTongSOLuong = lstGiohang.Sum(n => n.ghSoLuong);
            }
            return ghTongSOLuong;
        }

        private decimal TongTien()
        {
            decimal ghTongTien = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                ghTongTien = lstGiohang.Sum(n => n.ghThanhTien);
            }
            return ghTongTien;
        }

        public ActionResult Giohang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGiohang);
        }

        public ActionResult GiohangPartial()
        {
            List<Giohang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                ViewBag.TongSoLuong = TongSoLuong();
                ViewBag.TongTien = TongTien();
                ViewBag.Thongbao = "Không có sản phẩm nào trong giỏ hàng";
            }
            else
            {
                ViewBag.Thongbao = "";
                ViewBag.TongSoLuong = TongSoLuong();
                ViewBag.TongTien = TongTien();
            }
            
            return PartialView(lstGiohang);

        }
    }
}