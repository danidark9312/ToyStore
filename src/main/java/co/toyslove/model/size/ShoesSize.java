package co.toyslove.model.size;

public enum ShoesSize implements Size{

	T37(37)
	,T38(38)
	,T39(39)
	,T40(40)
	,T41(41)
	,T42(42)
	;
	
	double size;
	
	private ShoesSize(double size) {
		this.size = size;
	}
	
	@Override
	public Object[] getValues() {
		return values();
	}
	
	@Override
	public String toString() {
		return String.valueOf(size);
	}

}
