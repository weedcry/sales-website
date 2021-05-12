package Banhang.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="LOAI")
public class Loai {
	@Id
	@Column(name="MALOAI")
	public String maloai;
	@Column(name="TENLOAI")
	public String tenloai;
	@Column(name="MOTA")
	public String mota;
	
	@OneToMany(mappedBy = "loai",fetch = FetchType.EAGER)
	public Collection<Mathang> mathang;
	
	public Loai() {
	}

	public Loai(String maloai, String tenloai, String mota) {
		this.maloai = maloai;
		this.tenloai = tenloai;
		this.mota = mota;
	}

	public String getMaloai() {
		return maloai;
	}

	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}

	public String getTenloai() {
		return tenloai;
	}

	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}

	public String getMota() {
		return mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public Collection<Mathang> getMathang() {
		return mathang;
	}

	public void setMathang(Collection<Mathang> mathang) {
		this.mathang = mathang;
	}
	
	
}
