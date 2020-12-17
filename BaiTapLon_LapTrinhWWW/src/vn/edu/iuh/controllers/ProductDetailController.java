package vn.edu.iuh.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vn.edu.iuh.dao.SanPhamDAO;
import vn.edu.iuh.entities.SanPham;

@Controller
public class ProductDetailController {
	@Autowired
	private SanPhamDAO sanPhamDAO;
	
	@RequestMapping(value= {"/product_detail/{maSanPham}"}, method = RequestMethod.GET)
	public ModelAndView productdetail(ModelAndView modelandview, @PathVariable String maSanPham) {
		SanPham sanPham = sanPhamDAO.getSanPham(maSanPham);
		return new ModelAndView("product_detail", "SanPham", sanPham);
	}
	
	@RequestMapping(value= {"/product_detail/home"}, method = RequestMethod.GET)
	public ModelAndView home(ModelAndView modelandview) {
		List<SanPham> listSanPham = sanPhamDAO.getAllSanPham();
		return new ModelAndView("redirect:/home", "listSanPham", listSanPham);
	}
	
	@RequestMapping(value= {"/product_detail/product_order"})
	public String giohang() {
		return "redirect:/product_order";
	}
}
