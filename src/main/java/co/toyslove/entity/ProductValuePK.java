package co.toyslove.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Embeddable
public class ProductValuePK implements Serializable{
	
	@Column(name="id_type_product")
	private int productType;
	

	@Column(name="id_type_value")
	private int productValue;


	public int getProductType() {
		return productType;
	}


	public void setProductType(int productType) {
		this.productType = productType;
	}


	public int getProductValue() {
		return productValue;
	}


	public void setProductValue(int productValue) {
		this.productValue = productValue;
	}


	public ProductValuePK(int productType, int productValue) {
		super();
		this.productType = productType;
		this.productValue = productValue;
	}


	public ProductValuePK() {
		super();
	}


	@Override
	public String toString() {
		return "ProductValuePK [productType=" + productType + ", productValue=" + productValue + "]";
	}

	
	
}
