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


@Entity
@Table(name = "purchaseorder")
public class PurchaseOrder implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name ="idClient", referencedColumnName="document")
	private Client client;
	@Column(name="dsaddress")
	private String address;
	@Column(name="dsemail")
	private String email;
	@Column(name="dsphone")
	private String phone;
	
	@Transient
	private OrderStatus orderStatus;
	
	@Column(name="dsstatus")
	private String statusDescription; 
	
	@OneToMany(mappedBy="purchaseItemPK.purchaseOrder",fetch=FetchType.EAGER)
	private List<PurchaseItem> items;
	
	@Column(name="dstrack_guide")
	private String trackGuide;
	
	@Column(name="dsshipping_carrier")
	private String shippingCarrier;
	
	@Column(name = "date_created", insertable = false, updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateOrder;
	
	@Column(name = "date_created", insertable = false, updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateUpdated;
	
	
	
	public String getShippingCarrier() {
		return shippingCarrier;
	}

	public void setShippingCarrier(String shippingCarrier) {
		this.shippingCarrier = shippingCarrier;
	}

	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
		this.statusDescription = orderStatus.getName();
	}

	public String getStatusDescription() {
		return statusDescription;
	}

	public void setStatusDescription(String statusDescription) {
		this.statusDescription = statusDescription;
	}

	public String getTrackGuide() {
		return trackGuide;
	}

	public void setTrackGuide(String trackGuide) {
		this.trackGuide = trackGuide;
	}

	public Date getDateOrder() {
		return dateOrder;
	}

	public void setDateOrder(Date dateOrder) {
		this.dateOrder = dateOrder;
	}

	public Date getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public List<PurchaseItem> getItems() {
		return items;
	}

	public void setItems(List<PurchaseItem> items) {
		this.items = items;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
		

	

	@Override
	public String toString() {
		return "PurchaseOrder [id=" + id + ", client=" + client + ", address=" + address + ", email=" + email
				+ ", phone=" + phone + ", orderStatus=" + orderStatus + ", stateDescription=" + statusDescription
				+ ", items=" + items + ", trackGuide=" + trackGuide + ", shippingCarrier=" + shippingCarrier
				+ ", dateOrder=" + dateOrder + ", dateUpdated=" + dateUpdated + "]";
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
		PurchaseOrder other = (PurchaseOrder) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
	
	

}
