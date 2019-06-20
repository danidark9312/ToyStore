package co.toyslove.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import co.toyslove.entity.Category;
import co.toyslove.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>,JpaSpecificationExecutor<Product>{
	List<Product> findAllByOrderByIdDesc();
	List<Product> findByCategoryAndEnable(Category category,String status);
}
