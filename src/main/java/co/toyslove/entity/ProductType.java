package co.toyslove.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
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
@Table(name = "type_product")
public class ProductType implements Serializable{

	@Id
	@Column(name = "id_type")
	private int id;
	
	@OneToMany(mappedBy="productValuePK.productType",fetch=FetchType.EAGER)
	private List<ProductTypeValue> values;
	
	@Column(name="ds_type")
	private String typeDescription;
	
	@Column(name="yn_enable")
	private String enable;
	
	@Transient
	private int valueSelected;

	public int getValueSelected() {
		return valueSelected;
	}
	
	
	public void setValueSelected(int valueSelected) {
		this.valueSelected = valueSelected;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<ProductTypeValue> getValues() {
		return values;
	}

	public void setValues(List<ProductTypeValue> values) {
		this.values = values;
	}

	public String getTypeDescription() {
		return typeDescription;
	}

	public void setTypeDescription(String typeDescription) {
		this.typeDescription = typeDescription;
	}

	public String getEnable() {
		return enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
	}

	public ProductType(int id, List<ProductTypeValue> values, String typeDescription, String enable) {
		super();
		this.id = id;
		this.values = values;
		this.typeDescription = typeDescription;
		this.enable = enable;
	}

	public ProductType() {
		super();
	}


	@Override
	public String toString() {
		return "ProductType [id=" + id + ", values=" + values + ", typeDescription=" + typeDescription + ", enable="
				+ enable + ", valueSelected=" + valueSelected + "]";
	}


}
