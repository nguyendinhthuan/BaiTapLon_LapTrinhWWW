package vn.edu.iuh.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import vn.edu.iuh.dao.SanPhamDAO;
import vn.edu.iuh.entities.SanPham;

@Controller
public class HomeController {
	@Autowired
	private SanPhamDAO sanPhamDAO;
	
	@RequestMapping(value= {"home","/"}, method = RequestMethod.GET)
	public ModelAndView home(ModelAndView modelAndView) {
		List<SanPham> list = sanPhamDAO.getAllSanPham();
		return new ModelAndView("home", "list", list);
	}
	
}
