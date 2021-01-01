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
public class MayInController {
	@Autowired
	private SanPhamDAO sanPhamDAO;
	
	//Loc may in
	@RequestMapping(value= {"/product_mayin"}, method = RequestMethod.GET)
	public ModelAndView home(ModelAndView modelandview) {
		List<SanPham> list = sanPhamDAO.getMayIn();
		return new ModelAndView("home", "list", list);
	}
	
	//Loc san pham co gia cao hon 5 trieu
	@RequestMapping(value= {"/product_cao"}, method = RequestMethod.GET)
	public ModelAndView homeCao(ModelAndView modelandview) {
		List<SanPham> list = sanPhamDAO.getSanPhamGiaCaoHon5Trieu();
		return new ModelAndView("home", "list", list);
	}
	
	//Loc san pham co gia thap hon 5 trieu
	@RequestMapping(value= {"/product_thap"}, method = RequestMethod.GET)
	public ModelAndView homeThap(ModelAndView modelandview) {
		List<SanPham> list = sanPhamDAO.getSanPhamGiaThapHon5Trieu();
		return new ModelAndView("home", "list", list);
	}
	
	//Tat ca san pham
	@RequestMapping(value= {"/product_all"}, method = RequestMethod.GET)
	public ModelAndView homeAll(ModelAndView modelandview) {
		List<SanPham> list = sanPhamDAO.getAllSanPham();
		return new ModelAndView("home", "list", list);
	}
}
