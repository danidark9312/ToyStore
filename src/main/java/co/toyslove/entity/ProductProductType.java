package co.toyslove.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;


/**
 * @author daniel
 *
 */
@Entity
@Table(name = "product_producttypes")
public class ProductProductType implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	
	@EmbeddedId
	private ProductProductTypePK productProductTypePK;

	@Column(name="idProductValue")
	private Integer productValue;
	
	public ProductProductTypePK getProductProductTypePK() {
		return productProductTypePK;
	}
	
	

	public Integer getProductValue() {
		return productValue;
	}



	public void setProductValue(Integer productValue) {
		this.productValue = productValue;
	}



	public void setProductProductTypePK(ProductProductTypePK productProductTypePK) {
		this.productProductTypePK = productProductTypePK;
	}

	public ProductProductType(int idProduct, int productType, int productValue) {
		super();
		this.productProductTypePK = new ProductProductTypePK(idProduct, productType);
		this.productValue = productValue;
	}
	public ProductProductType(int productType, int productValue) {
		super();
		this.productProductTypePK = new ProductProductTypePK(null, productType);
		this.productValue = productValue;
	}

	public ProductProductType(ProductProductTypePK productProductTypePK) {
		super();
		this.productProductTypePK = productProductTypePK;
	}

	public ProductProductType() {
		super();
	}



	@Override
	public String toString() {
		return "ProductProductType [productProductTypePK=" + productProductTypePK + "]";
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((productProductTypePK == null) ? 0 : productProductTypePK.hashCode());
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
		ProductProductType other = (ProductProductType) obj;
		if (productProductTypePK == null) {
			if (other.productProductTypePK != null)
				return false;
		} else if (!productProductTypePK.equals(other.productProductTypePK))
			return false;
		return true;
	}



	public void setProductId(int id) {
		this.getProductProductTypePK().setIdProduct(id);
	}
	
	
	public static ProductProductType fromString(String productTypeStr) {
		String[] productType = productTypeStr.split(";");
		int idType = Integer.parseInt(productType[0]);
		int value = Integer.parseInt(productType[1]);
		return new ProductProductType(idType, value);
	}	
	}
