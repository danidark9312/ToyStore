package co.toyslove.model;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public enum Ribbon {
	NUEVO, OFERTA, LIMITADO;

	public static List<String> asList() {
		return Stream.of(Ribbon.values()).map(Ribbon::name).collect(Collectors.toList());		
	}

}
