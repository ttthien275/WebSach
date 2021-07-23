using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models;

namespace WebBanSach.Controllers
{
    public class DashBoardController : Controller
    {
        DataBookDataContext data = new DataBookDataContext();

        // GET: DashBoard
        //[Authorize]
        public ActionResult Index()
        {
            //lấy ra 5 đơn mới nhất
            ViewBag.latestOrders = data.DONDATHANGs.OrderByDescending(d => d.SoDH).Take(5).ToList();
            ViewBag.NewOrders = data.DONDATHANGs.Where(d => d.NgayDat == DateTime.Now).Count();
            ViewBag.DaThanhToan = data.DONDATHANGs.Where(d=> d.DaThanhToan == true).Count();
            ViewBag.DaGiao = data.DONDATHANGs.Where(d=>d.TinhTrangGiaoHang == true).Count();
            ViewBag.DaXuLy = data.DONDATHANGs.Where(d=>d.DaThanhToan == true && d.TinhTrangGiaoHang == true).Count();
            return View();
        }
        //public JsonResult GetSalesPerDay()
        //{
        //    DataBookDataContext db = new DataBookDataContext();
        //    var data = (from O in db.DONDATHANGs
        //                select new { date = EntityFunctions.TruncateTime(O.NgayDat), O.THANHTIEN_HOADON } into a
        //                group a by a.date into b
        //                select new
        //                {
        //                    period = b.Key,
        //                    sales = b.Sum(x => x.THANHTIEN_HOADON)
        //                });

        //    List<AreaCharts> aa = new List<AreaCharts>();
        //    foreach (var item in data)
        //    {
        //        string date = item.period.ToString().Split(new[] { (' ') }, StringSplitOptions.None)[0];
        //        aa.Add(new AreaCharts() { period = date/*,sales = item.GetValueOrDefault()*/});
        //    }
        //    return Json(aa, JsonRequestBehavior.AllowGet);
        //}

        ////Circle Graph
    //    public JsonResult GetTopProductSales()
    //    {
    //        DataBookDataContext db = new DataBookDataContext();
    //    var dataforchart = (from OD in db.CHITIETDATHANGs
    //                        join P in db.SACHes
    //                on OD.SACH equals P.MaSach
    //                        select new { P.TenSach, OD.SoLuong } into row
    //                        group row by row.Name into g
    //                        select new
    //                        {
    //                            label = g.Key,
    //                            value = g.Sum(x => x.Quantity)
    //                        })
    //    .OrderByDescending(x => x.value)
    //    .Take(3);
    //        return Json(dataforchart, JsonRequestBehavior.AllowGet);
    //}


    ////Line Grap
    //public JsonResult GetOrderPerDay()
    //{
    //    var data = from O in db.Orders
    //               select new { Odate = EntityFunctions.TruncateTime(O.OrderDate), O.OrderID } into g
    //               group g by g.Odate into col
    //               select new
    //               {
    //                   Order_Date = col.Key,
    //                   Count = col.Count(y => y.OrderID != null)
    //               };
    //    List<LineCharts> aa = new List<LineCharts>();
    //    foreach (var item in data)
    //    {
    //        string date = item.Order_Date.ToString().Split(new[] { (' ') }, StringSplitOptions.None)[0];
    //        aa.Add(new LineCharts() { Date = date, Orders = item.Count });
    //    }
    //    return Json(aa, JsonRequestBehavior.AllowGet);
    //}

    ////Bar Grap
    //public JsonResult GetSalesPerCountry()
    //{
    //    var dataforBarchart = (from O in db.Orders
    //                           join C in db.Customers
    //                           on O.CustomerID equals C.CustomerID
    //                           select new { C.Country, O.TotalAmount } into row
    //                           group row by row.Country into g
    //                           select new
    //                           {
    //                               Country = g.Key,
    //                               Sales_Amount = g.Sum(x => x.TotalAmount)
    //                           })
    //                      .OrderByDescending(x => x.Sales_Amount)
    //                      .Take(6);
    //    return Json(dataforBarchart, JsonRequestBehavior.AllowGet);
    //}

}
}