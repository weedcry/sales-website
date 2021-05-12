package Banhang.controller;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.jdi.Method;

import Banhang.entity.Hoadon;
import Banhang.entity.Khachhang;
import Banhang.entity.Loai;
import Banhang.entity.Mathang;
import model.Donhang;

import java.time.LocalDate;
import java.time.LocalTime;

@Transactional
@Controller
@RequestMapping("/user/")
public class User {
	@Autowired
	SessionFactory factory;
	JavaMailSender mailer;
		
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String makh;
	
	public static java.sql.Date convertUtilToSql(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }
	
	public static Time dateToTime(java.util.Date date) {
		return new java.sql.Time(date.getTime());
	}

	
	@RequestMapping("index")
	public String index(ModelMap model,HttpServletRequest request,HttpSession ses) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Mathang";
		Query query = session.createQuery(hql);
		List<Mathang> list = query.list();
		Collections.reverse(list);
		
		model.addAttribute("mathang", list);
		if(ses.getAttribute("numcart") == null) {
			ses.setAttribute("numcart",0);
		}
		
//		// loại mặt hàng
		String hql1 = "FROM Loai";
		Query query1 = session.createQuery(hql1);
		List<Loai> listloai = query1.list();
		model.addAttribute("listloai", listloai);
		
		return "user/index";
	}

	public void sendmail(ModelMap model,String to,String body) {
		
		try {
			//tạo mail
			MimeMessage mail = mailer.createMimeMessage();
			
			String from = "phongnguyen9111999@gmail.com";
			String subject = "Geo Shop";
			
			// sử dụng lớp trợ giúp
			MimeMessageHelper helper = new MimeMessageHelper(mail); 
			helper.setFrom(from,from);
			helper.setTo(to);
			helper.setReplyTo(from,from);
			helper.setSubject(subject);
			helper.setText(body, true);
			
			//gửi mail
			mailer.send(mail);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}	
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login() {				
		
		return "user/login";
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login1(ModelMap model,HttpServletRequest request,HttpSession ses) {				
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Session session = factory.getCurrentSession();
		String hql="SELECT ten FROM Khachhang WHERE username ='"+username +"' and password = '"+password+"'";
		Query query = session.createQuery(hql);
		List<Khachhang> list = query.list();
		String tenkh = (String) query.uniqueResult();
		if(tenkh == null) {
			model.addAttribute("mess","tài khoản hoặc mật khẩu sai");
			return "user/login";
		}		
		// lấy tên khách hàng
		ses.setAttribute("tenkh", tenkh);
		//lấy username khách hàng
		String hql1="SELECT makh FROM Khachhang WHERE username ='"+username +"'";
		Query query1 = session.createQuery(hql1);
		String makh = (String) query1.uniqueResult();
		ses.setAttribute("makh", makh);
		return "redirect:index.htm";
	}
	
	@RequestMapping(value="register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		model.addAttribute("kh", new Khachhang());
		
		return "user/register";
	}
	
	@RequestMapping(value="register", method = RequestMethod.POST)
	public String register1(ModelMap model,
			@ModelAttribute("kh") Khachhang kh,
			BindingResult errors,HttpServletRequest request) throws ParseException {	
		String ns = request.getParameter("ns");
		if(ns.toString() == null) {
			errors.rejectValue("ngaysinh","kh","vui lòng nhập ngày sinh");		
			
		}
		else {
		
		}
	
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(ns);
		kh.setNgaysinh(convertUtilToSql(date));	
		
//		errors.rejectValue("ngaysinh","kh","vui lòng nhập ngày sinh");		
			
		if(kh.getHo().trim().length() == 0) {			
			errors.rejectValue("ho","kh","vui lòng nhập họ");					
		}
		if(kh.getTen().trim().length() == 0) {
			errors.rejectValue("ten","kh","vui lòng nhập tên");
		}
		if(kh.getDiachi().trim().length() == 0) {
			errors.rejectValue("diachi","kh","vui lòng nhập địa chỉ");
		}
		if(kh.getMail().trim().length() == 0) {
			errors.rejectValue("mail","kh","vui lòng nhập mail");
		}
		if(kh.getPassword().trim().length() == 0) {
			errors.rejectValue("password","kh","vui lòng nhập password");
		}
//		if(kh.getNgaysinh()== null) {
//			errors.rejectValue("ngaysinh","kh","vui lòng nhập ngày sinh");			
//		}
		
		if(kh.getSdt().trim().length() == 0) {
			errors.rejectValue("sdt","kh","vui lòng nhập sdt");
		}else {
			if(kh.getSdt().trim().length() < 10) {
				errors.rejectValue("sdt","kh","sdt không hợp lệ");
			}			
		}		

		
		if(errors.hasErrors()) {
			return "user/register";	
		}
		
		// kiểm tra 
		Session session = factory.getCurrentSession();
		String hql="SELECT username FROM Khachhang WHERE username =:u";
		Query query = session.createQuery(hql);
		query.setText("u", kh.getSdt().trim() );
		String check = (String) query.uniqueResult();
		if(check != null) {			
			errors.rejectValue("sdt","kh","số điện thoại đã được sử dụng!!!");
			return "user/register";	
		}
		
		// lưu xuống csdl
		session = factory.openSession() ;
		Transaction t = session.beginTransaction();

		try {	
			kh.setMakh(kh.getSdt().trim());
			kh.setUsername(kh.getSdt().trim());
			System.out.println(kh.getNgaysinh());
			session.save(kh);
			t.commit();
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			e.printStackTrace();
			model.addAttribute("message", "thêm thất bại!!! "+e);
			return "user/register";	
		}
		finally {
			session.close();
		}	
		return "redirect:index.htm";
	}

	@RequestMapping("order")
	public String order(ModelMap model,HttpServletRequest request,HttpSession ses) {
		if(ses.getAttribute("makh")!= null) {
			Session session = factory.getCurrentSession();
			String hql = "FROM Hoadon where MAKHACHHANG=:u";	
			String hql1 = "FROM Hoadon where MAKHACHHANG=:u";
			Query query = session.createQuery(hql);
			query.setText("u",ses.getAttribute("makh").toString());
			List<Hoadon> list = query.list();
			if(list.size() != 0) {
				Collections.reverse(list);
				model.addAttribute("sizelist",list.size());
				model.addAttribute("hd",list);
			}					
		}
		
		return "user/order";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession ses) {		
		ses.invalidate();
		return"redirect:index.htm";
	}

	
	@RequestMapping(value = "single",method = RequestMethod.GET)
	public String single(ModelMap model, @RequestParam String id) {			
		Session session = factory.getCurrentSession();
		String hql = "FROM Mathang WHERE mamathang =:u";
		Query query = session.createQuery(hql);
		query.setText("u",id);
		Mathang mh = (Mathang) query.uniqueResult();
		model.addAttribute("mh", mh);
		
//		// loại mặt hàng
		String hql1 = "FROM Loai";
		Query query1 = session.createQuery(hql1);
		List<Loai> listloai = query1.list();
		model.addAttribute("listloai", listloai);
		
		return "user/single";
	}	
	
	@RequestMapping(value = "buy",method = RequestMethod.GET)
	public String buy(ModelMap model,HttpServletRequest request,@RequestParam String id,HttpSession ses) {
		if(ses.getAttribute("makh") == null) {
			model.addAttribute("kt",0);
			return "redirect:login.htm";
		}
		System.out.println(request.getParameter("son"));
		// lấy thông tin sản phẩm
		Session session = factory.getCurrentSession();
		String hql = "FROM Mathang WHERE mamathang =:u";
		Query query = session.createQuery(hql);
		query.setText("u",id);
		Mathang mh = (Mathang) query.uniqueResult();
		if(ses.getAttribute("donhang") == null) {
			List<Donhang> listdh = new ArrayList<Donhang>();		
			listdh.add(new Donhang(mh.getMamathang(),mh.getTenmathang(),1,mh.getAnh(),mh.getGiaban()));	
			ses.setAttribute("donhang",listdh);	
			ses.setAttribute("numcart",listdh.size());
		}else {						
		List<Donhang> listdh = (List<Donhang>) ses.getAttribute("donhang");
		for(int i=0;i<listdh.size();i++) {
			if(listdh.get(i).getMamathang() == Integer.parseInt(id)) {
				int a = listdh.get(i).getSoluong();
				listdh.get(i).setSoluong(++a);
				ses.setAttribute("donhang",listdh);
				return "redirect:single.htm?id="+id;
			}
		}
		listdh.add(new Donhang(mh.getMamathang(),mh.getTenmathang(),1,mh.getAnh(),mh.getGiaban()));	
		ses.setAttribute("donhang",listdh);
		ses.setAttribute("numcart",listdh.size());
		}		
		return "redirect:single.htm?id="+id;
	}
	
	@RequestMapping("cart")
	public String Cart(ModelMap model,HttpSession ses) {
		if(ses.getAttribute("donhang") == null) {
			model.addAttribute("check", 0);
			return"user/cart";
		}

		List<Donhang> listdh = (List<Donhang>) ses.getAttribute("donhang");
		if(listdh.size() == 0) {
			model.addAttribute("check", 0);
			return"user/cart";	
		}
		
		float tong = 0;
		for(int i=0;i<listdh.size();i++) {			
			tong += listdh.get(i).getGiaban() * listdh.get(i).getSoluong(); 
		}	
		
		model.addAttribute("check",1);
		model.addAttribute("dh", listdh);
		model.addAttribute("tong", tong);
		return "user/cart";
	}
	
	@RequestMapping("deletecart")
	public String delete(ModelMap model,HttpSession ses,@RequestParam String id) {
		List<Donhang> listdh = (List<Donhang>) ses.getAttribute("donhang");	
		for(int i=0;i<listdh.size();i++) {
			if(listdh.get(i).getMamathang() == Integer.parseInt(id)) {
					listdh.remove(i);
					
			}
		}		
		ses.setAttribute("numcart", listdh.size());
		return"redirect:cart.htm";
	}	
	
	
	@RequestMapping("shopping")
	public String shopping(ModelMap model,HttpSession ses) throws ParseException{
		//tạo chuôi hóa đơn theo makh+ nam-thang-ngay gio phut
		 LocalDate d = java.time.LocalDate.now();
		 LocalTime h = java.time.LocalTime.now();
		 String a = d.toString().substring(2, 4)+d.toString().substring(5,7)+d.toString().substring(8,10);
		 String b = h.toString().substring(0,2)+h.toString().substring(3,5);
		 String makh = (String)ses.getAttribute("makh");
		 String c =makh+a+b;
//		 System.out.println(a);
//		 System.out.println(b);
//		 System.out.println(c);
		 
		 //ngày
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(d.toString());
//		System.out.println(convertUtilToSql(date));
		
		//giờ
		Date time1 = new SimpleDateFormat("hh:mm:ss").parse(h.toString());
//		System.out.println(dateToTime(time1));

		List<Donhang> listdh = (List<Donhang>) ses.getAttribute("donhang");	
		Session session = factory.getCurrentSession();
		//lấy khách hang
		String hql1 = "FROM Khachhang WHERE makhachhang =:u";
		Query query1 = session.createQuery(hql1);
		query1.setText("u",(String)ses.getAttribute("makh"));
		Khachhang kh = (Khachhang) query1.uniqueResult();
		
		for(int i=0;i<listdh.size();i++) {
			
			int num = i+1;

			
			//lấy mặt hàng
			String hql = "FROM Mathang WHERE mamathang =:u";
			Query query = session.createQuery(hql);
			query.setText("u",String.valueOf(listdh.get(i).getMamathang()));
			Mathang mh = (Mathang) query.uniqueResult();
				
			float dongia = listdh.get(i).getGiaban()*listdh.get(i).getSoluong();
			Hoadon hd = new Hoadon();
			hd.setMahoadon(c);
			hd.setThutu(num);
			hd.setMathang(mh);
			hd.setTenmathang(listdh.get(i).getTenmathang());
			hd.setNgay(convertUtilToSql(date));
			hd.setGio(dateToTime(time1));
			hd.setSoluong(listdh.get(i).getSoluong());
			hd.setDongia(dongia);
			hd.setPhiship(0);
			hd.setGiamgia(0);
			hd.setThanhtien(dongia);
			hd.setThanhtoan(0);
			hd.setKhachhang(kh);
			// lưu xuống csdl
			session = factory.openSession() ;
			Transaction t = session.beginTransaction();
			

			try {	
				session.save(hd);

				t.commit();
				ses.removeAttribute("donhang");
				ses.removeAttribute("numcart");
			} catch (Exception e) {
				// TODO: handle exception
				t.rollback();
				e.printStackTrace();
				model.addAttribute("message", "thêm thất bại!!! "+e);
				return "redirect:cart.htm";	
			}
			finally {
				session.close();
			}	
		}	
		//tạo thông tin mail
		String to = kh.getMail();
		String body = "Cảm ơn bạn đã mua sản phẩm tại Geo Shop\n";
		float tong = 0;
		for(int k=0;k<listdh.size();k++) {
			tong += listdh.get(k).getGiaban()*listdh.get(k).getSoluong();
			body += listdh.get(k).getMamathang()+"  - ";
			body += listdh.get(k).getTenmathang()+"  -  ";
			body += listdh.get(k).getSoluong()+"   -  ";
			body += listdh.get(k).getGiaban()+ "  -   \n";
		}
		body += "tổng tiền: "+tong;		
		sendmail(model,to ,body);
		System.out.println("gửi mail");
		return"redirect:order.htm";
	}
	
	
	@RequestMapping("type")
	public String Sorttheloai(ModelMap model,HttpServletRequest request,@RequestParam String id,HttpSession ses) {
		if(ses.getAttribute("numcart") == null) {
			ses.setAttribute("numcart",0);			
		}
		
		Session session = factory.getCurrentSession();
		String hql = "FROM Mathang WHERE loai.maloai =:u";
		Query query = session.createQuery(hql);
		query.setText("u",id);
		List<Mathang> list = query.list();
		Collections.reverse(list);
		model.addAttribute("mathang", list);		
		
		// lấy tên thể loại
		String hql1 = "SELECT tenloai FROM Loai WHERE maloai =:u";
		Query query1 = session.createQuery(hql1);
		query1.setText("u",id);
		String tenloai = (String)query1.uniqueResult();
		model.addAttribute("tenloai", tenloai);	
		
//		// loại mặt hàng
		String hql2 = "FROM Loai";
		Query query2 = session.createQuery(hql2);
		List<Loai> listloai = query2.list();
		model.addAttribute("listloai", listloai);

		return "user/index";
	}
	
	@RequestMapping(value="info",method = RequestMethod.GET)
	public  String info(HttpServletRequest request,HttpSession ses,ModelMap model) {
		if(ses.getAttribute("makh") == null) {
			return "redirect:index.htm";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM Khachhang WHERE makhachhang =:u";
		Query query = session.createQuery(hql);
		query.setText("u",(String)ses.getAttribute("makh"));
		Khachhang kh = (Khachhang) query.uniqueResult();
		model.addAttribute("kh", kh);

		return "user/register";
	}
	
	@RequestMapping(value="info", method = RequestMethod.POST)
	public String info1(ModelMap model,
			@ModelAttribute("kh") Khachhang kh,
			BindingResult errors,HttpServletRequest request,HttpSession ses) throws ParseException {	
		String ns = request.getParameter("ns");	
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(ns);
		kh.setNgaysinh(convertUtilToSql(date));		
			
		if(kh.getHo().trim().length() == 0) {			
			errors.rejectValue("ho","kh","vui lòng nhập họ");					
		}
		if(kh.getTen().trim().length() == 0) {
			errors.rejectValue("ten","kh","vui lòng nhập tên");
		}
		if(kh.getDiachi().trim().length() == 0) {
			errors.rejectValue("diachi","kh","vui lòng nhập địa chỉ");
		}
		if(kh.getPassword().trim().length() == 0) {
			errors.rejectValue("password","kh","vui lòng nhập password");
		}
//		if(kh.getNgaysinh()== null) {
//			errors.rejectValue("ngaysinh","kh","vui lòng nhập ngày sinh");			
//		}
		
		if(errors.hasErrors()) {
			return "user/register";	
		}
		
		// 
		Session session = factory.getCurrentSession();
		String hql1 = "FROM Khachhang WHERE makhachhang =:u";
		Query query1 = session.createQuery(hql1);
		query1.setText("u",(String)ses.getAttribute("makh"));
		Khachhang kh1 = (Khachhang) query1.uniqueResult();
		
		
		// lưu xuống csdl
		session = factory.openSession() ;
		Transaction t = session.beginTransaction();

		try {	
			kh.setMakh(kh1.getSdt());
			kh.setUsername(kh1.getSdt());
			kh.setSdt(kh1.getSdt());
			kh.setMail(kh1.getMail());
			session.update(kh);
			t.commit();
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			e.printStackTrace();
			model.addAttribute("message", "thêm thất bại!!! "+e);
			return "user/register";	
		}
		finally {
			session.close();
		}	
		return "redirect:index.htm";
	}
	
	
	
	@RequestMapping(value="search",method = RequestMethod.GET)
	public  String search(HttpServletRequest request,@RequestParam("abcf") String m) {

		
		
		
		return "user/index";
	}
	
	
	
	

}
