using MoMo;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;
using WebBanSach.MoMo;

namespace WebBanSach.Controllers
{
    public class DatHangController : Controller
    {
        // GET: DatHang

        public decimal TongTien()
        {
            decimal ghTongTien = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                ghTongTien = lstGiohang.Sum(n => n.ghThanhTien);
            }
            return ghTongTien;
        }
        public ActionResult DatHang()
        {
            //kiểm tra xem có đăng nhập ko chỉ đc đặt hàng khi dăng nhập
            if (Session["USERNAME"] == null || Session["USERNAME"].ToString()=="")
            {
                TempData["dangnhap"] = "Bạn cần đăng nhập để thực hiện đặt hàng và thanh toán!";
                return RedirectToAction("DangNhap", "Login");
               
            }
            ViewBag.TongTien = TongTien();
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
            return RedirectToAction("ThongTinDonHang", "DatHang",ddh);
        }

        public ActionResult AllDonHang()
        {
            TAIKHOAN tk = (TAIKHOAN)Session["USERNAME"];
            DataBookDataContext data = new DataBookDataContext();
            var list = data.DONDATHANGs.Where(l => l.ID_TAIKHOAN == tk.ID).OrderByDescending(l=>l.NgayDat).ToList();
            return View(list);
        }

        public ActionResult ThongTinDonHang(DONDATHANG a)
        {
            return View(a);
        }

        public ActionResult ChiTietDonHang(int id)
        {
            DataBookDataContext data = new DataBookDataContext();
            List<CHITIETDATHANG> a = data.CHITIETDATHANGs.Where(l => l.SoDH == id).ToList();
            ViewBag.TongTien = a.Sum(l => l.DonGia);
            DONDATHANG b = data.DONDATHANGs.Single(l => l.SoDH == id);
            ViewBag.NgayDat = b.NgayDat;
            ViewBag.HoTen = b.TAIKHOAN.HOTEN;
            ViewBag.HinhThucTT = b.HinhThucThanhToan;
            ViewBag.TrangThaiGH = b.TinhTrangGiaoHang;
            ViewBag.TrangThaiTT = b.DaThanhToan;
            return View(a);
        }


        //-------------------------------------------------------------------------------------------------------------------//
        // MOMO
        public ActionResult ThanhToanMoMo()
        {
            List<Giohang> gh = Session["Giohang"] as List<Giohang>;
            string endpoint = ConfigurationManager.AppSettings["endpoint"].ToString();
            string partnerCode = ConfigurationManager.AppSettings["partnerCode"].ToString();
            string accessKey = ConfigurationManager.AppSettings["accessKey"].ToString();
            string secretKey = ConfigurationManager.AppSettings["secretKey"].ToString();
            string orderInfo = "Sách: ";
            for (int i = 0; i < gh.Count; i++)
            {

                if (i == 0)
                {
                    orderInfo += gh[i].ghTenSach + "(" + gh[i].ghSoLuong + ")";
                }
                else
                {
                    orderInfo += " + " + gh[i].ghTenSach + "(" + gh[i].ghSoLuong + ")";
                }
            }
            string returnUrl = ConfigurationManager.AppSettings["returnUrl"].ToString();
            string notifyUrl = ConfigurationManager.AppSettings["notifyUrl"].ToString();

            string amount = gh.Sum(n => n.ghThanhTien).ToString();
            string orderid = Guid.NewGuid().ToString();
            string requestId = Guid.NewGuid().ToString();
            string extraData = "";

            string rawHash = "partnerCode=" +
                partnerCode + "&accessKey=" +
                accessKey + "&requestId=" +
                requestId + "&amount=" +
                amount + "&orderId=" +
                orderid + "&orderInfo=" +
                orderInfo + "&returnUrl=" +
                returnUrl + "&notifyUrl=" +
                notifyUrl + "&extraData=" +
                extraData;

            MoMoSecurity crypto = new MoMoSecurity();
            string signature = crypto.signSHA256(rawHash, secretKey);
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyUrl },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }
            };
            string reponseFromMoMo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());
            JObject jmessage = JObject.Parse(reponseFromMoMo);
            return Redirect(jmessage.GetValue("payUrl").ToString());
        }

        public ActionResult ReturnUrl()
        {
            try
            {
                string param = Request.QueryString.ToString().Substring(0, Request.QueryString.ToString().IndexOf("signature"));
                param = Server.UrlDecode(param);
                MoMoSecurity crypto = new MoMoSecurity();
                string secretKey = ConfigurationManager.AppSettings["secretKey"].ToString();
                string signature = crypto.signSHA256(param, secretKey);
                if (signature != Request["signature"].ToString())
                {
                    ViewBag.message = "Thông tin Request không hợp lệ";
                    //  return View("ErrorMoMo");

                }
                if (!Request.QueryString["errorCode"].Equals("0"))
                {
                    ViewBag.message = "Thanh toán thất bại";
                    // return View("ErrorMoMo");
                }
            }
            catch (Exception)
            {

                throw;
            }
            List<Giohang> gh = Session["Giohang"] as List<Giohang>;
            DataBookDataContext data = new DataBookDataContext();
            //Them don hang
            DONDATHANG ddh = new DONDATHANG();
            TAIKHOAN tk = (TAIKHOAN)Session["USERNAME"];
            ddh.ID_TAIKHOAN = tk.ID;
            ddh.CREATEDATE = DateTime.Now;
            ddh.NgayDat = DateTime.Now;
            //var ngaygiao = ddh.NgayDat.ToString();
            //ddh.NgayGiao = DateTime.Parse(ngaygiao);
            //ViewBag.ngaygiao = DateTime.Parse(ngaygiao);
            ddh.DaThanhToan = true;
            ddh.TRANGTHAI = "";
            ddh.HinhThucThanhToan = true;
            ddh.TinhTrangGiaoHang = false;
            decimal ghTongTien = gh.Sum(n => n.ghThanhTien);
            ddh.THANHTIEN_HOADON = (double?)ghTongTien;
            data.DONDATHANGs.InsertOnSubmit(ddh);

            data.SubmitChanges();
            foreach (var item in gh)
            {
                CHITIETDATHANG ctdh = new CHITIETDATHANG();
                ctdh.SoDH = ddh.SoDH;
                ctdh.MaSach = item.ghMaSach;
                ctdh.SoLuong = item.ghSoLuong;
                ctdh.DonGia = (decimal)item.ghGiaBan;
                SACH a = data.SACHes.Single(m => m.MaSach == ctdh.MaSach);
                a.SoLuongTon -= ctdh.SoLuong;
                data.SubmitChanges();
                data.CHITIETDATHANGs.InsertOnSubmit(ctdh);
            }
            data.SubmitChanges();
            ViewBag.message = "Thanh toán thành công";
            Session["Giohang"] = new List<Giohang>();
            //return View();
            return RedirectToAction("ThongTinDonHang", "DatHang", ddh);

        }

        public ActionResult NotifyUrl()
        {
            string param = "";
            param = "partner_code=" + Request["partner_code"] +
                    "&access_key=" + Request["access_key"] +
                    "&amount=" + Request["amount"] +
                    "&oder_id=" + Request["oder_id"] +
                    "&order_info=" + Request["order_info"] +
                    "&order_type=" + Request["order_type"] +
                    "&transacsion_id=" + Request["transacsion_id"] +
                    "&message=" + Request["message"] +
                    "&reponse_time=" + Request["reponse_time"] +
                    "&status_code=" + Request["status_code"];
            param = Server.UrlDecode(param);
            MoMoSecurity crypto = new MoMoSecurity();
            string secretKey = ConfigurationManager.AppSettings["secretKey"].ToString();
            string signature = crypto.signSHA256(param, secretKey);
            if (signature != Request["signature"].ToString())
            {
                //cap nhat don hang that bai
            }
            string status_code = Request["status_code"].ToString();
            if ((status_code != "0"))
            {
                //Thất bại
            }
            else
            {
                // Thành công
            }
            return Json("", JsonRequestBehavior.AllowGet);
        }
        //-------------------------------------------------------------------------------------------------------------------//
    }
}