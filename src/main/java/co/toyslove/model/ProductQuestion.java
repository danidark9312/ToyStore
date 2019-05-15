package co.toyslove.model;

import co.toyslove.entity.Product;

public class ProductQuestion {
	private Product product;
	private String question;
	private String userEmail;
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "ProductQuestion [product=" + product + ", question=" + question + ", userEmail=" + userEmail + "]";
	}
	
	
	
	
	
	
}
