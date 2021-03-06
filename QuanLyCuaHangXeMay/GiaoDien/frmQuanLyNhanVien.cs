﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyCuaHangXeMay.Controller;
using System.Security.Cryptography;

namespace QuanLyCuaHangXeMay
{
    public partial class frmQuanLyNhanVien : Form
    {
        private List<ListViewItem> list_NV = new List<ListViewItem>();
        private NhanVienController NVC = new NhanVienController();
        private DangNhapController DNC = new DangNhapController();
        public static ListViewItem lvi_nv { get; private set; } = new ListViewItem();
        public static bool flag_nv { get; private set; } = true;
        public frmQuanLyNhanVien()
        {
            InitializeComponent();
        }
        private void enables_txt_cb(bool active)
        {
            tbCMND.Enabled = tbDiaChi.Enabled = tbSDT.Enabled = tbTenNV.Enabled = cbGioiTinh.Enabled = cbTinhTrang.Enabled = cbChucVu.Enabled = active;
        }
        private void frmQuanLyNhanVien_Load(object sender, EventArgs e)
        {
            capNhap();
            lvNV.Items.Clear();
            list_NV = NVC.danhSachNV();
            foreach (ListViewItem nv in list_NV)
            {
                lvNV.Items.Add(nv);
            }
            btnResetPass.Visible = false;
            btLuu.Enabled = false;
            btSua.Enabled = false;
            btThemTK.Enabled = false;
            enables_txt_cb(false);
            cbGioiTinh.Items.Add("Nam");
            cbGioiTinh.Items.Add("Nữ");
            cbChucVu.Items.Add("Quản Lý");
            cbChucVu.Items.Add("Nhân Viên");
            cbTinhTrang.Items.Add("Còn Làm");
            cbTinhTrang.Items.Add("Nghỉ Làm");
        }
        private void lvNV_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lvNV.SelectedItems.Count > 0)
            {
                lvi_nv = lvNV.SelectedItems[0];
                tbMaNV.Text = lvi_nv.SubItems[0].Text;
                tbTenNV.Text = lvi_nv.SubItems[1].Text;
                tbSDT.Text = lvi_nv.SubItems[2].Text;
                cbGioiTinh.Text = lvi_nv.SubItems[3].Text;
                tbCMND.Text = lvi_nv.SubItems[4].Text;
                tbDiaChi.Text = lvi_nv.SubItems[5].Text;
                cbTinhTrang.Text = lvi_nv.SubItems[6].Text;
                cbChucVu.Text=lvNV.SelectedItems[0].SubItems[7].Text;
                tbTaiKhoan.Text = lvi_nv.SubItems[8].Text;
                btThem.Enabled = false;
                btnResetPass.Visible = true;
                btSua.Enabled = true;
                btThemTK.Enabled = true;
            }
        }
        public string MaPhatSinhTuDong()
        {
            int count = lvNV.Items.Count;
            string chuoi = "";
            int stt = 0;
            if (count == 0)
            {
                stt = 1;
            }
            else stt = count + 1;
            if (stt < 10)
                chuoi = "NV00" + stt.ToString();
            else if (stt < 100)
                chuoi = "NV0" + stt.ToString();
            else if (stt < 1000)
                chuoi = "NV" + stt.ToString();
            return chuoi;
        }
        private void capNhap()
        {
            cbChucVu.Items.Clear();
            cbGioiTinh.Items.Clear();
            cbTinhTrang.Items.Clear();
            lvNV.Items.Clear();
            list_NV = NVC.danhSachNV();
            foreach (ListViewItem nv in list_NV)
            {
                lvNV.Items.Add(nv);
            }
        }

        private void btThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btThem_Click(object sender, EventArgs e)
        {
            flag_nv = true;
            if (!btThem.Text.Equals("Hủy Thêm"))
            {
                btThem.Text = "Hủy Thêm";
                btLuu.Enabled = true;
                enables_txt_cb(true);
                btSua.Enabled = false;
                btThemTK.Enabled = false;
                btnResetPass.Visible = false;
            }
            else
            {
                btThem.Text = "Thêm";
                btLuu.Enabled = false;
                btSua.Enabled = false;
                enables_txt_cb(false);
                btThemTK.Enabled = false;
                btnResetPass.Visible = false;
                nhapLai();
            }
        }

        private void btSua_Click(object sender, EventArgs e)
        {
            flag_nv = false;
            if (!btSua.Text.Equals("Hủy Sửa"))
            {
                btSua.Text = "Hủy Sửa";
                btLuu.Enabled = true;
                enables_txt_cb(true);
                btThem.Enabled = false;
                btThemTK.Enabled = false;
                btnResetPass.Visible = false;
            }
            else
            {
                btSua.Text = "Sửa";
                btLuu.Enabled = false;
                btThem.Enabled = true;
                enables_txt_cb(false);
                lvNV.SelectedItems.Clear();
                btThemTK.Enabled = false;
                btSua.Enabled = false;
                btnResetPass.Visible = false;
                nhapLai();
            }
        }
        private void nhapLai()
        {
            tbCMND.Text = "";
            tbDiaChi.Text = "";
            tbMaNV.Text = MaPhatSinhTuDong();
            tbSDT.Text = "";
            tbTenNV.Text = "";
            cbTinhTrang.Text = "";
            cbGioiTinh.Text = "";
            cbChucVu.Text = "";
        }
        private void btNhapLai_Click(object sender, EventArgs e)
        {
            nhapLai();
        }

        private void btLuu_Click(object sender, EventArgs e)
        {
            if (tbTenNV.Text != "" && tbSDT.Text != "" && cbGioiTinh.Text != "" && tbCMND.Text != "" && tbDiaChi.Text != "" && cbTinhTrang.Text != "" && cbChucVu.Text != "")
            {
                lvi_nv = new ListViewItem();
                lvi_nv.Text = tbMaNV.Text;
                lvi_nv.SubItems.Add(tbTenNV.Text);
                lvi_nv.SubItems.Add(tbSDT.Text);
                lvi_nv.SubItems.Add(cbGioiTinh.Text);
                lvi_nv.SubItems.Add(tbCMND.Text);
                lvi_nv.SubItems.Add(tbDiaChi.Text);
                lvi_nv.SubItems.Add(cbTinhTrang.Text);
                lvi_nv.SubItems.Add(cbChucVu.Text);
                if (flag_nv == true)
                {
                    lvi_nv.Text = tbMaNV.Text = MaPhatSinhTuDong();
                    NVC.them(lvi_nv);
                    capNhap();
                    MessageBox.Show("Thêm Thành Công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    btThem.Text = "Thêm";
                    enables_txt_cb(false);
                    nhapLai();
                    btLuu.Enabled = false;
                    btnResetPass.Visible = false;
                }
                else
                {
                    NVC.suaTTNV(lvi_nv);
                    capNhap();
                    MessageBox.Show("Sửa Thành Công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    btSua.Text = "Sửa";
                    lvNV.SelectedItems.Clear();
                    btLuu.Enabled = false;
                    btSua.Enabled = false;
                    btThem.Enabled = true;
                    enables_txt_cb(false);
                    nhapLai();
                    btnResetPass.Visible = false;
                }
            }
            else MessageBox.Show("Nhập và Chọn Đầy Đủ Thông Tin", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btThemTK_Click(object sender, EventArgs e)
        {
            ListViewItem lvi_tk = new ListViewItem();
            if (tbTaiKhoan.Text != "") 
            {
                MessageBox.Show("Tài Khoản Đã Tồn Tại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);                
            }
            else
            {
                lvi_tk.Text = tbMaNV.Text;
                lvi_tk.SubItems.Add(tbTaiKhoan.Text);
                NVC.themTK(lvi_tk, "123".GetHashCode().ToString());
                MessageBox.Show("Thêm Thành Công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                capNhap();
                btnResetPass.Visible = false;
            }
        }

        private void tbTimTen_TextChanged(object sender, EventArgs e)
        {
            lvNV.Items.Clear();
            list_NV = NVC.TimKiem(tbTimTen.Text);
            foreach (ListViewItem nv in list_NV)
            {
                lvNV.Items.Add(nv);
            }
        }

        private void btnResetPass_Click(object sender, EventArgs e)
        {
            DNC.thayDoiMK(Convert.ToString(tbTaiKhoan.Text), "123".GetHashCode().ToString());
            MessageBox.Show("Reset mật khẩu thành công, mật khẩu mặc định là: 123", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}