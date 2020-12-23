package vn.edu.iuh.controllers;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vn.edu.iuh.dao.HoaDonDAO;
import vn.edu.iuh.dao.SanPhamDAO;
import vn.edu.iuh.entities.ChiTietHoaDon;
import vn.edu.iuh.entities.GioHangSession;
import vn.edu.iuh.entities.HoaDon;
import vn.edu.iuh.entities.SanPham;

@Controller
public class ProductOrderController {

	@Autowired
	private SanPhamDAO sanPhamDAO;
	
	@Autowired
	private HoaDonDAO hoaDonDAO;
	
	@RequestMapping(value = "themGioHang/{maSanPham}", method = RequestMethod.GET)
	public String themGioHang(ModelMap mm, HttpSession session, @PathVariable("maSanPham") String maSanPham) {
		HashMap<String, GioHangSession> cartItems = (HashMap<String, GioHangSession>) session.getAttribute("myCartItems");
		if (cartItems == null) {
            cartItems = new HashMap<String, GioHangSession>();
        }
		SanPham sanPham = sanPhamDAO.getSanPham(maSanPham);
        if (sanPham != null) {
            if (cartItems.containsKey(maSanPham)) {
                GioHangSession gioHangSession = cartItems.get(maSanPham);
                gioHangSession.setSanPham(sanPham);
                gioHangSession.setSoLuong(gioHangSession.getSoLuong() + 1);
                cartItems.put(maSanPham, gioHangSession);
            } else {
                GioHangSession gioHangSession = new GioHangSession();
                gioHangSession.setSanPham(sanPham);
                gioHangSession.setSoLuong(1);
                cartItems.put(maSanPham, gioHangSession);
            }
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/product_order";
	}
	
	@RequestMapping(value = "/product_order", method = RequestMethod.GET)
    public String order(ModelMap mm, HttpSession session) {
        HashMap<String, GioHangSession> cartItems = (HashMap<String, GioHangSession>) session.getAttribute("myCartItems");
        if (cartItems != null) { 
	        session.getAttribute("myCartItems");
	        session.getAttribute("myCartTotal");
	        session.getAttribute("myCartNum");
        }
        return "product_order";
    }
	
	@RequestMapping(value = "/product_order/summary", method = RequestMethod.GET)
	public ModelAndView listOrder(HttpSession session) {
		HashMap<String, GioHangSession> cartItems = (HashMap<String, GioHangSession>) session.getAttribute("myCartItems");
		if (cartItems != null) {
			session.getAttribute("myCartItems");
			session.getAttribute("myCartTotal");
			session.getAttribute("myCartNum");
		}
		return new ModelAndView("check_out", "command", new HoaDon());
	}
	
	@RequestMapping(value = "/product_order/checkout", method = RequestMethod.POST)
	public ModelAndView checkout(HttpSession session, @ModelAttribute("hoadon") HoaDon hoadon) {
		 //List<GioHangSession> listsession = null;
		 List<ChiTietHoaDon> dsct = new ArrayList<ChiTietHoaDon>();
		 int mahd = 10000 + (int)(Math.random()*1000);
		  
		 HashMap<String, GioHangSession> cartItems = (HashMap<String, GioHangSession>)session.getAttribute("myCartItems"); 
		 if (cartItems != null) { 
			int soluong = 0;  
			double tongtien = 0; 
			
			session.getAttribute("myCartItems"); 
			tongtien = (double) session.getAttribute("myCartTotal"); 
			soluong = (int)session.getAttribute("myCartNum");		
			
			hoadon.setTinhTrang("cho duyet");
			hoadon.setTongTien(tongtien);
			hoadon.setMaHoaDon(mahd);
			Date date = new Date();
			hoadon.setNgayHoaDon(new java.sql.Date(date.getTime()));
			hoaDonDAO.insertHoaDon(hoadon);
			
			for (Map.Entry<String, GioHangSession> list : cartItems.entrySet()) {
				//count += list.getValue().getSanPham().getDonGia() * list.getValue().getSoLuong();
				ChiTietHoaDon cthd = new ChiTietHoaDon(list.getValue().getSoLuong(), list.getValue().getSanPham().getMaSanPham(),
						list.getValue().getSanPham().getDonGia() * list.getValue().getSoLuong(), mahd);
				hoaDonDAO.insertChiTietHoaDon(cthd);
				SanPham sp = sanPhamDAO.getSanPham(list.getValue().getSanPham().getMaSanPham());
				sp.setSoLuongTon(sp.getSoLuongTon() - cthd.getSoLuong());
				//System.out.println("chi tiet hoa don : " + cthd.getMaCTHD() + "-" + cthd.getMaSP() + "-" + cthd.getSl());
				sanPhamDAO.update(sp);
			}
			//hoadon.setChitietHD(dsct);
			System.out.println("Hoa don : " + hoadon.getHo() + "-" + hoadon.getTongTien());
		 }		
		 return new ModelAndView("redirect:/home");
	}
	
	@RequestMapping(value = "/tangSoLuong/{maSanPham}/{soLuongTon}", method = RequestMethod.GET)
    public String tangSoLuong(ModelMap mm, HttpSession session,  @PathVariable("maSanPham") String maSanPham, @PathVariable("soLuongTon") int soLuongTon, HttpServletRequest request) {
        HashMap<String, GioHangSession> cartItems_old = (HashMap<String, GioHangSession>) session.getAttribute("myCartItems");
        if (cartItems_old != null) {
        	GioHangSession gioHangSession = cartItems_old.get(maSanPham);
        	HashMap<String, GioHangSession> cartItems_new = cartItems_old;
        	if (cartItems_old.get(maSanPham).getSoLuong() + 1 <= soLuongTon ) {
        		gioHangSession.setSoLuong(cartItems_old.get(maSanPham).getSoLuong() + 1);
	        	session.setAttribute("myCartItems", cartItems_new);
	        	session.setAttribute("myCartTotal", totalPrice(cartItems_new));
	            session.setAttribute("myCartNum", cartItems_new.size());
		        request.setAttribute("myCartItems", cartItems_new);
		        request.setAttribute("myCartTotal", totalPrice(cartItems_new));
	            request.setAttribute("myCartNum", cartItems_new.size());
        	}
        }
        return "redirect:/product_order";
    }
	
	@RequestMapping(value = "/giamSoLuong/{maSanPham}", method = RequestMethod.GET)
    public String giamSoLuong(ModelMap mm, HttpSession session,  @PathVariable("maSanPham") String maSanPham, HttpServletRequest request) {
        HashMap<String, GioHangSession> cartItems_old = (HashMap<String, GioHangSession>) session.getAttribute("myCartItems");
        if (cartItems_old != null) {
        	GioHangSession gioHangSession = cartItems_old.get(maSanPham);
        	HashMap<String, GioHangSession> cartItems_new = cartItems_old;
        	if (cartItems_old.get(maSanPham).getSoLuong() - 1 > 0) {
	        	gioHangSession.setSoLuong(cartItems_old.get(maSanPham).getSoLuong() - 1);
	        	session.setAttribute("myCartItems", cartItems_new);
	        	session.setAttribute("myCartTotal", totalPrice(cartItems_new));
	            session.setAttribute("myCartNum", cartItems_new.size());
		        request.setAttribute("myCartItems", cartItems_new);
		        request.setAttribute("myCartTotal", totalPrice(cartItems_new));
	            request.setAttribute("myCartNum", cartItems_new.size());
        	}
        	if (cartItems_old.get(maSanPham).getSoLuong() - 1 == 0) {
        		cartItems_new.remove(maSanPham);
        		session.setAttribute("myCartItems", cartItems_new);
	        	session.setAttribute("myCartTotal", totalPrice(cartItems_new));
	            session.setAttribute("myCartNum", cartItems_new.size());
		        request.setAttribute("myCartItems", cartItems_new);
		        request.setAttribute("myCartTotal", totalPrice(cartItems_new));
	            request.setAttribute("myCartNum", cartItems_new.size());
        	}
        }
        return "redirect:/product_order";
    }
	
	public double totalPrice(HashMap<String, GioHangSession> cartItems) {
        double count = 0;
        for (Map.Entry<String, GioHangSession> list : cartItems.entrySet()) {
            count += list.getValue().getSanPham().getDonGia() * list.getValue().getSoLuong();
        }
        return count;
    }
}
