package co.toyslove.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import co.toyslove.entity.Product;
import co.toyslove.entity.PurchaseItem;
import co.toyslove.entity.PurchaseItemPK;
import co.toyslove.entity.PurchaseOrder;
import co.toyslove.model.ShopFilter;
import co.toyslove.repository.ProductRepository;
import co.toyslove.repository.PurchaseItemRepository;
import co.toyslove.repository.PurchaseOrderRepository;

@Service
public class PurchaseOrderServicesImpl implements PurchaseOrderService{
	@Autowired
	PurchaseOrderRepository purchaseOrderRepository;
	
	@Autowired
	PurchaseItemRepository purchaseItemRepository;
	
	public List<PurchaseOrder> findAll(){
		return purchaseOrderRepository.findAll();
	}
	
	public PurchaseOrder findById(int id) {
		return purchaseOrderRepository.findById(id).orElse(null);
	}
	
	public PurchaseOrder findByIdAndClient(int id,String user) {
		return purchaseOrderRepository.findByIdAndClientDocument(id,user).orElse(null);
	}
	
	
	public PurchaseOrder savePurchaseOrder(PurchaseOrder order) {
		if(order.getClient().isAnonymous())
			order.setClient(null);
		PurchaseOrder po = purchaseOrderRepository.save(order);
		List<PurchaseItem> itemsDB = order.getItems().stream()
				.peek(item->{
					int maxIdForProduct = purchaseItemRepository.getMaxIdForProduct(po.getId());
					item.setPurchaseItemPK(new PurchaseItemPK(maxIdForProduct+1,po.getId()));})
				.map(purchaseItemRepository::save)
				.collect(Collectors.toList());
		po.setItems(itemsDB);	
		
		return po;
	}
	
	public PurchaseOrder updatePurchaseOrder(PurchaseOrder order) {
		PurchaseOrder po = purchaseOrderRepository.save(order);
		return po;
	}
	


}
