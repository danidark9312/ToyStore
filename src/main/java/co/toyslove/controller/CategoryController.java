package co.toyslove.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.toyslove.entity.Category;
import co.toyslove.service.CategoryService;
import co.toyslove.util.Util;
import co.toyslove.viewmodel.Response;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	Util util;
	
	@GetMapping("/admin/categories")
	public String showForm(@ModelAttribute Category category) {
		return "categoryForm";
	}
	
	@GetMapping("/admin/categories/{id}")
	public String showForm(Model model,@PathVariable int id) {
		model.addAttribute("category", categoryService.findById(id));
		return "categoryForm";
	}
	
	@GetMapping("/admin/categories/list")
	public String showListForm(Model model) {
		model.addAttribute("categories",categoryService.findAll());
		return "categoryList";
	}
	
	@GetMapping("/categories/list")
	public @ResponseBody List<Category> getProducts() {
		categoryService.findAll();
		return categoryService.findAll();
	}
	
	
	
	@PostMapping("/admin/categories/save")
	public String saveCategory(@ModelAttribute Category category, BindingResult result, Model model,
			@RequestParam("archivoImagen") MultipartFile multiPart, HttpServletRequest request, RedirectAttributes attributes) {
		String imageName = null;
		if (result.hasErrors()){
			System.out.println("Existieron errores");
			
		}	
		
		if (!multiPart.isEmpty()) {
			imageName = util.saveImage(multiPart,request,"categories");
		}
			if (imageName!=null){ 
				category.setImage(imageName);
				
			}
			System.out.println(category);
			categoryService.save(category);
					
		//return "redirect:/peliculas/index";
		return "redirect:/admin/categories/list";
		
	}
	
	@GetMapping("admin/categories/{category}/remove")
	public String remove(@PathVariable("category") int category){
		categoryService.deleteCategory(category);
		return "redirect:/admin/categories/list";
	}
	
	
}
