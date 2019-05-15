package co.toyslove.model.size;

public enum ClothSize implements Size{
	XS,S,M,L,XL,XXL;

	
	@Override
	public Object[] getValues() {
		return values();
	}
}
