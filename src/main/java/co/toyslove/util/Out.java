package co.toyslove.util;

import java.time.ZoneId;
import java.time.ZonedDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import co.toyslove.model.ShoppingCart;

@Component
public class Out {
	
	@Autowired
	ShoppingCart shoppingCart;
	
	
	public void print(Object objectToPrint) {
		ZonedDateTime now = ZonedDateTime.now(ZoneId.of("-05:00"));
		System.out.println(shoppingCart.toObjectString()+"--"+now+" -- "+objectToPrint.toString());
	}
	
	public void main(String[] args) {
		print("something");
	}

}
