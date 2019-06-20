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
import co.toyslove.model.ShopFilter;
import co.toyslove.repository.ProductRepository;

@Service
public class ProductServicesImpl implements ProductServices{
	@Autowired
	ProductRepository productRepository;
	
	public List<Product> findAll(){
		return productRepository.findAllByOrderByIdDesc();
	}
	public List<Product> findByFilter(ShopFilter shopFilter){
		return productRepository.findAll(new Specification<Product>() {
			@Override
			public Predicate toPredicate(Root<Product> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<>();
				if(shopFilter.getCategoryId()!=0) {
					predicates.add(cb.and(cb.equal(root.get("category").get("id"),shopFilter.getCategoryId())));
				}
				if(shopFilter.getPriceMin()!=0 && shopFilter.getPriceMax()!=0) {
					predicates.add(cb.between(root.get("value"),shopFilter.getPriceMin(),shopFilter.getPriceMax()));
				}
				if(shopFilter.getRibbon()!=null && !shopFilter.getRibbon().equals("")) {
					predicates.add(cb.and(cb.equal(root.get("ribbon"),shopFilter.getRibbon())));
				}
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		});
	}
	
	public void save(Product product) {
		productRepository.save(product);
	}
	public void remove(Product product) {
		productRepository.delete(product);
	}
	
	public Product findById(int id) {
		return productRepository.findById(id).orElse(null);
	}


}
