﻿using QuanLyCuaHangXeMay.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyCuaHangXeMay.Controller
{
    public class NSX_Controller
    {
        private dbQLMuaBanXeDataContext db = new dbQLMuaBanXeDataContext();
        private List<ListViewItem> dsNSX = new List<ListViewItem>();
        private ListViewItem lvit;
        // Thêm thông tin 1 nsx vào listviewitem
        public ListViewItem them_nsx_lv(NhaSanXuat nhaSanXuat)
        {
            lvit = new ListViewItem();
            lvit.Text = nhaSanXuat.maNSX.ToString();
            lvit.SubItems.Add(nhaSanXuat.tenNSX);
            lvit.SubItems.Add(nhaSanXuat.nuocSX);
            lvit.SubItems.Add(nhaSanXuat.email);
            lvit.SubItems.Add(nhaSanXuat.namSX.ToShortDateString());
            return lvit;
        }
        //Lay danh sach tat ca nhan vien
        public List<ListViewItem> danhSachNSX()
        {
            dsNSX.Clear();
            var nsx = from NSX in db.NhaSanXuats
                      select NSX;
            foreach (NhaSanXuat n in nsx)
                dsNSX.Add(them_nsx_lv(n));
            return dsNSX;
        }
        //them ncc vao database
        public void themTTNSX(ListViewItem lvi_nsx, DateTimePicker ngaySX)
        {
            NhaSanXuat n = new NhaSanXuat();
            n.maNSX = lvi_nsx.Text.ToString();
            n.tenNSX = lvi_nsx.SubItems[1].Text;
            n.nuocSX = lvi_nsx.SubItems[2].Text;
            n.email = lvi_nsx.SubItems[3].Text;
            n.namSX = Convert.ToDateTime(ngaySX.Value.ToShortDateString());
            db.NhaSanXuats.InsertOnSubmit(n);
            db.SubmitChanges();
        }
        public void suaTTNSX(ListViewItem lvi_nsx, DateTimePicker ngaySX)
        {
            var nsx = from NSX in db.NhaSanXuats
                      where NSX.maNSX == lvi_nsx.Text
                      select NSX;
            foreach (NhaSanXuat n in nsx)
            {
                n.tenNSX = lvi_nsx.SubItems[1].Text;
                n.nuocSX = lvi_nsx.SubItems[2].Text;
                n.email = lvi_nsx.SubItems[3].Text;
                n.namSX = Convert.ToDateTime(ngaySX.Value.ToShortDateString());
            }
            db.SubmitChanges();
        }
        public List<ListViewItem> TimKiem(string ten)
        {
            dsNSX.Clear();
            var nsx = from NSX in db.NhaSanXuats
                      select NSX;
            foreach (NhaSanXuat nhaSanXuat in nsx)
            {
                string t = nhaSanXuat.tenNSX.ToLower();
                if (t.Contains(ten.ToLower()))
                {
                    lvit = new ListViewItem();
                    lvit.Text = nhaSanXuat.maNSX.ToString();
                    lvit.SubItems.Add(nhaSanXuat.tenNSX);
                    lvit.SubItems.Add(nhaSanXuat.nuocSX);
                    lvit.SubItems.Add(nhaSanXuat.email);
                    lvit.SubItems.Add(nhaSanXuat.namSX.ToShortDateString());
                    dsNSX.Add(lvit);
                }
            }
            return dsNSX;
        }
    }
}
