package co.toyslove.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.toyslove.model.ShoppingCart;
import co.toyslove.service.CategoryService;

@Controller
public class HomeController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ShoppingCart shoppingCart; 
	
	@RequestMapping({"/home","/"})
	public String showForm(Model model) {
		model.addAttribute("categories",categoryService.findFirstPage());
		model.addAttribute(shoppingCart);
		System.out.println(shoppingCart);
		return "shop";
	}
	
	@GetMapping("/cart/add")
	public @ResponseBody String addItem(Model model) {
		shoppingCart.addItem();
		return "success";
	}

}
