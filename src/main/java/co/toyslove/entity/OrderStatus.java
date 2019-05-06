package co.toyslove.entity;

public enum OrderStatus {
	PENDIENTE_APROBACION("PENDIENTE DE APROBACI�N"),
	APROBADA("ORDEN APROBADA"),
	ENVIADA("ENV�O REALIZADO"),
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
