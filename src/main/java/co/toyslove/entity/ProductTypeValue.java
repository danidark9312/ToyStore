package co.toyslove.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="types_value")
public class ProductTypeValue {
	
	@EmbeddedId
	private ProductValuePK productValuePK;
	
	@Column(name="ds_type_value")
	private String typeDescription;

	public ProductValuePK getProductValuePK() {
		return productValuePK;
	}

	public void setProductValuePK(ProductValuePK productValuePK) {
		this.productValuePK = productValuePK;
	}

	public String getTypeDescription() {
		return typeDescription;
	}

	public void setTypeDescription(String typeDescription) {
		this.typeDescription = typeDescription;
	}

	public ProductTypeValue(ProductValuePK productValuePK, String typeDescription) {
		super();
		this.productValuePK = productValuePK;
		this.typeDescription = typeDescription;
	}

	public ProductTypeValue() {
		super();
	}

	@Override
	public String toString() {
		return "ProductTypeValue [productValuePK=" + productValuePK + ", typeDescription=" + typeDescription + "]";
	}
	
	
	
	
	
}
