using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;
using PayPal.Api;
using PayPal;
using Paymnet=PayPal.Api.Payment;


namespace WebBanSach.Controllers
{
    public class GioHangController : Controller
    {

        //private readonly static string _clientId = "AffvaipnP0ZfQuG9Y-i6RpFK_GyJbaYF5SkUBfQiJ6wBPJ_vIDTDect1llKNlB8ELniMHnasL114ScF4";
        //private readonly static string _clientSecret = "ECn-7KODZlkt4Ku45JmXsBAWDf5mAezoE_xaczp8vz8_iUZfOWh3cSxEqrFPreECCsbw30vQyQ4-n7aH";
        //private readonly static string _clientId;
        //private readonly static string _clientSecret;
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

        public ActionResult Themgiohang(int id, int sl, string strUrl)
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
                sanpham.ghSoLuong += sl;
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


        public int TongSoLuong()
        {
            int ghTongSOLuong = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                ghTongSOLuong = lstGiohang.Sum(n => n.ghSoLuong);
            }
            return ghTongSOLuong;
        }

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


        private Payment payment;
        private Payment CreatePayment(APIContext apiContext, string redirectUrl, List<Giohang> lstGiohang)
        {
            var listItems = new ItemList()
            {
                items = new List<Item>()
            };
            decimal menhgia = 22000;
            var tongtien = TongTien();
            foreach (var cart in lstGiohang)
            {
                {
                    listItems.items.Add(new Item()
                    {
                        name = cart.ghTenSach,
                        currency = "USD",
                        price = (cart.ghGiaBan/ menhgia).ToString("#.##"),
                        quantity = cart.ghSoLuong.ToString(),
                        sku = "sku"
                    });
                }
            }
           
            var payer = new Payer() { payment_method = "paypal" };

            var redirUrl = new RedirectUrls()
            {
                cancel_url = redirectUrl,
                return_url = redirectUrl
            };

            var details = new Details()
            {
                tax = "0",
                shipping = "0",
                subtotal = (tongtien/ menhgia).ToString("#.##")
            };

            var amount = new Amount()
            {
                currency = "USD",
                total = (Convert.ToDouble(details.tax) + Convert.ToDouble(details.shipping) + Convert.ToDouble(details.subtotal)).ToString(),
                details = details
            };

            var transactionList = new List<Transaction>();
            transactionList.Add(new Transaction()
            {
                description = "1",
                invoice_number = Convert.ToString((new Random()).Next(100000)),
                amount = amount,
                
                item_list = listItems
            });

            payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrl
            };
            //try
            //{
            //    payment.Create(apiContext);
            //}
            //catch(PayPal.PaymentsException ex)
            //{
            //    PaypalLogger.Log("Error: " + ex.Response);
            //}
            return payment.Create(apiContext);
        }


        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId,
            };
            payment = new Payment() { id = paymentId };
            return payment.Execute(apiContext, paymentExecution);
        }


        public ActionResult PaymentWithPaypal(FormCollection collection)
        {
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            APIContext apiContext = PaypalConfiguration.GetAPIContext();
            try
            {
                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/GioHang/PaymentWithPaypal?";
                    var guid = Convert.ToString((new Random()).Next(100000));
                    var createPayment = CreatePayment(apiContext, baseURI + "guid=" + guid,lstGiohang);
                    var links = createPayment.links.GetEnumerator();
                    string paypalRedirectUrl = string.Empty;

                while (links.MoveNext())
                {
                    Links link = links.Current;
                    if (link.rel.ToLower().Trim().Equals("approval_url"))
                    {
                        paypalRedirectUrl = link.href;
                    }
                }
                Session.Add(guid, createPayment.id);
                return Redirect(paypalRedirectUrl);
            }
            else
            {
                var guid = Request.Params["guid"];
                var executePayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                if (executePayment.state.ToLower() != "approved")
                {
                    return View("Failure");
                }
            }
            }
            catch (Exception ex)
            {
                PaypalLogger.Log("Error: " + ex.Message);
                return View("Failure");
            }

            DataBookDataContext data = new DataBookDataContext();
            //Them don hang
            DONDATHANG ddh = new DONDATHANG();
            TAIKHOAN tk = (TAIKHOAN)Session["USERNAME"];
            List<Giohang> gh = Session["Giohang"] as List<Giohang>;

            ddh.ID_TAIKHOAN = tk.ID;
            ddh.CREATEDATE = DateTime.Now;
            ddh.NgayDat = DateTime.Now;
            //var ngaygiao = String.Format("{0:dd/MM/yyyy}", collection["ngaygiao"]);
            //ddh.NgayGiao = DateTime.Parse(ngaygiao);
            //ViewBag.ngaygiao = DateTime.Parse(ngaygiao);
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
            //return View("Success");
        }
    }

}



