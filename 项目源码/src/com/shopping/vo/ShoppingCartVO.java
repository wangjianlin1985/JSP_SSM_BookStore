package com.shopping.vo;

import java.math.BigDecimal;

import com.shopping.model.BaseModel;

public class ShoppingCartVO extends BaseModel{
	private int userid;
	private String name;
	private int goodsid;
	private String photourl;
	private String title;
	private int count;
	private BigDecimal weight;
	private BigDecimal oneprice;
	private BigDecimal price;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public BigDecimal getWeight() {
		return weight;
	}
	public void setWeight(BigDecimal weight) {
		this.weight = weight;
	}
	public BigDecimal getOneprice() {
		return oneprice;
	}
	public void setOneprice(BigDecimal oneprice) {
		this.oneprice = oneprice;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhotourl() {
		return photourl;
	}
	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}
	
}
