package co.toyslove.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.toyslove.entity.Product;
import co.toyslove.entity.ProductProductType;
import co.toyslove.entity.ProductType;
import co.toyslove.repository.ProductProductTypeRepository;
import co.toyslove.repository.ProductsTypeRepository;

@Service
public class ProductTypeServicesImpl implements ProductTypeService{
	@Autowired
	ProductsTypeRepository productTypeRepository;
	
	@Autowired
	ProductProductTypeRepository productProductTypeRepository;
	
	public List<ProductType> findAll(){
		return productTypeRepository.findAll();
	}

	@Override
	public ProductProductType saveProductProductType(ProductProductType productProductType) {
		return productProductTypeRepository.save(productProductType);
	}
	
	@Override
	public void removeByProduct(Product product) {
		productProductTypeRepository.deleteByProduct(product.getId());
	}
	@Override
	public void saveProductProductTypes(List<ProductProductType> productProductTypes){
		productProductTypes.forEach(productProductType->{
			productProductTypeRepository.save(productProductType);	
		});
		
	}

}
