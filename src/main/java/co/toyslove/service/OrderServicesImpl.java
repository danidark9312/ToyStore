package co.toyslove.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import co.toyslove.entity.Product;
import co.toyslove.entity.PurchaseOrder;
import co.toyslove.model.ShopFilter;
import co.toyslove.repository.ProductRepository;
import co.toyslove.repository.PurchaseOrderRepository;

@Service
public class OrderServicesImpl implements OrderService{
	@Autowired
	PurchaseOrderRepository purchaseOrderRepository;
	
	public List<PurchaseOrder> findAll(){
		return purchaseOrderRepository.findAll();
	}
	
	public PurchaseOrder findById(int id) {
		return purchaseOrderRepository.findById(id).orElse(null);
	}
	
	public PurchaseOrder findByIdAndClient(int id,String document) {
		return purchaseOrderRepository.findByIdAndClientDocument(id,document).orElse(null);
	}
	
	
	


}
