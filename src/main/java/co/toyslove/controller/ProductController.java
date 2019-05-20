package co.toyslove.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
import co.toyslove.entity.PurchaseOrder;
import co.toyslove.model.ProductQuestion;
import co.toyslove.model.ProductStatus;
import co.toyslove.model.ShopFilter;
import co.toyslove.model.ShoppingCart;
import co.toyslove.model.ShoppingItem;
import co.toyslove.model.size.ClothSize;
import co.toyslove.model.size.ShoesSize;
import co.toyslove.model.size.Size;
import co.toyslove.service.CategoryService;
import co.toyslove.service.ProductServicesImpl;
import co.toyslove.util.EmailSender;
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
	EmailSender emailSender;
	
	@Autowired
	Util util;
	
	@GetMapping("item/{id}")
	public String showDetailItem(Model model,@PathVariable int id) {
		Product product = productService.findById(id);
		model.addAttribute(product);
		return "productDetails";
	}
	
	@GetMapping("/admin/products")
	public String showForm(@ModelAttribute Product product,Model model) {
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("sizes", getSizesAsList());
		return "productForm";
	}
	

	@GetMapping("/admin/products/{id}")
	public String showForm(Model model,@PathVariable int id) {
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("product", productService.findById(id));
		model.addAttribute("sizes", getSizesAsList());
		return "productForm";
	}
	
	@GetMapping("/admin/products/list")
	public String showListForm(Model model) {
		model.addAttribute("products",productService.findAll());
		return "productList";
	}

	@GetMapping("/products/list")
	public @ResponseBody List<Product> getProducts(ShopFilter shopFilter) {
		List<Product> products = null ;
		if(shopFilter==null) 
			products = productService.findAll();
		else
			products = productService.findByFilter(shopFilter);
		markItemsInCart(products);
		return products;
	}
	@PostMapping("/products/sendQuestion")
	public @ResponseBody Response sendQuestion(@RequestBody ProductQuestion productQuestion,HttpServletRequest request) {
		Response response = null;
		Product product = productQuestion.getProduct();
		productQuestion.setProduct(productService.findById(product.getId()));
		try {
			emailSender.sendQuestionReceived(productQuestion,getProductLink(productQuestion.getProduct(), request));
			response = Response.ofMessage("success");
		}catch(Exception e) {
			e.printStackTrace();
			response = Response.ofMessage("failed");
		}
		return response;
	}
	
	
	
	@PostMapping(value="/admin/products/save", consumes = "multipart/form-data;charset=UTF-8")
	public @ResponseBody Response saveProduct(@ModelAttribute Product product, BindingResult result, Model model,
			@RequestParam("archivoImagen") MultipartFile multiPart, HttpServletRequest request, RedirectAttributes attributes) {
		String imageName = null;
		if (result.hasErrors()){
			System.out.println("Existieron errores");
			Response.ofMessage("Error");
		}	
		
		if (!multiPart.isEmpty()) {
			imageName = util.saveImage(multiPart,request,"products");
		}
			if (imageName!=null){ 
				product.setImage(imageName);
				
			}
			product.setEnable(ProductStatus.ENABLE.getStatus());
			System.out.println(product);
			productService.save(product);
					
		//return "redirect:/peliculas/index";
		return Response.ofMessage("Success");
		
	}
	
	@GetMapping("admin/products/{idProduct}/remove")
	public String remove(@PathVariable("idProduct") Integer idProduct) {
		Product productDB = productService.findById(idProduct);
		productService.remove(productDB);
		return "redirect:/admin/products/list";
	}
	
	@GetMapping("admin/products/{idProduct}/duplicate")
	public String duplicate(@PathVariable("idProduct") Integer idProduct) {
		Product productDB = productService.findById(idProduct);
		productDB.setId(0);
		productService.save(productDB);
		return "redirect:/admin/products/"+productDB.getId();
	}
	
	@GetMapping("admin/products/{idProduct}/toggleStatus")
	public String toggleStatus(@PathVariable("idProduct") Integer idProduct) {
		Product productDB = productService.findById(idProduct);
		if(productDB.getEnable().equals(ProductStatus.ENABLE.getStatus()))
			productDB.setEnable(ProductStatus.DISABLED.getStatus());
		else
			productDB.setEnable(ProductStatus.ENABLE.getStatus());
		
		productService.save(productDB);
		return "redirect:/admin/products/list";
	}
	
	private void markItemsInCart(List<Product> products) {
		if(shoppingCart.getShoppingItems() == null)
			return;
		
		products.forEach(product->{
			Optional<ShoppingItem> cartItem = shoppingCart.getShoppingItems()
				.stream()
				//.map(ShoppingItem::getProduct)
				.filter(p->p.getProduct().equals(product))
				.findAny()
				;
			product.setInCart(cartItem.isPresent());
			if(cartItem.isPresent()) {
				product.setQntyInCart(cartItem.get().getCount());
			}
		});
		
	}
	
	private List<String> getSizesAsList() {
		List<String> sizeArray = new ArrayList<>();
		sizeArray.addAll(getEnumAsString(ClothSize.values()));
		sizeArray.addAll(getEnumAsString(ShoesSize.values()));
		return sizeArray;
	}
	
	private List<String> getEnumAsString(Size[] enums){
		return Stream.of(enums).map(Object::toString).collect(Collectors.toList());
	}
	
	private String getProductLink(Product product, HttpServletRequest request) {
		return String.format("%s://%s:%d%s/item/%s/"
				,request.getScheme()
				,request.getServerName()
				,request.getServerPort()
				,request.getContextPath()
				,product.getId());
	}
	
	
}
