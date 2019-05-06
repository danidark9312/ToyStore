package co.toyslove.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.toyslove.entity.Product;
import co.toyslove.model.ShoppingCart;
import co.toyslove.model.ShoppingItem;
import co.toyslove.service.CategoryService;
import co.toyslove.service.ProductServices;
import co.toyslove.viewmodel.Response;

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
	
	@GetMapping("item/{id}")
	public String showDetailItem(Model model,@PathVariable int id) {
		Product product = productServices.findById(id);
		model.addAttribute(product);
		return "itemDetails";
	}
	
	

}
