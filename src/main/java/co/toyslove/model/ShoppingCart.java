package co.toyslove.model;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import co.toyslove.entity.Client;
import co.toyslove.entity.Product;
import co.toyslove.entity.PurchaseOrder;

@Component
@Scope(value = "session",proxyMode=ScopedProxyMode.TARGET_CLASS)
public class ShoppingCart {
	private List<ShoppingItem> shoppingItems;
	private Client client;
	private PurchaseOrder purchaseOrder;
	
	

	public PurchaseOrder getPurchaseOrder() {
		return purchaseOrder;
	}

	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public List<ShoppingItem> getShoppingItems() {
		return shoppingItems;
	}

	public void setShoppingItems(List<ShoppingItem> shoppingItems) {
		this.shoppingItems = shoppingItems;
	}

	public int getItemsCount() {
		return shoppingItems==null?0
				:shoppingItems.stream().mapToInt(ShoppingItem::getCount).sum()
				;
	}

	public void addItem(ShoppingItem shoppingItem) {
		if(this.shoppingItems == null)
			this.shoppingItems = new LinkedList<>();
		
		Optional<ShoppingItem> findAny = this.shoppingItems
		.stream()
		.filter(item->item.getProduct().equals(shoppingItem.getProduct()) )
		.findAny();
		
		if(!isInCartProduct(shoppingItem)) {
			this.shoppingItems.add(shoppingItem);	
		}
		
		
		
				
	}
	
	private boolean isInCartProduct(ShoppingItem shoppingItem) {
		Optional<ShoppingItem> findAny = this.shoppingItems
				.stream()
				.filter(item->{
					if(item.getProduct().equals(shoppingItem.getProduct())) {
						if(item.getSize()==shoppingItem.getSize())
							return true;
						else
							return false;
					}else
						return false;	
				}) 
				.findAny();
		
		if(findAny.isPresent()) {
			findAny.get().addCant(shoppingItem.getCount());
			return true;
		}else 
			return false;	
	}

	

	@Override
	public String toString() {
		return "ShoppingCart [shoppingItems=" + shoppingItems + ", client=" + client + ", purchaseOrder="
				+ purchaseOrder + "]";
	}
	
	
	public String toObjectString() {
		return super.toString();
	}

	public void removeProduct(Product product) {
		this.shoppingItems.removeIf(si->si.getProduct().equals(product));
	}

	public void cleanProductsZeroCant() {
		if(this.shoppingItems==null || this.getShoppingItems().size() ==0)
			return;
		for(int i=0;i<shoppingItems.size();i++) {
			ShoppingItem shoppingItem = shoppingItems.get(i);
			if(shoppingItem.getCount()<1) {
				shoppingItems.remove(i);
				i--;
			}
		}
		
	}

	public void clear() {
		this.client = null;
		this.purchaseOrder = null;
		if(this.shoppingItems!=null)
			this.shoppingItems.clear();
	}
	
	


}
