package co.toyslove.service;

import java.util.List;

import co.toyslove.entity.Product;
import co.toyslove.entity.ProductProductType;
import co.toyslove.entity.ProductType;

public interface ProductTypeService {
	List<ProductType> findAll();
	ProductProductType saveProductProductType(ProductProductType productProductType);
	void saveProductProductTypes(List<ProductProductType> productProductType);
	void removeByProduct(Product product);


}
