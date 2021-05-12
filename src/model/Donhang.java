package model;

public class Donhang {
	private long mamathang;
	private String tenmathang;
	private int soluong;
	private String anh;
	private Float giaban;
	
	
	public Donhang() {
	}
	public Donhang(long mamathang,String tenmathang, int soluong, String anh, Float giaban) {
		this.mamathang = mamathang;
		this.tenmathang = tenmathang;
		this.soluong = soluong;
		this.anh = anh;
		this.giaban = giaban;
	}
	public long getMamathang() {
		return mamathang;
	}
	public void setMamathang(long mamathang) {
		this.mamathang = mamathang;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
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
	public String getTenmathang() {
		return tenmathang;
	}
	public void setTenmathang(String tenmathang) {
		this.tenmathang = tenmathang;
	}
}
