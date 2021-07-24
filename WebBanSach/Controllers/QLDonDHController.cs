//using StackExchange.Redis;
//using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class QLDonDHController : Controller
    {
        DataBookDataContext data = new DataBookDataContext();
        /// <summary>

        /// </summary>
        /// <returns></returns>
        // GET: QLDonDH
        public ActionResult QLDonDH()
        {
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            return View(data.DONDATHANGs.ToList());
        }

        public ActionResult Edit(int id)
        {
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                DONDATHANG ddh = data.DONDATHANGs.SingleOrDefault(p => p.SoDH == id);
                if (ddh == null)
                {
                    HttpNotFound();
                }

                return View(ddh);
            }
        }
        //HTTP POST
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(FormCollection collection)
        {
            var id = collection["SoDH"];
            //var tinhtrangthanhtoan = collection["DaThanhToan"];
            //var tinhtranggiaohang = collection["TinhTrangGiaoHang"];
            //var ngaydat = collection["NgayDat"];
            //var ngaygiao = collection["NgayGiao"];
            //bool hinhthuctt = bool.Parse(collection["HinhThucThanhToan"]);
            //var thanhtien = collection["THANHTIEN_HOADON"];
            //var trangthai = collection["TRANGTHAI"];
            //var nguoitao = collection["CREATEBY"];
            //var ngaytao = collection["CREATEDATE"];
            //var nguoixuly = collection["MODIFILEDBY"];
            //var ngayxuly = collection["MODIFILEDDATE"];
            //var ghichu = collection["GHICHU_HOADON"];
            //TÌM SoDH trong DB
            DONDATHANG ddh = data.DONDATHANGs.SingleOrDefault(P => P.SoDH == int.Parse(id));
            if (ddh != null)
            {
                //ddh.DaThanhToan = bool.Parse(tinhtrangthanhtoan);
                //ddh.TinhTrangGiaoHang = bool.Parse(tinhtranggiaohang);
                //ddh.NgayDat = DateTime.Parse(ngaydat);
                //ddh.NgayGiao = DateTime.Parse(ngaygiao);
                //ddh.HinhThucThanhToan = hinhthuctt;
                //ddh.THANHTIEN_HOADON = double.Parse(thanhtien);
                //ddh.TRANGTHAI = trangthai;
                //ddh.CREATEBY = nguoitao;
                //ddh.CREATEDATE = DateTime.Parse(ngaytao);
                //ddh.MODIFILEDBY = nguoixuly;
                //ddh.MODIFILEDDATE = DateTime.Parse(ngayxuly);
                //ddh.GHICHU_HOADON = ghichu;

                //add ddh vào trong DB
                UpdateModel(ddh);
                data.SubmitChanges();
                return RedirectToAction("QLDonDH", "QLDonDH");
            }
            else
            {
                return HttpNotFound();
            }

        }
        //chi tiet don hang
        //get
        public ActionResult Details(int id)
        {
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                List<CHITIETDATHANG> dsdh = (from ctdh in data.CHITIETDATHANGs where ctdh.SoDH == id select ctdh).ToList();
                return View(dsdh);
            }
        }
        //xóa
        //get
        public ActionResult Delete(int id)
        {
            if (Session["username_Admin"] == null)
            {
                ViewBag.ThongBao = "Bạn cần đăng nhập trước khi sử dụng chức năng chỉnh sửa!";
                return RedirectToAction("DangNhapAdmin", "Admin");
            }
            else
            {
                DONDATHANG ddh = data.DONDATHANGs.SingleOrDefault(p => p.SoDH == id);
                return View(ddh);
            }
        }
        //post
        [HttpPost, ActionName("Delete")]
        public ActionResult ComfirmDelete(int id)
        {
            DONDATHANG ddh = data.DONDATHANGs.SingleOrDefault(p => p.SoDH == id);
            if (ddh != null)
            {
                data.DONDATHANGs.DeleteOnSubmit(ddh);
                data.SubmitChanges();
                return RedirectToAction("QLDonDH", "QLDonDH");
            }
            return HttpNotFound();
        }    
    }
}

