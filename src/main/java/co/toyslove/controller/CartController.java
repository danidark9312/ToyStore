package co.toyslove.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.toyslove.entity.Product;
import co.toyslove.model.ShoppingCart;
import co.toyslove.model.ShoppingItem;
import co.toyslove.service.ProductServices;
import co.toyslove.viewmodel.Response;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	ProductServices productService;
	
	@Autowired
	ShoppingCart shoppingCart;
	
	
	@GetMapping()
	public String showForm(Model model, RedirectAttributes attributes) {
		if(shoppingCart.getShoppingItems()==null || shoppingCart.getShoppingItems().size()==0) {
			attributes.addFlashAttribute("error","No tiene productos en el carrito de compras");
			return "redirect:home";
		}
		else {
			model.addAttribute("shoppingList", shoppingCart.getShoppingItems());
			return "cart";
		}
	}
	
	@GetMapping("list" )
	public @ResponseBody List<ShoppingItem> listShoppingItems() {
		return shoppingCart.getShoppingItems();
	}
	@PostMapping("add" )
	public @ResponseBody Response<Integer> addItem(Model model,@RequestBody ShoppingItem shoppingItem) {
		loadProductCompleteInfo(shoppingItem);
		shoppingCart.addItem(shoppingItem);
		Response<Integer> response = Response.of(shoppingCart.getItemsCount());
		response.setMessage("Operación Exitosa");
		return response;
	}

	@PostMapping("remove" )
	public @ResponseBody Response<Integer> removeItemFromCart(Model model,@RequestBody Product product) {
		shoppingCart.removeProduct(product);
		Response<Integer> response = Response.of(shoppingCart.getItemsCount());
		response.setMessage("Operación Exitosa");
		return response;
	}
	
	@PostMapping("update" )
	public @ResponseBody Response<Integer> updateCart(Model model,@RequestBody List<ShoppingItem> shoppingItems) {
		shoppingCart.setShoppingItems(shoppingItems);
		shoppingCart.cleanProductsZeroCant();
		Response<Integer> response = Response.of(shoppingCart.getItemsCount());
		response.setMessage("Operación Exitosa");
		return response;
	}
	
	
	private void loadProductCompleteInfo(ShoppingItem shoppingItem) {
		Product product = shoppingItem.getProduct();
		if((product.getName()==null || product.getValue() ==0) && product.getId()!=0) {
			shoppingItem.setProduct(productService.findById(product.getId()));
		}
	}
	
}
