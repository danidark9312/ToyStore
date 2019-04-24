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

import co.toyslove.entity.Product;
import co.toyslove.model.ShopFilter;
import co.toyslove.model.ShoppingCart;
import co.toyslove.model.ShoppingItem;
import co.toyslove.service.CategoryService;
import co.toyslove.service.ProductServicesImpl;
import co.toyslove.util.Util;
import co.toyslove.viewmodel.Response;

@Controller
public class ProductController {
	
	@Autowired
	ProductServicesImpl productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ShoppingCart shoppingCart;
	
	@Autowired
	Util util;
	
	@GetMapping("/admin/products")
	public String showForm(@ModelAttribute Product product,Model model) {
		model.addAttribute("categories", categoryService.findAll());
		return "productForm";
	}
	
	@GetMapping("/admin/products/{id}")
	public String showForm(Model model,@PathVariable int id) {
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("product", productService.findById(id));
		return "productForm";
	}
	
	@GetMapping("/admin/products/list")
	public String showListForm(Model model) {
		model.addAttribute("products",productService.findAll());
		return "productList";
	}

	@GetMapping("/products/list")
	public @ResponseBody List<Product> getProducts(ShopFilter shopFilter) {
		List<Product> products = productService.findByFilter(shopFilter);
		markItemsInCart(products);
		return products;
	}
	
	
	
	@PostMapping("/admin/products/save")
	public String saveProduct(@ModelAttribute Product product, BindingResult result, Model model,
			@RequestParam("archivoImagen") MultipartFile multiPart, HttpServletRequest request, RedirectAttributes attributes) {
		String imageName = null;
		if (result.hasErrors()){
			System.out.println("Existieron errores");
			return "peliculas/formPelicula";
		}	
		
		if (!multiPart.isEmpty()) {
			imageName = util.saveImage(multiPart,request,"products");
		}
			if (imageName!=null){ 
				product.setImage(imageName);
				
			}
			System.out.println(product);
			productService.save(product);
					
		//return "redirect:/peliculas/index";
		return "redirect:/admin/products/list";
		
	}
	
	@DeleteMapping("/remove")
	public @ResponseBody Response<List<Product>> remove(@RequestBody Product cliente) {
		/*clienteService.deleteCliente(cliente);
		return Response.ofMessage("Cliente eliminado con éxito");*/
		return null;
	}
	
	private void markItemsInCart(List<Product> products) {
		if(shoppingCart.getShoppingItems() == null)
			return;
		
		products.forEach(product->{
			boolean isInCart = shoppingCart.getShoppingItems()
				.stream()
				.map(ShoppingItem::getProduct)
				.anyMatch(p->p.equals(product))
				;
			product.setInCart(isInCart);
		});
		
	}
	
	
}
