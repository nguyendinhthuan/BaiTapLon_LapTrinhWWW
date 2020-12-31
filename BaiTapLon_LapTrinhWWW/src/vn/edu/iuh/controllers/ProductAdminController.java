package vn.edu.iuh.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.i18n.AcceptHeaderLocaleContextResolver;
import org.springframework.web.servlet.ModelAndView;

import vn.edu.iuh.dao.HoaDonDAO;
import vn.edu.iuh.dao.SanPhamDAO;
import vn.edu.iuh.entities.ChiTietHoaDon;
import vn.edu.iuh.entities.GioHangSession;
import vn.edu.iuh.entities.HoaDon;
import vn.edu.iuh.entities.LoaiSanPham;
import vn.edu.iuh.entities.SanPham;

@Controller
public class ProductAdminController {
	@Autowired
	private SanPhamDAO sanPhamDAO;

	@Autowired
	private HoaDonDAO hoaDonDAO;

	// sap xep danh sach san pham theo may in
	@RequestMapping(value = "/admin/orderbymayin")
	public ModelAndView viewOrderbyMayin() {
		List<SanPham> list = sanPhamDAO.getMayIn();
		return new ModelAndView("product_admin", "listpros", list);
	}

	// sap xep danh sach san pham theo may scan
	@RequestMapping(value = "/admin/orderbymayscan")
	public ModelAndView viewOrderbyMayscan() {
		List<SanPham> list = sanPhamDAO.getMayScan();
		return new ModelAndView("product_admin", "listpros", list);
	}

	@RequestMapping(value = "/admin/showformedit/{maSanPham}")
	public ModelAndView viewEditProduct(@PathVariable String maSanPham) {
		SanPham sp = sanPhamDAO.getSanPham(maSanPham);
		return new ModelAndView("edit_product", "command", sp);
	}

	@RequestMapping(value = "/admin/showforminsert")
	public ModelAndView viewAddProduct() {
		return new ModelAndView("insert_product", "command", new SanPham());
	}

	@RequestMapping(value = "/admin/add", method = RequestMethod.POST)
	public ModelAndView addProduct(@Validated @ModelAttribute("sanpham") SanPham sanpham, BindingResult errors) {
		System.out.println("Dang them san pham :" + sanpham.toString());
		if (errors.hasErrors()) {
			return new ModelAndView("insert_product", "message", "Vui lòng nhập các thông tin sau đây");
		}
		sanPhamDAO.save(sanpham);
		return new ModelAndView("redirect:/admin");
	}

	@RequestMapping(value = "/admin/showformedit/editproduct", method = RequestMethod.POST)
	public ModelAndView updateProduct(@Validated @ModelAttribute("sanpham") SanPham sanpham, BindingResult errors) {
		if(errors.hasErrors()) {
			return viewEditProduct(sanpham.getMaSanPham());
		}
		System.out.println("Dang cap nhat san pham (id: " + sanpham.getMaSanPham() + ") ...");
		sanPhamDAO.update(sanpham);
		return new ModelAndView("redirect:/admin");
	}

	@RequestMapping(value = "/admin/delete/{maSanPham}", method = RequestMethod.GET)
	public ModelAndView deleteProduct(@PathVariable String maSanPham, ModelMap mm) {
		List<ChiTietHoaDon> list = hoaDonDAO.getAllChiTietHoaDon();
		String key = "fail";
		for(ChiTietHoaDon ct : list) {
			if(ct.getMaSanPham().equals(maSanPham) == true) {
				//System.out.println("Sản phẩm đang được đặt hàng");
				key = "work";
			}	
		}
		if(key == "fail") {
			sanPhamDAO.delete(maSanPham);
		}
		mm.addAttribute("message", key);
		return new ModelAndView("redirect:/admin");
	}

	@RequestMapping(value = "/admin/quanlyhoadon")
	public ModelAndView viewQLHD() {
		List<HoaDon> list = hoaDonDAO.getAllHoaDon();
		for (HoaDon hoaDon : list) {
			hoaDon.setChiTietHoaDon(hoaDonDAO.getChiTietHoaDon(hoaDon.getMaHoaDon()));
			for (ChiTietHoaDon ct : hoaDon.getChiTietHoaDon()) {
				ct.setSanPham(sanPhamDAO.getSanPham(ct.getMaSanPham()));
				// System.out.println("ma san pham : " + ct.getSP().getMaSanPham() + "--" +
				// ct.getSl());
			}
			// System.out.println("ma hoa don : " + hoaDon.getMaHoaDon());
		}

		// System.out.println("chi tiet = " +
		// list.get(0).getChitietHD().get(0).getSP().getTenSanPham());
		return new ModelAndView("order_details", "listorder", list);
	}

	@RequestMapping(value = "/admin/completecheck/{maHoaDon}")
	public ModelAndView sortOrderbyDate(@PathVariable int maHoaDon) {
		hoaDonDAO.updateTinhTrang(maHoaDon);
		return new ModelAndView("redirect:/admin/quanlyhoadon");
	}

	@ModelAttribute("loaisanpham")
	public List<LoaiSanPham> getLoai() {
		List<LoaiSanPham> loai = new ArrayList<LoaiSanPham>();
		loai.add(new LoaiSanPham("may in", "Máy In"));
		loai.add(new LoaiSanPham("may scan", "Máy Scan"));

		return loai;
	}
}
