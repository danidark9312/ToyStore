package co.toyslove.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import co.toyslove.entity.Product;
import co.toyslove.entity.ProductProductType;
import co.toyslove.entity.ProductType;
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
		
		List<Product> products = productRepository.findAll(new Specification<Product>() {
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
		products = filterTypeProducts(products,shopFilter);
		return products;
	}
	
	private List<Product> filterTypeProducts(List<Product> products,ShopFilter filter) {
		String[] strProductType = filter.getStrProductType();
		if(strProductType == null || strProductType.length == 0)
			return products;
		List<Product> filteredList = products
			.stream()
			.filter(product->{
				boolean productAccepted = false;
				for (String productType : strProductType) {
					ProductProductType selectedProductProductType = ProductProductType.fromString(productType);
					if(selectedProductProductType.getProductValue() == 0) //It means TODOS was selected
						return true;
					for(ProductProductType productProductType : product.getProductProductTypes()) {
						if(productProductType.getProductProductTypePK().getProductType() == selectedProductProductType.getProductProductTypePK().getProductType() &&
						   productProductType.getProductValue() == selectedProductProductType.getProductValue())
							productAccepted = true;
					}
				}
				return productAccepted;
			}).collect(Collectors.toList());
		
		return filteredList;
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
