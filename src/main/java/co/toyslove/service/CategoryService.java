package co.toyslove.service;

import java.util.List;

import co.toyslove.entity.Category;

public interface CategoryService {

	List<Category> findAll();

	void save(Category Category);

	Category findById(int id);


	void deleteCategory(int idCategory);

	List<Category> findFirstPage();

}
