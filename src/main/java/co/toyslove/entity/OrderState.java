package co.toyslove.entity;

public enum OrderState {
	PENDIENTE_APROBACION("PENDIENTE DE APROBACIÓN");

	
	private String name;
	
	OrderState(String name){
		this.name = name;
	}
	
	String getName(){
		return this.name;
	}
	
	@Override
	public String toString() {
		return this.name;
	};
	
	
}
