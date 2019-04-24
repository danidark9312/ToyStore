package co.toyslove.model;

import co.toyslove.entity.Product;

public class ShoppingItem {
	private Product product;
	private int count;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "ShoppingItem [product=" + product + ", count=" + count + "]";
	}

}
