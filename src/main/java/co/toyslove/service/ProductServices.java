package co.toyslove.service;

import java.util.List;

import co.toyslove.entity.Product;

public interface ProductServices {
	List<Product> findAll();

	Product findById(int id);


}
