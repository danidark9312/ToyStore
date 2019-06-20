package co.toyslove.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import co.toyslove.entity.PurchaseOrder;

public interface PurchaseOrderRepository extends JpaRepository<PurchaseOrder, Integer>{
	
	public Optional<PurchaseOrder> findByIdAndClientDocument(int id, String document);
	
	
}
