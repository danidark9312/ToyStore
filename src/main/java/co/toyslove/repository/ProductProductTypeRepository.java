package co.toyslove.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import co.toyslove.entity.ProductProductType;
import co.toyslove.entity.ProductProductTypePK;

public interface ProductProductTypeRepository extends JpaRepository<ProductProductType, ProductProductTypePK>,JpaSpecificationExecutor<ProductProductType>{
	public List<ProductProductType> findAll();
	@Transactional
	@Modifying
	@Query("delete from ProductProductType where productProductTypePK.idProduct = ?1")
	public void deleteByProduct(int idProduct);
	
}
