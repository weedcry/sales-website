package Banhang.entity;

import java.util.Collection;

import javax.persistence.Column;
//import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="MATHANG")
public class Mathang {
	@Id 
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="MAMATHANG")
	private long mamathang;
	@Column(name="TENMATHANG")
	private String tenmathang;
	@ManyToOne
	@JoinColumn(name="MALOAI")
	private Loai loai;
	@Column(name="MOTA")
	private String mota;
	@Column(name="XUATXU")
	private String xuatxu;
	@Column(name="ANH")
	private String anh;
	@Column(name="GIABAN")
	private Float giaban;	
//	@ManyToOne
//	@JoinColumn(name="MANV")
//	private Nhanvien nhanvien;
	@Column(name="MANV")
	private String nhanvien;
	
	@OneToMany(mappedBy = "mathang",fetch = FetchType.EAGER)
	private Collection<Hoadon> hoadon;

	public Mathang() {
	}
	

	public Mathang(long mamathang, String tenmathang, Loai loai, String mota, String xuatxu, String anh, Float giaban,
		String nhanvien) {
	super();
	this.mamathang = mamathang;
	this.tenmathang = tenmathang;
	this.loai = loai;
	this.mota = mota;
	this.xuatxu = xuatxu;
	this.anh = anh;
	this.giaban = giaban;
	this.nhanvien = nhanvien;
}



	public long getMamathang() {
		return mamathang;
	}

	public void setMamathang(long mamathang) {
		this.mamathang = mamathang;
	}

	public String getTenmathang() {
		return tenmathang;
	}

	public void setTenmathang(String tenmathang) {
		this.tenmathang = tenmathang;
	}

	public Loai getLoai() {
		return loai;
	}

	public void setLoai(Loai loai) {
		this.loai = loai;
	}

	public String getMota() {
		return mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public String getXuatxu() {
		return xuatxu;
	}

	public void setXuatxu(String xuatxu) {
		this.xuatxu = xuatxu;
	}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}

	public Float getGiaban() {
		return giaban;
	}

	public void setGiaban(Float giaban) {
		this.giaban = giaban;
	}


	public String getNhanvien() {
		return nhanvien;
	}


	public void setNhanvien(String nhanvien) {
		this.nhanvien = nhanvien;
	}

}
