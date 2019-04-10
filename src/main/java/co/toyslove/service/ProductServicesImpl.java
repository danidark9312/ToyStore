package co.toyslove.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.toyslove.entity.Product;
import co.toyslove.repository.ProductRepository;

@Service
public class ProductServicesImpl implements ProductServices{
	@Autowired
	ProductRepository productRepository;
	
	public List<Product> findAll(){
		return productRepository.findAll();
	}
	
	public void save(Product product) {
		productRepository.save(product);
	}
	
	public Product findById(int id) {
		return productRepository.findById(id).orElse(null);
	}


}
