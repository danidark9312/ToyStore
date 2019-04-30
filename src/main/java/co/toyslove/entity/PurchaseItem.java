package co.toyslove.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="purchaseorderproduct")
public class PurchaseItem {
	
	@EmbeddedId
	private PurchaseItemPK purchaseItemPK;
	
	@Column(name="dsproduct")
	private String productName;
	@Column(name="vlqnty")
	private int quantity;
	@Column(name="vlprice")
	private double price;
	
	
	
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
	public PurchaseItem() {
		super();
	}
	public PurchaseItemPK getPurchaseItemPK() {
		return purchaseItemPK;
	}
	public void setPurchaseItemPK(PurchaseItemPK purchaseItemPK) {
		this.purchaseItemPK = purchaseItemPK;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
	@Override
	public String toString() {
		return "PurchaseItem [purchaseItemPK=" + purchaseItemPK + ", productName=" + productName + ", quantity="
				+ quantity + ", price=" + price + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((purchaseItemPK == null) ? 0 : purchaseItemPK.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PurchaseItem other = (PurchaseItem) obj;
		if (purchaseItemPK == null) {
			if (other.purchaseItemPK != null)
				return false;
		} else if (!purchaseItemPK.equals(other.purchaseItemPK))
			return false;
		return true;
	}
	
	
	
	
	
}
