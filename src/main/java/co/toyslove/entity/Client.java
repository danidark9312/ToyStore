package co.toyslove.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="clients")
public class Client {
	
	@Id
	private String document;
	@Column(name = "dsname")
	private String name;
	@Column(name = "dslast_name")
	private String lastName;
	@Column(name = "dsaddress")
	private String address;
	@Column(name = "dsaddress_append")
	private String addressAppend;
	@Column(name = "dscity")
	private String city;
	@ManyToOne
	@JoinColumn(name ="idstate", referencedColumnName="idstate")
	private State state;
	@Column(name = "dsemail")
	private String email;
	@Column(name = "dsphone")
	private String phone;
	@Column(name = "dsaddress_comment")
	private String addressComment;
	@Column(name="dspassword")
	private String password;
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDocument() {
		return document;
	}
	public void setDocument(String document) {
		this.document = document;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressAppend() {
		return addressAppend;
	}
	public void setAddressAppend(String addressAppend) {
		this.addressAppend = addressAppend;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public State getState() {
		return state;
	}
	public void setState(State state) {
		this.state = state;
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
	public String getAddressComment() {
		return addressComment;
	}
	public void setAddressComment(String addressComment) {
		this.addressComment = addressComment;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((document == null) ? 0 : document.hashCode());
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
		Client other = (Client) obj;
		if (document == null) {
			if (other.document != null)
				return false;
		} else if (!document.equals(other.document))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Client [document=" + document + ", name=" + name + ", lastName=" + lastName + ", address=" + address
				+ ", addressAppend=" + addressAppend + ", city=" + city + ", state=" + state + ", email=" + email
				+ ", phone=" + phone + ", addressComment=" + addressComment + "]";
	}
	public boolean isAnonymous() {
		return this.document == null || this.document.trim().equals("");
	}
	
	

}
