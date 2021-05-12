package Banhang.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name= "KHACHHANG")
public class Khachhang {
	@Id
	@Column(name = "MAKHACHHANG")	
	private String makh;	
	@Column(name="HO")
//	@NotBlank(message="họ không được trống")
	private String ho;
	@Column(name="TEN")
//	@NotBlank(message="tên không được trống")
	private String ten;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name ="NGAYSINH")
//	@NotBlank(message="ngày sinh không được trống")
	private Date ngaysinh;
	@Column(name="SDT")
//	@NotBlank(message="sdt không được trống")
	private String sdt;
	@Column(name="DIACHI")
//	@NotBlank(message="Địa chỉ không được trống")
	private String diachi;
	@Column(name="GIOITINH")
//	@NotBlank(message="giới tính không được trống")
	private boolean gioitinh;
	@Column(name="USERNAME")
//	@NotBlank(message="Username không được trống")
	private String username;
	@Column(name="PASS")
//	@NotBlank(message="Password không được trống")
	private String password;
	@Column(name="MAIL")
//	@NotBlank(message="Mail không được trống")
	private String mail;
	

	@OneToMany( mappedBy = "khachhang",fetch = FetchType.EAGER)
	private Collection<Hoadon> hoadon;

	public Khachhang() {
		
	}

	public Khachhang(String makh, String ho, String ten, Date ngaysinh, String sdt, String diachi, boolean gioitinh,
			String username, String password, String mail) {
		this.makh = makh;
		this.ho = ho;
		this.ten = ten;
		this.ngaysinh = ngaysinh;
		this.sdt = sdt;
		this.diachi = diachi;
		this.gioitinh = gioitinh;
		this.username = username;
		this.password = password;
		this.mail = mail;
	}

	public String getMakh() {
		return makh;
	}

	public void setMakh(String makh) {
		this.makh = makh;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public Date getNgaysinh() {
		return ngaysinh;
	}

	public void setNgaysinh(Date ngaysinh) {
		this.ngaysinh = ngaysinh;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public boolean isGioitinh() {
		return gioitinh;
	}

	public void setGioitinh(boolean gioitinh) {
		this.gioitinh = gioitinh;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	public Collection<Hoadon> getHoadon() {
		return hoadon;
	}

	public void setHoadon(Collection<Hoadon> hoadon) {
		this.hoadon = hoadon;
	}

	

	
}