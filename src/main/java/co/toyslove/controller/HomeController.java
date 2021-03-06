package co.toyslove.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import co.toyslove.entity.Category;
import co.toyslove.entity.Product;
import co.toyslove.model.Ribbon;
import co.toyslove.model.ShoppingCart;
import co.toyslove.service.CategoryService;
import co.toyslove.service.ProductServices;
import co.toyslove.service.ProductTypeService;
import co.toyslove.util.Util;

@Controller
public class HomeController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ShoppingCart shoppingCart; 
	
	@Autowired
	ProductServices productServices;
	
	@Autowired
	ProductTypeService productTypeService;
	
	@Autowired
	Util util;
	
	@GetMapping({"/","/store"})
	public String showForm(Model model) {
		List<Category> categories = categoryService.findFirstPage();
		categoryService.mergeItemsQuantity(categories);
		model.addAttribute("categories",categories);
		model.addAttribute("ribbons",Ribbon.asList());
		model.addAttribute("productTypes",productTypeService.findAll());
		model.addAttribute(shoppingCart);
		return "shop";
	}
	
	@GetMapping("/home")
	public String showHome(Model model) {
		List<Category> categories = categoryService.findFirstPage();
		model.addAttribute("categories",categories);
		return "home";
	}
	
	@GetMapping("/generateSmallImages")
	public String generateSmallImages() {
		try {
			util.generateSmallImages();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	
	
	

}
