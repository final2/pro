package com.finalproject.model;

public class ProductRegister {

	private int no;
	private String name;
	private int clientNo;
	private int price;
	private String memo;
	private String limiteAge;
	private int event;
	private int smallCat;
	private String imageurl;

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getClientNo() {
		return clientNo;
	}
	public void setClientNo(int clientNo) {
		this.clientNo = clientNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getLimiteAge() {
		return limiteAge;
	}
	public void setLimiteAge(String limiteAge) {
		this.limiteAge = limiteAge;
	}
	public int getEvent() {
		return event;
	}
	public void setEvent(int event) {
		this.event = event;
	}
	public int getSmallCat() {
		return smallCat;
	}
	public void setSmallCat(int smallCat) {
		this.smallCat = smallCat;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	@Override
	public String toString() {
		return "ProductRegister [no=" + no + ", name=" + name + ", clientNo=" + clientNo + ", price=" + price
				+ ", memo=" + memo + ", limiteAge=" + limiteAge + ", event=" + event + ", smallCat=" + smallCat
				+ ", imageurl=" + imageurl + "]";
	}
	

}
