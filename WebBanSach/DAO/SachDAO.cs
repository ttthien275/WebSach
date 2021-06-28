using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebBanSach.Models;
namespace WebBanSach.DAO
{
    public class SachDAO
    {
        DataBookDataContext data = new DataBookDataContext();
        private SACH b;

        public SachDAO()
        {
            DataBookDataContext data = new DataBookDataContext();
        }

        public List<SACH> listSachmoi(int n)
        {
            return data.SACHes.OrderByDescending(a => a.Ngaycapnhat).Take(n).ToList();
        }
    }
}