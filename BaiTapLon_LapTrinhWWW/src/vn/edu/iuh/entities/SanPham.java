package vn.edu.iuh.entities;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class SanPham {
	private Integer maSanPham;
	private String tenSanPham;
	private double donGia;
	
	@NotEmpty(message = "Vui lòng chọn hình ảnh")
	private String urlHinhAnh;
	private String moTa;
	private String tinhTrang;
	private int soLuongTon;
	private String loaiSanPham;

	public SanPham() {
		super();
	}

	public SanPham(Integer maSanPham, String tenSanPham, double donGia, String urlHinhAnh, String moTa, String tinhTrang,
			int soLuongTon, String loaiSanPham) {
		super();
		this.maSanPham = maSanPham;
		this.tenSanPham = tenSanPham;
		this.donGia = donGia;
		this.urlHinhAnh = urlHinhAnh;
		this.moTa = moTa;
		this.tinhTrang = tinhTrang;
		this.soLuongTon = soLuongTon;
		this.loaiSanPham = loaiSanPham;
	}

	public Integer getMaSanPham() {
		return maSanPham;
	}

	public void setMaSanPham(Integer maSanPham) {
		this.maSanPham = maSanPham;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public double getDonGia() {
		return donGia;
	}

	public void setDonGia(double donGia) {
		this.donGia = donGia;
	}

	public String getUrlHinhAnh() {
		return urlHinhAnh;
	}

	public void setUrlHinhAnh(String urlHinhAnh) {
		this.urlHinhAnh = urlHinhAnh;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public int getSoLuongTon() {
		return soLuongTon;
	}

	public void setSoLuongTon(int soLuongTon) {
		this.soLuongTon = soLuongTon;
	}

	public String getLoaiSanPham() {
		return loaiSanPham;
	}

	public void setLoaiSanPham(String loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}

	@Override
	public String toString() {
		return "SanPham [maSanPham=" + maSanPham + ", tenSanPham=" + tenSanPham + ", donGia=" + donGia + ", urlHinhAnh="
				+ urlHinhAnh + ", moTa=" + moTa + ", tinhTrang=" + tinhTrang + ", soLuongTon=" + soLuongTon
				+ ", loaiSanPham=" + loaiSanPham + "]";
	}
}
