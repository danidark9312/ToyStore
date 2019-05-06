package co.toyslove.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Embeddable
public class PurchaseItemPK implements Serializable{
	@Column(name="product_consecutive")
	private int productConsecutive;
	

	@Column(name="idpurchase_order")
	private Integer purchaseOrder;

	public PurchaseItemPK(int consecutive ,Integer purchaseOrder) {
		this.productConsecutive = consecutive;
		this.purchaseOrder = purchaseOrder;
	}
	public PurchaseItemPK() {
		super();
	}

	public int getProductConsecutive() {
		return productConsecutive;
	}

	public void setProductConsecutive(int productConsecutive) {
		this.productConsecutive = productConsecutive;
	}

	public Integer getPurchaseOrder() {
		return purchaseOrder;
	}

	public void setPurchaseOrder(Integer purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + productConsecutive;
		result = prime * result + ((purchaseOrder == null) ? 0 : purchaseOrder.hashCode());
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
		PurchaseItemPK other = (PurchaseItemPK) obj;
		if (productConsecutive != other.productConsecutive)
			return false;
		if (purchaseOrder == null) {
			if (other.purchaseOrder != null)
				return false;
		} else if (!purchaseOrder.equals(other.purchaseOrder))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "PurchaseItemPK [productConsecutive=" + productConsecutive + ", purchaseOrder=" + purchaseOrder + "]";
	}
	
	
	

}
