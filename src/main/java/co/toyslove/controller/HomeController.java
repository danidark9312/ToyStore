package co.toyslove.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import co.toyslove.entity.Product;
import co.toyslove.model.ShoppingCart;
import co.toyslove.service.CategoryService;
import co.toyslove.service.ProductServices;

@Controller
public class HomeController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ShoppingCart shoppingCart; 
	
	@Autowired
	ProductServices productServices;
	
	@GetMapping({"/home","/"})
	public String showForm(Model model) {
		model.addAttribute("categories",categoryService.findFirstPage());
		model.addAttribute(shoppingCart);
		return "shop";
	}
	
	
	
	

}
