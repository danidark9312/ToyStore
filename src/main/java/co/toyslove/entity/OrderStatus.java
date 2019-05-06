package co.toyslove.entity;

public enum OrderStatus {
	PENDIENTE_APROBACION("PENDIENTE DE APROBACIÓN"),
	APROBADA("ORDEN APROBADA"),
	ENVIADA("ENVÍO REALIZADO"),
	FINALIZADA("ORDEN ENTREGADA");

	
	private String name;
	
	OrderStatus(String name){
		this.name = name;
	}
	
	public String getName(){
		return this.name;
	}
	
	@Override
	public String toString() {
		return this.name;
	};
	
	
	
	
}
