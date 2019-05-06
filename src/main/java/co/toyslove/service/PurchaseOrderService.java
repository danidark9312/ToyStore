package co.toyslove.service;

import java.util.List;

import co.toyslove.entity.PurchaseOrder;

public interface PurchaseOrderService {

	List<PurchaseOrder> findAll();

	PurchaseOrder findById(int id);

	PurchaseOrder findByIdAndClient(int id, String document);
	
	PurchaseOrder savePurchaseOrder(PurchaseOrder order);

	PurchaseOrder updatePurchaseOrder(PurchaseOrder order);

}
