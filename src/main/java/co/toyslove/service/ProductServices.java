package co.toyslove.service;

import java.util.List;

import co.toyslove.entity.Product;
import co.toyslove.model.ShopFilter;

public interface ProductServices {
	List<Product> findAll();

	Product findById(int id);

	List<Product> findByFilter(ShopFilter shopFilter);

	void remove(Product product);


}
