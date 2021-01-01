package vn.edu.iuh.entities;

import java.util.List;

public class ChiTietHoaDon {
	private int maChiTietHoaDon;
	private int soLuong;
	private int maSanPham;
	private double thanhTien;
	private int maHoaDon;

	private SanPham sanPham;

	public ChiTietHoaDon() {
		super();
	}

	public ChiTietHoaDon(int soLuong, int maSanPham, double thanhTien, int maHoaDon) {
		super();
		this.soLuong = soLuong;
		this.maSanPham = maSanPham;
		this.thanhTien = thanhTien;
		this.maHoaDon = maHoaDon;
	}

	public int getMaChiTietHoaDon() {
		return maChiTietHoaDon;
	}

	public void setMaChiTietHoaDon(int maChiTietHoaDon) {
		this.maChiTietHoaDon = maChiTietHoaDon;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getMaSanPham() {
		return maSanPham;
	}

	public void setMaSanPham(int maSanPham) {
		this.maSanPham = maSanPham;
	}

	public double getThanhTien() {
		return thanhTien;
	}

	public void setThanhTien(double thanhTien) {
		this.thanhTien = thanhTien;
	}

	public int getMaHoaDon() {
		return maHoaDon;
	}

	public void setMaHoaDon(int maHoaDon) {
		this.maHoaDon = maHoaDon;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
}
