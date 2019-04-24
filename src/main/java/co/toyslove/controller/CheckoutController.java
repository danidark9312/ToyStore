package co.toyslove.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.toyslove.entity.Client;
import co.toyslove.model.ShoppingCart;
import co.toyslove.service.ClientService;
import co.toyslove.util.EmailSender;
import co.toyslove.viewmodel.Response;

@Controller
@RequestMapping("checkout")
public class CheckoutController {
	
	@Autowired
	ShoppingCart shoppingCart;
	
	@Autowired
	ClientService clientService;
	
	@Autowired
	EmailSender emailSender;
	
	@RequestMapping()
	public String showForm(Model model, RedirectAttributes attributes) {
		if(shoppingCart.getShoppingItems()==null || shoppingCart.getShoppingItems().size()==0) {
			attributes.addFlashAttribute("error","No tiene productos en el carrito de compras");
			return "redirect:home";
		}else {
			model.addAttribute("shoppingList", shoppingCart.getShoppingItems());
			return "checkout";	
		}
	}
	
	@RequestMapping("thankyou")
	public String showFormThankYou(Model model) {
		emailSender.sendCheckoutOrder(shoppingCart);
		shoppingCart.clear();
		return "thankyou";
	}
	
	@GetMapping("email")
	public @ResponseBody Response<String> email() {
		emailSender.sendTest();
		return Response.ofMessage("success");
	}
		
}
