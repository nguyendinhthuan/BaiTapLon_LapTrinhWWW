package vn.edu.iuh.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import vn.edu.iuh.entities.SanPham;

public class SanPhamDAO {
	JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<SanPham> getAllSanPham() {
		List<SanPham> listSanPham = new ArrayList<SanPham>();
		String sql = "SELECT * FROM [dbo].[SanPham]";
		listSanPham = jdbcTemplate.query(sql, new RowMapper<SanPham>() {
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sanPham = new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8));
				return sanPham;
			}
		});
		return listSanPham;
	}

	public SanPham getSanPham(int maSanPham) {
		String sql = "SELECT * FROM [dbo].[SanPham] where [maSanPham] = ?";
		SanPham sanPham = (SanPham) jdbcTemplate.queryForObject(sql, new Object[] { maSanPham },
				new RowMapper<SanPham>() {
					public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
						SanPham sanPham = new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3),
								rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8));
						return sanPham;
					}
				});
		return sanPham;
	}

	public List<SanPham> getMayIn() {
		List<SanPham> listSanPham = new ArrayList<SanPham>();
		String sql = "SELECT * FROM [dbo].[SanPham] where [loaiSanPham] = 'may in'";
		listSanPham = jdbcTemplate.query(sql, new RowMapper<SanPham>() {
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sanPham = new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8));
				return sanPham;
			}

		});
		return listSanPham;
	}

	public List<SanPham> getMayScan() {
		List<SanPham> listSanPham = new ArrayList<SanPham>();
		String sql = "select * from [dbo].[SanPham] where [loaiSanPham] = 'may scan'";
		listSanPham = jdbcTemplate.query(sql, new RowMapper<SanPham>() {
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sanPham = new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8));
				return sanPham;
			}

		});
		return listSanPham;
	}
	
	public List<SanPham> getSanPhamGiaCaoHon5Trieu() {
		List<SanPham> listSanPham = new ArrayList<SanPham>();
		String sql = "select * from [dbo].[SanPham] where [donGia] >= 5000000";
		listSanPham = jdbcTemplate.query(sql, new RowMapper<SanPham>() {
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sanPham = new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8));
				return sanPham;
			}

		});
		return listSanPham;
	}
	
	public List<SanPham> getSanPhamGiaThapHon5Trieu() {
		List<SanPham> listSanPham = new ArrayList<SanPham>();
		String sql = "select * from [dbo].[SanPham] where [donGia] < 5000000";
		listSanPham = jdbcTemplate.query(sql, new RowMapper<SanPham>() {
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sanPham = new SanPham(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8));
				return sanPham;
			}

		});
		return listSanPham;
	}

	public int save(SanPham sp) {
		String sql = "INSERT INTO SanPham(tenSanPham,donGia,urlHinhAnh,moTa,tinhTrang,soLuongTon,loaiSanPham) "
				+ "values('" + sp.getTenSanPham() + "'," + sp.getDonGia() + ",'"
				+ "themes/images/products/" + sp.getUrlHinhAnh() + "','" + sp.getMoTa() + "','false',"
				+ sp.getSoLuongTon() + ",'" + sp.getLoaiSanPham() + "')";
		return jdbcTemplate.update(sql);

	}

	public int update(SanPham sp) {
		String sql = "UPDATE SanPham SET tenSanPham='" + sp.getTenSanPham() + "',donGia=" + sp.getDonGia()
				+ ",urlHinhAnh='" + sp.getUrlHinhAnh() + "'," + "moTa='" + sp.getMoTa() + "',soLuongTon="
				+ sp.getSoLuongTon() + ",loaiSanPham='" + sp.getLoaiSanPham() + "'" + "WHERE maSanPham = " + sp.getMaSanPham() + "";
		return jdbcTemplate.update(sql);
	}

	/*
	 * public SanPham getSanPhamByMaSanPham(String masp) { String sql =
	 * "SELECT * FROM SanPham WHERE maSanPham='" + masp + "'"; return
	 * jdbcTemplate.queryForObject(sql, new
	 * BeanPropertyRowMapper<SanPham>(SanPham.class)); }
	 */
	
	public int delete(int masp) {
		String sql = "DELETE FROM SanPham WHERE maSanPham = " + masp + "" ;
		return jdbcTemplate.update(sql);
	}
}
