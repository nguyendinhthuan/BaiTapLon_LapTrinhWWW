package vn.edu.iuh.entities;

import java.util.List;

public class GioHang {
	private List<SanPham> listSanPham;
	private double tongTien;

	public GioHang(List<SanPham> listSanPham, double tongTien) {
		super();
		this.listSanPham = listSanPham;
		this.tongTien = tongTien;
	}

	public GioHang() {

	}

	public List<SanPham> getListSanPham() {
		return listSanPham;
	}

	public void setListSanPham(List<SanPham> listSanPham) {
		this.listSanPham = listSanPham;
	}

	public double getTongTien() {
		return tongTien;
	}

	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}
}
