using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebBanSach
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Details",
                url: "product-detail",
                defaults: new { controller = "Home", action = "Details"}
            );
            routes.MapRoute(
                name: "About",
                url: "about",
                defaults: new { controller = "Home", action = "About" }
            );
            routes.MapRoute(
                name: "Contact",
                url: "contact",
                defaults: new { controller = "Home", action = "Contact" }
            );
            routes.MapRoute(
                name: "Login",
                url: "dang-nhap",
                defaults: new { controller = "Login", action = "DangNhap" }
            );
            routes.MapRoute(
                name: "DangKi",
                url: "dang-ki",
                defaults: new { controller = "Login", action = "DangKi" }
            );
            routes.MapRoute(
                name: "Trang chủ",
                url: "trang-chu",
                defaults: new { controller = "Home", action = "Index" }
            );
            routes.MapRoute(
                name: "Sách theo chủ đề",
                url: "chu-de",
                defaults: new { controller = "Chude", action = "SChuDe" }
            );
            routes.MapRoute(
                name: "Sách theo NXB",
                url: "nha-xuat-ban",
                defaults: new { controller = "NXB", action = "SachNXB" }
            );
            routes.MapRoute(
                name: "Tất cả sách",
                url: "tat-ca-sach",
                defaults: new { controller = "Module", action = "All_Sach" }
            );
            routes.MapRoute(
                name: "Sắp xếp",
                url: "sap-xep",
                defaults: new { controller = "Module", action = "SapXep" }
            );
            routes.MapRoute(
                name: "Tìm kiếm",
                url: "tim-kiem",
                defaults: new { controller = "Search", action = "Search" }
            );
            routes.MapRoute(
                name: "Giỏ hàng",
                url: "gio-hang",
                defaults: new { controller = "GioHang", action = "GioHang" }
            );
            routes.MapRoute(
                name: "Đặt hàng",
                url: "dat-hang",
                defaults: new { controller = "DatHang", action = "DatHang" }
            );
            routes.MapRoute(
                name: "Chi tiết đơn hàng",
                url: "chi-tiet-don-hang",
                defaults: new { controller = "DatHang", action = "ChiTietDonHang" }
            );
            routes.MapRoute(
                name: "Thông báo đặt hàng thành công",
                url: "dat-hang-thanh-cong",
                defaults: new { controller = "DatHang", action = "ThongTinDonHang" }
            );
            routes.MapRoute(
                name: "Lịch sử mua hàng",
                url: "lich-su-mua-hang",
                defaults: new { controller = "DatHang", action = "AllDonHang" }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "index", id = UrlParameter.Optional }
            );
        }
    }
}
