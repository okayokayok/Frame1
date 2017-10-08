package cn.edu.neu.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.web.multipart.MultipartFile;

public class Goods {
	private int goodsId;
	private int cateId;
	private String goodsName;
	private String goodsDisc;
	private float goodsPrice;
	private float goodsDiscount;
	private int goodsStock;
	private String goodsOrigin;
	private String goodsMaterial;
	private int goodsPostalfee;
	private String goodsDate;
	private int goodsSales;
	private String goodsPic;
	private List<Pic> pics;
	private List<Size> sizes;
	private List<Color> colors;
	
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsDisc() {
		return goodsDisc;
	}
	public void setGoodsDisc(String goodsDisc) {
		this.goodsDisc = goodsDisc;
	}
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public float getGoodsDiscount() {
		return goodsDiscount;
	}
	public void setGoodsDiscount(float goodsDiscount) {
		this.goodsDiscount = goodsDiscount;
	}
	public int getGoodsStock() {
		return goodsStock;
	}
	public void setGoodsStock(int goodsStock) {
		this.goodsStock = goodsStock;
	}
	public String getGoodsOrigin() {
		return goodsOrigin;
	}
	public void setGoodsOrigin(String goodsOrigin) {
		this.goodsOrigin = goodsOrigin;
	}
	public String getGoodsMaterial() {
		return goodsMaterial;
	}
	public void setGoodsMaterial(String goodsMaterial) {
		this.goodsMaterial = goodsMaterial;
	}
	public int getGoodsPostalfee() {
		return goodsPostalfee;
	}
	public void setGoodsPostalfee(int goodsPostalfee) {
		this.goodsPostalfee = goodsPostalfee;
	}
	public String getGoodsDate() {
		return goodsDate;
	}
	public void setGoodsDate(String goodsDate) {
		this.goodsDate = goodsDate;
	}
	public int getGoodsSales() {
		return goodsSales;
	}
	public void setGoodsSales(int goodsSales) {
		this.goodsSales = goodsSales;
	}
	public String getGoodsPic() {
		return goodsPic;
	}
	public void setGoodsPic(String goodsPic) {
		this.goodsPic = goodsPic;
	}
	
	public List<Pic> getPics() {
		return pics;
	}
	public void setPics(List<Pic> pics) {
		this.pics = pics;
	}
	public List<Size> getSizes() {
		return sizes;
	}
	public void setSizes(List<Size> sizes) {
		this.sizes = sizes;
	}
	public List<Color> getColors() {
		return colors;
	}
	public void setColors(List<Color> colors) {
		this.colors = colors;
	}
	@Override
	public String toString() {
		return "Goods [goodsId=" + goodsId + ", cateId=" + cateId + ", goodsName=" + goodsName + ", goodsDisc="
				+ goodsDisc + ", goodsPrice=" + goodsPrice + ", goodsDiscount=" + goodsDiscount + ", goodsStock="
				+ goodsStock + ", goodsOrigin=" + goodsOrigin + ", goodsMaterial=" + goodsMaterial + ", goodsPostalfee="
				+ goodsPostalfee + ", goodsDate=" + goodsDate + ", goodsSales=" + goodsSales + ", goodsPic=" + goodsPic
				+ ", pics=" + pics + ", sizes=" + sizes + ", colors=" + colors + "]";
	}
	
	
	
}
