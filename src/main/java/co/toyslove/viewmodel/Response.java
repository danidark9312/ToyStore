package co.toyslove.viewmodel;

public class Response<T> {
	T data;
	String message;
	
	protected Response(T t,String message) {
		this.data = t;
		this.message = message;
	}
	
	
	public Response(String message) {
		super();
		this.message = message;
	}



	protected Response(T t) {
		this(t,null);
	}
	
	public static <T>Response<T> of(T t){
		return new Response<T>(t);
	}
	
	public static <T>Response<T> ofMessage(String message){
		return new Response<T>(message);
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
