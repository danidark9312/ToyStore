package co.toyslove.model;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

@Component
@Scope(value = "session",proxyMode=ScopedProxyMode.TARGET_CLASS)
public class ShoppingCart {
	private int itemsCount;

	public int getItemsCount() {
		return itemsCount;
	}

	public void setItemsCount(int itemsCount) {
		this.itemsCount = itemsCount;
	}

	public void addItem() {
		this.itemsCount++;
		
	}

	@Override
	public String toString() {
		return "ShoppingCart [itemsCount=" + itemsCount + "]";
	}
	
	

}
