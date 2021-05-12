package Banhang.entity;

import java.util.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="HOADON")
public class Hoadon {
	@Id
	@Column(name ="MAHOADON")
	private String mahoadon;
	@Column(name ="THUTU")
	private int thutu;

	@ManyToOne
	@JoinColumn(name ="MAMATHANG")
	private Mathang mathang;
	
	@Column(name ="TENMATHANG")
	private String tenmathang;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name ="NGAY")
	private Date ngay;
	@Column(name="GIO")
	private Time gio;
	@Column(name ="SOLUONG")
	private int soluong; 
	@Column(name ="DONGIA")
	private float dongia;
	@Column(name ="PHISHIP")
	private float phiship;
	@Column(name ="GIAMGIA")
	private float giamgia;
	@Column(name ="THANHTIEN")
	private float thanhtien;
	@Column(name ="THANHTOAN")
	private int thanhtoan;	
	
	@ManyToOne
	@JoinColumn(name ="MAKHACHHANG")
	private Khachhang khachhang;
	
	
	public Hoadon() {
	}


	public Hoadon(String mahoadon, int thutu, Mathang mathang, String tenmathang,Date ngay,Time gio, int soluong,
			float dongia, float phiship, float giamgia, float thanhtien, int thanhtoan, Khachhang khachhang) {
		this.mahoadon = mahoadon;
		this.thutu = thutu;
		this.mathang = mathang;
		this.tenmathang = tenmathang;
		this.ngay = ngay;
		this.gio = gio;
		this.soluong = soluong;
		this.dongia = dongia;
		this.phiship = phiship;
		this.giamgia = giamgia;
		this.thanhtien = thanhtien;
		this.thanhtoan = thanhtoan;
		this.khachhang = khachhang;
	}


	public String getMahoadon() {
		return mahoadon;
	}


	public void setMahoadon(String mahoadon) {
		this.mahoadon = mahoadon;
	}


	public int getThutu() {
		return thutu;
	}


	public void setThutu(int thutu) {
		this.thutu = thutu;
	}


	public Mathang getMathang() {
		return mathang;
	}


	public void setMathang(Mathang mathang) {
		this.mathang = mathang;
	}


	public String getTenmathang() {
		return tenmathang;
	}


	public void setTenmathang(String tenmathang) {
		this.tenmathang = tenmathang;
	}


	public Date getNgay() {
		return ngay;
	}


	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}


	public int getSoluong() {
		return soluong;
	}


	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}


	public float getDongia() {
		return dongia;
	}


	public void setDongia(float dongia) {
		this.dongia = dongia;
	}


	public float getPhiship() {
		return phiship;
	}


	public void setPhiship(float phiship) {
		this.phiship = phiship;
	}


	public float getGiamgia() {
		return giamgia;
	}


	public void setGiamgia(float giamgia) {
		this.giamgia = giamgia;
	}


	public float getThanhtien() {
		return thanhtien;
	}


	public void setThanhtien(float thanhtien) {
		this.thanhtien = thanhtien;
	}


	public int getThanhtoan() {
		return thanhtoan;
	}


	public void setThanhtoan(int thanhtoan) {
		this.thanhtoan = thanhtoan;
	}


	public Khachhang getKhachhang() {
		return khachhang;
	}


	public void setKhachhang(Khachhang khachhang) {
		this.khachhang = khachhang;
	}


	public Time getGio() {
		return gio;
	}


	public void setGio(Time gio) {
		this.gio = gio;
	}

	
}

