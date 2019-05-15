package co.toyslove.model;

public enum ProductStatus {
	ENABLE("Y"),DISABLED("N");
	String enable;
	
	ProductStatus(String status) {
		this.enable = status;
	}
	
	public String getStatus() {
		return this.enable;
	}

}
