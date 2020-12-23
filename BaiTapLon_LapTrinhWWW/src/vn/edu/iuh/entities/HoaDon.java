package vn.edu.iuh.entities;

import java.util.Date;
import java.util.List;

public class HoaDon {
	private int maHoaDon;
	private String tinhTrang;
	private double tongTien;
	private String ho;
	private String ten;
	private String email;
	private String sdt;
	private String diaChi;
	private Date ngayHoaDon;

	private List<ChiTietHoaDon> chiTietHoaDon;

	public HoaDon() {
		super();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMaHoaDon() {
		return maHoaDon;
	}

	public void setMaHoaDon(int maHoaDon) {
		this.maHoaDon = maHoaDon;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}

	public double getTongTien() {
		return tongTien;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public Date getNgayHoaDon() {
		return ngayHoaDon;
	}

	public void setNgayHoaDon(Date ngayHoaDon) {
		this.ngayHoaDon = ngayHoaDon;
	}

	public List<ChiTietHoaDon> getChiTietHoaDon() {
		return chiTietHoaDon;
	}

	public void setChiTietHoaDon(List<ChiTietHoaDon> chiTietHoaDon) {
		this.chiTietHoaDon = chiTietHoaDon;
	}
}
