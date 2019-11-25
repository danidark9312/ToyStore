package co.toyslove.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import co.toyslove.entity.Product;
import co.toyslove.entity.ProductType;

public interface ProductsTypeRepository extends JpaRepository<ProductType, Integer>,JpaSpecificationExecutor<Product>{
	public List<ProductType> findAll();
}
