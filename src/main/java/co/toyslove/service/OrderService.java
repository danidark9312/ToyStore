package co.toyslove.service;

import java.util.List;

import co.toyslove.entity.PurchaseOrder;

public interface OrderService {

	List<PurchaseOrder> findAll();

	PurchaseOrder findById(int id);

	PurchaseOrder findByIdAndClient(int id, String document);

}
