package co.toyslove.model;

public class ShopFilter {
	private int categoryId;
	private String ribbon;
	private int priceMin;
	private int priceMax;
	
	
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
		return "ShopFilter [categoryId=" + categoryId + ", priceMin=" + priceMin + ", priceMax=" + priceMax + "]";
	}
	
	

}
