package co.toyslove.viewmodel;

public class DatatableResponse<T> extends Response<T>{
	

	public DatatableResponse(T t) {
		super(t);
	}
	
	public static <T>DatatableResponse<T> of(T t){
		return new DatatableResponse<T>(t);
	}
	
	
}
