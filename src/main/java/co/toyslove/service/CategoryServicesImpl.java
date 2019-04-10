package co.toyslove.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.toyslove.entity.Category;
import co.toyslove.repository.CategoryRepository;

@Service
public class CategoryServicesImpl implements CategoryService{
	@Autowired
	CategoryRepository CategoryRepository;
	
	public List<Category> findAll(){
		return CategoryRepository.findAll();
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
