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
@Table(name="NHANVIEN")
public class Nhanvien {
	@Id
	@Column(name="MANV")
	private String manv;
	@Column(name="HO")
	private String ho;
	@Column(name="TEN")
	private String ten;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name ="NGAYSINH")
	private Date ngaysinh;
	@Column(name="SDT")
	private String sdt;
	@Column(name="DIACHI")
	private String diachi;
	@Column(name="GIOITINH")
	private boolean gioitinh;
	@Column(name="USERNAME")
	private String username;
	@Column(name="PASS")
	private String password;
	@Column(name="MAIL")
	private String mail;
//	
//	@OneToMany(mappedBy = "nhanvien",fetch = FetchType.EAGER)
//	private Collection<Mathang> mathang;

	public Nhanvien() {
	}

	public Nhanvien(String manv, String ho, String ten, Date ngaysinh, String sdt, String diachi, boolean gioitinh,
			String username, String password, String mail) {
		this.manv = manv;
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

	public String getManv() {
		return manv;
	}

	public void setManv(String manv) {
		this.manv = manv;
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
	
	
}