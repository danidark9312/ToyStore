package co.toyslove.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.toyslove.entity.PurchaseItem;
import co.toyslove.entity.PurchaseItemPK;
import co.toyslove.entity.PurchaseOrder;
import co.toyslove.repository.PurchaseItemRepository;
import co.toyslove.repository.PurchaseOrderRepository;

@Service
public class PurchaseOrderServicesImpl implements PurchaseOrderService{
	@Autowired
	PurchaseOrderRepository purchaseOrderRepository;
	@Autowired
	PurchaseItemRepository purchaseItemRepository;
	
	public PurchaseOrder savePurchaseOrder(PurchaseOrder order) {
		PurchaseOrder po = purchaseOrderRepository.save(order);
		List<PurchaseItem> itemsDB = order.getItems().stream()
				.peek(item->{
					int maxIdForProduct = purchaseItemRepository.getMaxIdForProduct(po.getId());
					item.setPurchaseItemPK(new PurchaseItemPK(maxIdForProduct+1,po));})
				.map(purchaseItemRepository::save)
				.collect(Collectors.toList());
		po.setItems(itemsDB);
		return po;
	}
}
