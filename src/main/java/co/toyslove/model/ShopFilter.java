package co.toyslove.model;

import java.util.Arrays;

public class ShopFilter {
	private int categoryId;
	private String ribbon;
	private int priceMin;
	private int priceMax;
	private String[] strProductType;
	
	
	
	public String[] getStrProductType() {
		return strProductType;
	}
	public void setStrProductType(String[] strProductType) {
		this.strProductType = strProductType;
	}
	public String getRibbon() {
		return ribbon;
	}
	public void setRibbon(String ribbon) {
		this.ribbon = ribbon;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getPriceMin() {
		return priceMin;
	}
	public void setPriceMin(int priceMin) {
		this.priceMin = priceMin;
	}
	public int getPriceMax() {
		return priceMax;
	}
	public void setPriceMax(int priceMax) {
		this.priceMax = priceMax;
	}
	@Override
	public String toString() {
		return "ShopFilter [categoryId=" + categoryId + ", ribbon=" + ribbon + ", priceMin=" + priceMin + ", priceMax="
				+ priceMax + ", strProductType=" + Arrays.toString(strProductType) + "]";
	}
	
	

}
