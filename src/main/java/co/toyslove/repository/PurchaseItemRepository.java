package co.toyslove.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import co.toyslove.entity.PurchaseItem;

public interface PurchaseItemRepository extends JpaRepository<PurchaseItem, Integer>{
	@Query("SELECT coalesce(max(po.purchaseItemPK.productConsecutive), 0) FROM PurchaseItem po where po.purchaseItemPK.purchaseOrder=?1")
	public int getMaxIdForProduct(int poId);
}
