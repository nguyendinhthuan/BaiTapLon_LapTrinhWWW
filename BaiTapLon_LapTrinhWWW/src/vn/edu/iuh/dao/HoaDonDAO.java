package vn.edu.iuh.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import vn.edu.iuh.entities.ChiTietHoaDon;
import vn.edu.iuh.entities.HoaDon;
import vn.edu.iuh.entities.SanPham;

public class HoaDonDAO {
	JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<HoaDon> getAllHoaDon() {		
		return jdbcTemplate.query("SELECT * FROM HoaDon order by ngayhoadon desc", new RowMapper<HoaDon>() {
			@Override
			public HoaDon mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				HoaDon hd = new HoaDon();
				hd.setMaHoaDon(rs.getInt(1));
				hd.setTinhTrang(rs.getString(2));
				hd.setTongTien(rs.getDouble(3));
				hd.setHo(rs.getString(4));
				hd.setTen(rs.getString(5));
				hd.setSdt(rs.getString(6));
				hd.setDiaChi(rs.getString(7));
				hd.setNgayHoaDon(rs.getDate(9));
				hd.setEmail(rs.getString(8));
				return hd;
			}
		});
	}
	
	public List<ChiTietHoaDon> getChiTietHoaDon(int mahoadon) {
		return jdbcTemplate.query("SELECT * FROM CT_HoaDon where maHoaDon = " + mahoadon, new RowMapper<ChiTietHoaDon>() {
			@Override
			public ChiTietHoaDon mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				ChiTietHoaDon cthd = new ChiTietHoaDon();
				cthd.setMaChiTietHoaDon(rs.getInt(1));
				cthd.setSoLuong(rs.getInt(2));
				cthd.setThanhTien(rs.getFloat(3));
				cthd.setMaSanPham(rs.getInt(4));
				cthd.setMaHoaDon(rs.getInt(5));
				return cthd;
			}
		});
	}
	
	public List<ChiTietHoaDon> getAllChiTietHoaDon() {
		return jdbcTemplate.query("SELECT * FROM CT_HoaDon", new RowMapper<ChiTietHoaDon>() {
			@Override
			public ChiTietHoaDon mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				ChiTietHoaDon cthd = new ChiTietHoaDon();
				cthd.setMaChiTietHoaDon(rs.getInt(1));
				cthd.setSoLuong(rs.getInt(2));
				cthd.setThanhTien(rs.getFloat(3));
				cthd.setMaSanPham(rs.getInt(4));
				cthd.setMaHoaDon(rs.getInt(5));
				return cthd;
			}
		});
	}
	
	public List<HoaDon> sortByDate(Date orderdate) {
		return jdbcTemplate.query("SELECT * FROM HoaDon WHERE ngayhoadon = '" + orderdate + "'" , new RowMapper<HoaDon>() {
			@Override
			public HoaDon mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				HoaDon hd = new HoaDon();
				hd.setMaHoaDon(rs.getInt(1));
				hd.setTinhTrang(rs.getString(2));
				hd.setTongTien(rs.getDouble(3));
				hd.setHo(rs.getString(4));
				hd.setTen(rs.getString(5));
				hd.setSdt(rs.getString(6));
				hd.setDiaChi(rs.getString(7));
				hd.setNgayHoaDon(rs.getDate(9));
				hd.setEmail(rs.getString(8));
				return hd;
			}
		});
	}
	
	public int insertHoaDon(HoaDon hoadon) {
		String sql = "insert into HoaDon(maHoaDon,tinhtrang, tongTien, hokh, tenkh, sdtkh, diachikh, email, ngayhoadon) values (" + hoadon.getMaHoaDon() + ", '"
				+ hoadon.getTinhTrang() + "', " + hoadon.getTongTien() + ", '" + hoadon.getHo() + "', '"
				+ hoadon.getTen() + "', '" + hoadon.getSdt() + "', '" + hoadon.getDiaChi() + "','" + hoadon.getEmail() + "','"
				+ hoadon.getNgayHoaDon() + "')";
		return jdbcTemplate.update(sql);
	}
	
	public int updateHoaDon(HoaDon hoadon) {
		String sql = "UPDATE HoaDon SET tinhtrang='" + hoadon.getTinhTrang() + "',tongTien=" + hoadon.getTongTien()
				+ ",ngayhoadon='" + hoadon.getNgayHoaDon() + "'" + "WHERE maHoaDon = " + hoadon.getMaHoaDon();
		return jdbcTemplate.update(sql);
	}
	
	public int updateTinhTrang(int mahd) {
		String sql = "UPDATE HoaDon SET tinhtrang='da duyet' WHERE maHoaDon = " + mahd;
		return jdbcTemplate.update(sql);
	}
	
	public int insertChiTietHoaDon(ChiTietHoaDon cthd) {
		String sql = "insert into CT_HoaDon(soLuong, thanhTien, maSanPham, maHoaDon) values ('" + cthd.getSoLuong() + "',"
				+ cthd.getThanhTien() + ", '" + cthd.getMaSanPham() + "'," + cthd.getMaHoaDon() + ")";
		return jdbcTemplate.update(sql);
	}
}
