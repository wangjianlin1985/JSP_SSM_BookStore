package com.shopping.model;

import java.math.BigDecimal;

public class Goods extends BaseModel{
	private String name;
	private int typeid;
	private String title;
	private String descript;
	private BigDecimal price;
	private String messageurl;
	private String photourl;
	private BigDecimal weight;
	private int total;
	private int count;
	private int tuijian;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getPhotourl() {
		return photourl;
	}
	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTuijian() {
		return tuijian;
	}
	public void setTuijian(int tuijian) {
		this.tuijian = tuijian;
	}
	public BigDecimal getWeight() {
		return weight;
	}
	public void setWeight(BigDecimal weight) {
		this.weight = weight;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getMessageurl() {
		return messageurl;
	}
	public void setMessageurl(String messageurl) {
		this.messageurl = messageurl;
	}
	
}
