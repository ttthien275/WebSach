using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebBanSach.Models;

namespace WebBanSach.Models
{
    public class Giohang
    {
        DataBookDataContext data = new DataBookDataContext();
        public int ghMaSach { set; get; }

        public String ghTenSach {set; get;}

        public String ghAnhBia { set; get; }

        public decimal ghGiaBan { set; get; }

        public int ghSoLuong { set; get; }

        public decimal ghThanhTien
        {
            get { return ghGiaBan * ghSoLuong; }
        }

        public Giohang(int id)
        {
            ghMaSach = id;
            SACH sach = data.SACHes.Single(n => n.MaSach == ghMaSach);
            ghTenSach = sach.TenSach;
            ghAnhBia = sach.AnhBia;
            ghGiaBan = decimal.Parse(sach.GiaBan.ToString());
            ghSoLuong = 0;
        }
    }
}