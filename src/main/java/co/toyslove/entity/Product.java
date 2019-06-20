package co.toyslove.entity;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "products")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	private int value;
	private int value_prev;
	private String image;
	private int stars;
	private int stock;

	@Column(name = "ds_sizes")
	private String joinedSizes;

	@Transient
	private String[] sizeArray;

	@Column(name = "yn_enable")
	private String enable;

	@Column(name = "ds_ribbon")
	private String ribbon;

	@Transient
	private String[] sizes;

	@Transient
	private boolean inCart;

	@Transient
	private int qntyInCart;
	
	@Transient
	private boolean imageModified;

	@Transient
	private boolean invisible; // Used to define wether or not is shown in store(filters, pagination, etc)

	@ManyToOne()
	@JoinColumn(name = "category", referencedColumnName = "id")
	
	
	
	private Category category;
	
	public boolean isImageModified() {
		return imageModified;
	}

	public void setImageModified(boolean imageModified) {
		this.imageModified = imageModified;
	}

	public int getValue_prev() {
		return value_prev;
	}

	public void setValue_prev(int value_prev) {
		this.value_prev = value_prev;
	}

	public String getRibbon() {
		return ribbon;
	}

	public void setRibbon(String ribbon) {
		this.ribbon = ribbon;
	}

	public String getJoinedSizes() {
		return joinedSizes;
	}

	public void setJoinedSizes(String joinedSizes) {
		this.joinedSizes = joinedSizes;
		if (joinedSizes != null && joinedSizes.length() > 0)
			this.sizeArray = joinedSizes.split(";");
	}

	public String[] getSizeArray() {
		if (sizeArray == null && joinedSizes != null && joinedSizes.length() > 0)
			this.sizeArray = joinedSizes.split(";");
		return sizeArray;
	}

	public void setSizeArray(String[] sizeArray) {
		this.sizeArray = sizeArray;
		this.joinedSizes = String.join(";", sizeArray);
	}

	public String[] getSizes() {
		return sizes;
	}

	public void setSizes(String[] sizes) {
		this.sizes = sizes;
	}

	public String getEnable() {
		return enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
	}

	public int getQntyInCart() {
		return qntyInCart;
	}

	public void setQntyInCart(int qntyInCart) {
		this.qntyInCart = qntyInCart;
	}

	public boolean isInvisible() {
		return invisible;
	}

	public void setInvisible(boolean invisible) {
		this.invisible = invisible;
	}

	public boolean isInCart() {
		return inCart;
	}

	public void setInCart(boolean inCart) {
		this.inCart = inCart;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Product() {
		super();
	}

	public Product(int id, String name, String description, int value, String image, int stars) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.value = value;
		this.image = image;
		this.stars = stars;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}

	

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", value=" + value
				+ ", value_prev=" + value_prev + ", image=" + image + ", stars=" + stars + ", stock=" + stock
				+ ", joinedSizes=" + joinedSizes + ", sizeArray=" + Arrays.toString(sizeArray) + ", enable=" + enable
				+ ", ribbon=" + ribbon + ", sizes=" + Arrays.toString(sizes) + ", inCart=" + inCart + ", qntyInCart="
				+ qntyInCart + ", imageModified=" + imageModified + ", invisible=" + invisible + ", category="
				+ category + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		Product other = (Product) obj;
		if (id != other.id)
			return false;
		return true;
	}

}
