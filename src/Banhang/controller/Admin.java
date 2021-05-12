package Banhang.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Banhang.entity.Khachhang;
import Banhang.entity.Mathang;
import Banhang.entity.Nhanvien;
import model.Anh;
import Banhang.entity.Loai;

@Transactional
@Controller
@RequestMapping("/admin/")
public class Admin {
	@Autowired
	SessionFactory factory;

	
	
	@RequestMapping(value = "login",method = RequestMethod.GET)
	public String login(HttpSession ses) {		
		if(ses.getAttribute("manv") != null) {
			ses.invalidate();
		}
		return"admin/login";
	}
	
	@RequestMapping(value = "login",method = RequestMethod.POST)
	public String login1(ModelMap model,HttpServletRequest request,HttpSession ses) {		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//luu du lieu vào list
//		Session session = factory.getCurrentSession();
//		String hql="FROM Nhanvien WHERE username ='"+username +"' and password = '"+password+"'";
//		Query query = session.createQuery(hql);
//		List<Nhanvien> list = query.list();
//		if(list.size() == 0) {
//			model.addAttribute("mess","tài khoản hoặc mật khẩu sai");
//			return "admin/login";
//		}
//		ses.setAttribute("nv", list);
//		System.out.print(ses.getAttribute("nv"));
		
		Session session = factory.getCurrentSession();
		String hql="SELECT ten FROM Nhanvien WHERE username ='"+username +"' and password = '"+password+"'";
		Query query = session.createQuery(hql);
		String tennv = (String)query.uniqueResult();
		if(tennv == null) {
			model.addAttribute("mess","tài khoản hoặc mật khẩu sai");
			return "admin/login";
		}
		ses.setAttribute("tennv", tennv);
		
		// lay manv
		String hql1="SELECT manv FROM Nhanvien WHERE username ='"+username +"' and password = '"+password+"'";
		Query query1 = session.createQuery(hql1);
		String manv = (String)query1.uniqueResult();
		ses.setAttribute("manv", manv);
		
		return"redirect:dashboard.htm";
	}
	@RequestMapping("logout")
	public String logout(HttpSession ses) {		
		ses.invalidate();
		return"redirect:login.htm";
	}
		
	
	@RequestMapping("dashboard")
	public String dashboard(HttpSession ses) {		
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		return"admin/dashboard";
	}
	
	@RequestMapping(value = "user",method = RequestMethod.GET)
	public String user(ModelMap model,@RequestParam String id,HttpSession ses) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM Nhanvien WHERE manv =:u";
		Query query = session.createQuery(hql);
		query.setText("u",id);
		Nhanvien nv = (Nhanvien) query.uniqueResult();
		model.addAttribute("nv", nv);
			
		//session
		ses.setAttribute("t1", nv);
		
		return"admin/user";
	}
	
	@RequestMapping("product")
	public String product(ModelMap model,HttpSession ses) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM Mathang";
		Query query = session.createQuery(hql);
		List<Mathang> listmh = query.list();
		model.addAttribute("mathang", listmh);
		//System.out.print(listmh.size());
		return"admin/product";
	}
	
	@RequestMapping(value = "user",method = RequestMethod.POST)
	public String updateprofile(ModelMap model,HttpServletRequest request,
			@RequestParam String id,
			HttpSession ses,@ModelAttribute("nv") Nhanvien nv) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		String mail = request.getParameter("mail").trim();
		String ten = request.getParameter("ten").trim();
		String ho = request.getParameter("ho").trim();
		String diachi = request.getParameter("diachi").trim();
		String sdt = request.getParameter("sdt").trim();
		
		if(mail == null || ten == null || ho == null|| diachi == null || sdt == null || sdt.length() <10) {			
			model.addAttribute("mess","lỗi nhập, xem lại thông tin!!!");
			return"redirect:user.htm";
		}
		
		// update xuống database
		Session session = factory.openSession() ;
		Transaction t = session.beginTransaction();			
		try {	
			Nhanvien nf = (Nhanvien)ses.getAttribute("t1");
			nf.setDiachi(diachi);
			nf.setHo(ho);
			nf.setTen(ten);
			nf.setMail(mail);
			nf.setSdt(sdt);
			session.update(nf);			
			t.commit();
			model.addAttribute("mess", "update hoàn tất ");
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("mess", "update thất bại!!! ");
		}
		finally {
			session.close();
		}
		return"redirect:user.htm?id="+id;
	}
	
	public String getanh(String anh) {
		String a = null;
		
		List<Anh> lista= linkanh();
		for(int i=0;i<lista.size();i++) {
			if(lista.get(i).getTenanh().equals(anh)) {					
				a= lista.get(i).getLink();
				break;
			}
		}	
		return a;
	}
	
	@RequestMapping(value = "product/update",method = RequestMethod.GET)
	public String updateproduct(ModelMap model,HttpSession ses,@RequestParam String id) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		model.addAttribute("check",1);
		Session session = factory.getCurrentSession();
		String hql = "FROM Mathang WHERE mamathang =:u";
		Query query = session.createQuery(hql);
		query.setText("u",id);
		Mathang mh = (Mathang) query.uniqueResult();
		model.addAttribute("mh", mh);
			
		//session
		ses.setAttribute("mh1", mh);
		
		// the loai
		String hql1 = "FROM Loai";
		Query query1 = session.createQuery(hql1);
		List<Loai> loai = query1.list();
		model.addAttribute("loai", loai);
		
		
		return "admin/infoProduct";
	}
	
	@RequestMapping(value = "product/update",method = RequestMethod.POST)
	public String updateproduct1(ModelMap model,HttpSession ses,@ModelAttribute("mh") Mathang mh,BindingResult errors,@RequestParam("photo") MultipartFile photo) {
		Session session;
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		if(mh.getTenmathang().trim().length() == 0) {	
			errors.rejectValue("tenmathang","mh","vui lòng nhập tên mặt hàng");
		}
		if(mh.getMota().trim().length() == 0) {	
			errors.rejectValue("mota","mh","vui lòng nhập mô tả");
		}
		if(mh.getXuatxu().trim().length() == 0) {	
			errors.rejectValue("xuatxu","mh","vui lòng nhập mô tả");
		}
		if(mh.getGiaban() == null) {	
			errors.rejectValue("giaban","mh","vui lòng nhập giá bán");
		}else if(mh.getGiaban().toString().trim().length() == 0.0) {	
			errors.rejectValue("giaban","mh","vui lòng nhập giá bán");			
		}
		
		
		if(errors.hasErrors()) {
			model.addAttribute("check",1);
			session = factory.getCurrentSession();
			String hql1 = "FROM Loai";
			Query query1 = session.createQuery(hql1);
			List<Loai> loai = query1.list();
			model.addAttribute("loai", loai);
			model.addAttribute("mh", ses.getAttribute("mh1"));
			return "admin/infoProduct";	
		}	
//		System.out.println(mh.getMamathang()+"-"+mh.getTenmathang()+"-"+mh.getLoai().tenloai+"-"+mh.getMota()+"-"+mh.getXuatxu()+"-"+mh.getGiaban());
		Mathang mh1 = (Mathang)ses.getAttribute("mh1");
		
		//lay loai
		session = factory.getCurrentSession();
		String hql2 = "FROM Loai WHERE tenloai =:u";
		Query query2 =session.createQuery(hql2);
		query2.setText("u",mh.getLoai().tenloai);
		Loai loaimh = (Loai)query2.uniqueResult();	
		mh.setLoai(loaimh);
		mh.setNhanvien((String)ses.getAttribute("manv"));
		mh.setMamathang(mh1.getMamathang());
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {		
			//ảnh 
			if(photo.isEmpty()) {
				mh.setAnh(mh1.getAnh());
			}else {
				String photoPath = context.getRealPath("/image/"+photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
					
				mh.setAnh(getanh(photo.getOriginalFilename()));
			}
			
			session.update(mh);
			t.commit();
			model.addAttribute("mess", "update d!!! ");	
		}catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("mess", "update thất bại!!! "+e);
		}
		finally {
			session.close();
		}	

		return  product(model,ses) ;
	}
	
	public List linkanh() {
		List<Anh> list = new ArrayList<Anh>();
		list.add(new Anh("1.jpg","https://i.ibb.co/gvmz505/1.jpg"));
		list.add(new Anh("2.png","https://i.ibb.co/92KWDvn/2.png"));
		list.add(new Anh("ao-khoac-g.jpg","https://i.ibb.co/VVbVcHG/ao-khoac-g.jpg"));
		list.add(new Anh("ao-khoac-1.jpg","https://i.ibb.co/YBCyMnF/ao-khoac-1.jpg"));
		list.add(new Anh("ao-khoac-3.jpg","https://i.ibb.co/wrRHxJ3/ao-khoac-3.jpg"));
		list.add(new Anh("banner.png","https://i.ibb.co/kDf919B/banner.png"));
		list.add(new Anh("banner1.png","https://i.ibb.co/ySnZ1K2/banner1.png"));
		list.add(new Anh("do-doi-gucci.jpg","https://i.ibb.co/s6KyxJF/do-doi-gucci.jpg"));
		list.add(new Anh("images.jpg","https://i.ibb.co/PzC5knG/images.jpg"));
		list.add(new Anh("logo.png","https://i.ibb.co/Zgw19xb/logo.png"));
		list.add(new Anh("quan-dai.jpg","https://i.ibb.co/89JKJJM/quan-dai.jpg"));
		list.add(new Anh("Quan-Gucci.jpg","https://i.ibb.co/nmSQ0qh/Quan-Gucci.jpg"));
		list.add(new Anh("quan-ngan-gucci.jpg","https://i.ibb.co/cC4bjk3/quan-ngan-gucci.jpg"));
		list.add(new Anh("quan-short-gucci.jpg","https://i.ibb.co/MhmrmxC/quan-short-gucci.jpg"));
		list.add(new Anh("quan-thun.jpg","https://i.ibb.co/x8RfQFn/quan-thun.jpg"));
		list.add(new Anh("quan-thun-3.jpg","https://i.ibb.co/VBW7hMP/quan-thun-3.jpg"));
		list.add(new Anh("yanke.jpg","https://i.ibb.co/1v755bw/yanke.jpg"));		
		return  list;
	}
	
	
	@RequestMapping(value = "product/delete",method = RequestMethod.GET)
	public String deleteproduct(ModelMap model,HttpSession ses,@RequestParam String id) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM Mathang where mamathang =:u";
		Query query = session.createQuery(hql);
		query.setText("u",id);
		Object u = query.uniqueResult();
		
		try {			
			session.delete(u);
			t.commit();
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
		}
		finally {
			session.close();
		}

		return  product(model,ses) ;
	}
	
	
	@RequestMapping(value="product/insert",method = RequestMethod.GET)
	public String insertproduct(ModelMap model,HttpSession ses) {	
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		model.addAttribute("check",2);
		Mathang mh = new Mathang();
		model.addAttribute("mh",mh);		
		// the loai
		Session session = factory.getCurrentSession();
		String hql1 = "FROM Loai";
		Query query1 = session.createQuery(hql1);
		List<Loai> loai = query1.list();
		model.addAttribute("loai", loai);
		
		return "admin/infoProduct";
	}
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="product/insert",method = RequestMethod.POST)
	public String insertproduct1(ModelMap model,@RequestParam("photo") MultipartFile photo,@ModelAttribute("mh") Mathang mh,BindingResult errors,HttpSession ses) {	
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		
		if(mh.getTenmathang().trim().length() == 0) {	
			errors.rejectValue("tenmathang","mh","vui lòng nhập tên mặt hàng");
		}
		if(mh.getMota().trim().length() == 0) {	
			errors.rejectValue("mota","mh","vui lòng nhập mô tả");
		}
		if(mh.getXuatxu().trim().length() == 0) {	
			errors.rejectValue("xuatxu","mh","vui lòng nhập xuất xứ");
		}
		if(mh.getGiaban() == null) {	
			errors.rejectValue("giaban","mh","vui lòng nhập giá bán");
		}else if(mh.getGiaban().toString().trim().length() == 0.0) {	
			errors.rejectValue("giaban","mh","vui lòng nhập giá bán");			
		}
		if(photo.isEmpty()) {
			errors.rejectValue("anh","mh","vui lòng nhập ảnh");			
		}
		
		
		Session session;
		if(errors.hasErrors()) {
			model.addAttribute("check",2);
			 session = factory.getCurrentSession();
			String hql1 = "FROM Loai";
			Query query1 = session.createQuery(hql1);
			List<Loai> loai = query1.list();
			model.addAttribute("loai", loai);
			return "admin/infoProduct";	
		}
		
//		//ảnh 
//		if( photo.getOriginalFilename().contains("*.jpg") ) {
//			  model.addAttribute("message","sai định dạng của hình ảnh " + photo.getContentType() +" " + photo.getOriginalFilename());		
// 	       }else if(cv.getContentType() != "doc") {			
//			  model.addAttribute("message","sai định dạng của cv: "+ cv.getContentType());
//		  }else {
			// lưu xuống csdl
			session = factory.openSession() ;
			Transaction t = session.beginTransaction();
			try {

				String photoPath = context.getRealPath("/image/"+photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
		
				
				String manv = (String)ses.getAttribute("manv");
//				System.out.println(mh.getTenmathang()+"-"+mh.getLoai().tenloai+"-"+mh.getMota()+"-"+mh.getXuatxu()+"-"+mh.getGiaban());
				Mathang mathang = new Mathang();
				//lay loai
				String hql2 = "FROM Loai WHERE tenloai =:u";
				Query query2 = session.createQuery(hql2);
				query2.setText("u",mh.getLoai().tenloai);
				Loai loaimh = (Loai)query2.uniqueResult();
				mathang.setTenmathang(mh.getTenmathang());
				mathang.setLoai(loaimh);;
				mathang.setMota(mh.getMota());
				mathang.setXuatxu(mh.getXuatxu());
				mathang.setAnh(getanh(photo.getOriginalFilename()));
				mathang.setGiaban(mh.getGiaban());
				mathang.setNhanvien(manv);
				session.save(mathang);
				t.commit();				
				
			} catch (Exception e) {
				// TODO: handle exception
				t.rollback();
				model.addAttribute("mess","lỗi insert");
				model.addAttribute("check",2);
				session = factory.getCurrentSession();
				String hql1 = "FROM Loai";
				Query query1 = session.createQuery(hql1);
				List<Loai> loai = query1.list();
				model.addAttribute("loai", loai);
				return "admin/infoProduct";	
			}
			finally {
				session.close();
			}	
		return product(model,ses);
	}
	
	@RequestMapping("type")
	public String  type(ModelMap model,HttpSession ses) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		Session session = factory.getCurrentSession();
		String hql1 = "FROM Loai";
		Query query1 = session.createQuery(hql1);
		List<Loai> loai = query1.list();
		model.addAttribute("loai", loai);	
		
		return "admin/type";
	}
	
	@RequestMapping(value="type/insert", method = RequestMethod.GET)
	public String  inserttype(ModelMap model,HttpSession ses) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		model.addAttribute("check",2);
		Loai loai = new Loai();
		model.addAttribute("loai",loai);		
		
		return "admin/infoType";
	}
	
	@RequestMapping(value="type/insert", method = RequestMethod.POST)
	public String  inserttype1(ModelMap model,@ModelAttribute("loai") Loai loai,BindingResult errors,HttpSession ses) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		if(loai.getMaloai().trim().length() == 0) {	
			errors.rejectValue("maloai","loai","vui lòng nhập tên mặt hàng");
		}
		if(loai.getTenloai().trim().length() == 0) {	
			errors.rejectValue("tenloai","loai","vui lòng nhập tên loại");
		}
		if(loai.getMota().trim().length() == 0) {	
			errors.rejectValue("mota","loai","vui lòng nhập mô tả");
		}
		
		Session session;
		if(errors.hasErrors()) {
			model.addAttribute("check",2);
			Loai l = new Loai();
			model.addAttribute("loai",l);					
			return "admin/infoType";
		}
		
		session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {	
			
			session.save(loai);
			t.commit();
			model.addAttribute("mess", "thêm thành công!!!");
			System.out.println(1);
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("mess", "thêm thất bại!!! "+e);
			model.addAttribute("check",2);
			Loai l = new Loai();
			model.addAttribute("loai",l);					
			return "admin/infoType";
		}
		finally {
			session.close();
		}
		return type(model,ses);
	}
	
	@RequestMapping(value="type/update", method = RequestMethod.GET)
	public String  updatetype(ModelMap model,HttpSession ses,@RequestParam String id) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		model.addAttribute("check",1);
		Session session = factory.getCurrentSession();
		String hql = "FROM Loai WHERE maloai =:u";
		Query query = session.createQuery(hql);
		query.setText("u",id);
		Loai loai = (Loai) query.uniqueResult();
		model.addAttribute("loai", loai);
			
		//session
		ses.setAttribute("loai1", loai);
		
		return "admin/infoType";
	}
	
	@RequestMapping(value="type/update", method = RequestMethod.POST)
	public String  updatetype1(ModelMap model,HttpSession ses,@ModelAttribute("loai") Loai loai,BindingResult errors) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		if(loai.getTenloai().trim().length() == 0) {	
			errors.rejectValue("tenloai","loai","vui lòng nhập tên loại");
		}
		if(loai.getMota().trim().length() == 0) {	
			errors.rejectValue("mota","loai","vui lòng nhập mô tả");
		}
		
		Session session;
		if(errors.hasErrors()) {
			model.addAttribute("check",1);
			model.addAttribute("loai",ses.getAttribute("loai1"));					
			return "admin/infoType";
		}
		
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {	
			Loai loai1 = (Loai)ses.getAttribute("loai1");
			loai.setMaloai(loai1.getMaloai());
			session.update(loai);
			t.commit();
			model.addAttribute("mess", "update thành công!!!");
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("mess", "update thất bại!!! "+e);
			model.addAttribute("check",1);
			model.addAttribute("loai",ses.getAttribute("loai1"));					
			return "admin/infoType";
		}
		finally {
			session.close();
		}		

		return type(model,ses);
	}
	
	
	@RequestMapping(value = "type/delete",method = RequestMethod.GET)
	public String deletetype(ModelMap model,HttpSession ses,@RequestParam String id) {
		if(ses.getAttribute("manv") == null) {		
			return"redirect:login.htm";
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "FROM Loai where maloai =:u";
		Query query = session.createQuery(hql);
		query.setText("u",id);
		Object u = query.uniqueResult();
		
		try {			
			session.delete(u);
			t.commit();
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
		}
		finally {
			session.close();
		}

		return  type(model,ses) ;
	}
	
	
}
	


