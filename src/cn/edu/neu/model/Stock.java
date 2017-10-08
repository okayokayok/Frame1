package cn.edu.neu.model;

public class Stock {

	private int stockId;
	private int goodsId;
	private String goodsName;
	private int sizeId;
	private String sizeName;
	private int colorId;
	private String colorName;
	private int stockNum;
	private int salesNum;
	public int getStockId() {
		return stockId;
	}
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getSizeId() {
		return sizeId;
	}
	public void setSizeId(int sizeId) {
		this.sizeId = sizeId;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	public int getColorId() {
		return colorId;
	}
	public void setColorId(int colorId) {
		this.colorId = colorId;
	}
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	public int getStockNum() {
		return stockNum;
	}
	public void setStockNum(int stockNum) {
		this.stockNum = stockNum;
	}
	public int getSalesNum() {
		return salesNum;
	}
	public void setSalesNum(int salesNum) {
		this.salesNum = salesNum;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	@Override
	public String toString() {
		return "Stock [stockId=" + stockId + ", goodsId=" + goodsId + ", goodsName=" + goodsName + ", sizeId=" + sizeId
				+ ", sizeName=" + sizeName + ", colorId=" + colorId + ", colorName=" + colorName + ", stockNum="
				+ stockNum + ", salesNum=" + salesNum + "]";
	}
	
}
