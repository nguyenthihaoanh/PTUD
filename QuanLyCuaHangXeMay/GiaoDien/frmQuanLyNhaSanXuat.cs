﻿using QuanLyCuaHangXeMay.Controller;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyCuaHangXeMay.GiaoDien
{
    public partial class frmQuanLyNhaSanXuat : Form
    {
        private List<ListViewItem> list_NSX = new List<ListViewItem>();
        private NSX_Controller nsx_Controller = new NSX_Controller();
        public static ListViewItem lvi_nsx { get; private set; } = new ListViewItem();
        public static bool flag_ncc { get; private set; } = true;
        public frmQuanLyNhaSanXuat()
        {
            InitializeComponent();
        }
        private void frmNhaSanXuat_Load(object sender, EventArgs e)
        {
            dpNgaySX.Value = DateTime.Today;
            capNhap();
            lvNSX.Items.Clear();
            list_NSX = nsx_Controller.danhSachNSX();
            foreach (ListViewItem nsx in list_NSX)
            {
                lvNSX.Items.Add(nsx);
            }
            btLuu.Enabled = false;
            btSua.Enabled = false;
            enables_txt(false);
        }

        private void lvNSX_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lvNSX.SelectedItems.Count > 0)
            {
                lvi_nsx = lvNSX.SelectedItems[0];
                tbMaNSX.Text = lvi_nsx.SubItems[0].Text;
                tbTenNSX.Text = lvi_nsx.SubItems[1].Text;
                tbDiaChi.Text = lvi_nsx.SubItems[2].Text;
                tbEmail.Text = lvi_nsx.SubItems[3].Text;
                dpNgaySX.Text = lvi_nsx.SubItems[4].Text;
                btThem.Enabled = false;
                btSua.Enabled = true;
            }
        }
        private void enables_txt(bool active)
        {
            tbTenNSX.Enabled = tbDiaChi.Enabled = tbEmail.Enabled = dpNgaySX.Enabled = active;
        }
        public string MaPhatSinhTuDong()
        {
            int count = lvNSX.Items.Count;
            string chuoi = "";
            int stt = 0;
            if (count == 0)
            {
                stt = 1;
            }
            else stt = count + 1;
            if (stt < 10)
                chuoi = "NSX00" + stt.ToString();
            else if (stt < 100)
                chuoi = "NSX0" + stt.ToString();
            else if (stt < 1000)
                chuoi = "NSX" + stt.ToString();
            return chuoi;
        }

        private void capNhap()
        {
            lvNSX.Items.Clear();
            list_NSX = nsx_Controller.danhSachNSX();
            foreach (ListViewItem nv in list_NSX)
            {
                lvNSX.Items.Add(nv);
            }
        }

        private void btThem_Click(object sender, EventArgs e)
        {
            flag_ncc = true;
            if (!btThem.Text.Equals("Hủy Thêm"))
            {
                btThem.Text = "Hủy Thêm";
                btLuu.Enabled = true;
                enables_txt(true);
                btSua.Enabled = false;
            }
            else
            {
                btThem.Text = "Thêm";
                btLuu.Enabled = false;
                btSua.Enabled = false;
                enables_txt(false);
                NhapLai();
            }
        }

        private void btSua_Click(object sender, EventArgs e)
        {
            flag_ncc = false;
            if (!btSua.Text.Equals("Hủy Sửa"))
            {
                btSua.Text = "Hủy Sửa";
                btLuu.Enabled = true;
                enables_txt(true);
                btThem.Enabled = false;
            }
            else
            {
                btSua.Text = "Sửa";
                btLuu.Enabled = false;
                btThem.Enabled = true;
                enables_txt(false);
                NhapLai();
                lvNSX.SelectedItems.Clear();
                btSua.Enabled = false;
            }
        }

        private void btLuu_Click(object sender, EventArgs e)
        {
            if (tbTenNSX.Text != "" && tbDiaChi.Text != "" && tbEmail.Text != "")
            {
                lvi_nsx = new ListViewItem();
                lvi_nsx.Text = tbMaNSX.Text;
                lvi_nsx.SubItems.Add(tbTenNSX.Text);
                lvi_nsx.SubItems.Add(tbDiaChi.Text);
                lvi_nsx.SubItems.Add(tbEmail.Text);
                if (flag_ncc == true)
                {
                    lvi_nsx.Text = tbMaNSX.Text = MaPhatSinhTuDong();
                    nsx_Controller.themTTNSX(lvi_nsx, dpNgaySX);
                    capNhap();
                    MessageBox.Show("Thêm Thành Công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    btThem.Text = "Thêm";
                    enables_txt(false);
                    NhapLai();
                    btLuu.Enabled = false;
                }
                else
                {
                    nsx_Controller.suaTTNSX(lvi_nsx, dpNgaySX);
                    capNhap();
                    MessageBox.Show("Sửa Thành Công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    btSua.Text = "Sửa";
                    btLuu.Enabled = false;
                    btSua.Enabled = false;
                    btThem.Enabled = true;
                    NhapLai();
                    lvNSX.SelectedItems.Clear();
                    enables_txt(false);
                }
            }
            else
                MessageBox.Show("Thông Tin Không Được Để Trống", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        private void NhapLai()
        {
            tbDiaChi.Text = "";
            tbEmail.Text = "";
            tbMaNSX.Text = MaPhatSinhTuDong();
            tbTenNSX.Text = "";
            dpNgaySX.Text = "";
        }
        private void btNhapLai_Click(object sender, EventArgs e)
        {
            NhapLai();
        }

        private void btThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void tbTimTen_TextChanged(object sender, EventArgs e)
        {
            lvNSX.Items.Clear();
            list_NSX = nsx_Controller.TimKiem(tbTimTen.Text);
            foreach (ListViewItem nv in list_NSX)
            {
                lvNSX.Items.Add(nv);
            }
        }
    }
}
