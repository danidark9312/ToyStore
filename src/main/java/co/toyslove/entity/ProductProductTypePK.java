package co.toyslove.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Embeddable
public class ProductProductTypePK implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name="idProduct")
	private Integer idProduct;
	

	@Column(name="idProductType")
	private Integer productType;

	public Integer getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(Integer idProduct) {
		this.idProduct = idProduct;
	}

	public Integer getProductType() {
		return productType;
	}

	public void setProductType(Integer productType) {
		this.productType = productType;
	}


	public ProductProductTypePK(Integer idProduct, Integer productType) {
		super();
		this.idProduct = idProduct;
		this.productType = productType;
	}
	
	
	public ProductProductTypePK() {
		super();
	}
	
	
	
}
