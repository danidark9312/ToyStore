package co.toyslove.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.toyslove.entity.Category;
import co.toyslove.entity.Product;
import co.toyslove.repository.CategoryRepository;
import co.toyslove.repository.ProductRepository;

@Service
public class CategoryServicesImpl implements CategoryService{
	@Autowired
	CategoryRepository CategoryRepository;
	@Autowired
	ProductRepository productRepository;
	
	public List<Category> findAll(){
		return CategoryRepository.findAll();
	}
	public List<Category> findFirstPage(){
		return CategoryRepository.findByFirstPageTrueOrderByPriorityAsc();
	}
	
	public void mergeItemsQuantity(List<Category> categories){
		categories.forEach(category->{
			List<Product> productsInCategory = productRepository.findByCategoryAndEnable(category, "Y");
			category.setItems(productsInCategory.size());
		});
	}
	
	public void save(Category Category) {
		CategoryRepository.save(Category);
	}
	
	public Category findById(int id) {
		return CategoryRepository.findById(id).orElse(null);
	}
	
	public void deleteCategory(int idCategory) {
		CategoryRepository.delete(new Category(idCategory));
	}
	

}
