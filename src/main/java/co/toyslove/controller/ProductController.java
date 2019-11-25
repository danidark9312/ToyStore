package co.toyslove.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import co.toyslove.entity.ProductProductType;
import co.toyslove.entity.ProductType;
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
import co.toyslove.service.ProductTypeService;
import co.toyslove.util.EmailSender;
import co.toyslove.util.Out;
import co.toyslove.util.Util;
import co.toyslove.viewmodel.Response;

@Controller
public class ProductController {
	
	@Autowired
	ProductServicesImpl productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductTypeService productTypeService;
	
	@Autowired
	ShoppingCart shoppingCart;
	
	@Autowired
	Out out;
	
	@Autowired
	EmailSender emailSender;
	
	@Autowired
	Util util;
	
	@GetMapping("item/{id}")
	public String showDetailItem(Model model,@PathVariable int id,RedirectAttributes attributes) {
		Product product = productService.findById(id);
		if(product == null) {
			attributes.addFlashAttribute("error","El producto seleccionado no existe");
			return "redirect:/store";
		}else {
			model.addAttribute(product);
			out.print("Consulting product details: ");
			out.print(product.getName());
			return "productDetails";	
		}
	}
	@GetMapping("generateproducttype")
	public void generateDefaultProductType(Model model) {
		List<Product> products = productService.findAll();
		List<ProductType> productTypes = productTypeService.findAll();
		List<ProductProductType> productProductTypes = new ArrayList<>();
		products.forEach(product->{
			productTypes.forEach(productType->{
				productProductTypes.add(new ProductProductType(product.getId(), productType.getId(), 1));
			});
		});
		productTypeService.saveProductProductTypes(productProductTypes);
		
	}
	
	@GetMapping("/admin/products")
	public String showForm(@ModelAttribute Product product,Model model) {
		loadScreenAttributes(model);
		return "productForm";
	}
	

	private void loadScreenAttributes(Model model) {
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("sizes", getSizesAsList());
		model.addAttribute("ribbons", getRibbonsAsList());
	}

	private List<String> getRibbonsAsList() {
		return Arrays.asList("N_A","NUEVO","OFERTA","LIMITADO");
	}

	@GetMapping("/admin/products/{id}")
	public String showForm(Model model,@PathVariable int id) {
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		loadScreenAttributes(model);
		loadProductTypesValues(product, model);
		return "productForm";
	}
	
	private void loadProductTypesValues(Product product, Model model) {
		List<ProductType> productTypes = productTypeService.findAll();
		product.getProductProductTypes().forEach(productProductTye->{
			productTypes.stream().forEach(productType->{
					if(productType.getId()==productProductTye.getProductProductTypePK().getProductType()) {
						productType.setValueSelected(productProductTye.getProductValue());	
					}
				});
		});
			
		model.addAttribute("productTypes", productTypes);
		
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
		Util.markItemsInCart(shoppingCart,products);
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
			@RequestParam(value = "archivoImagen", required = false) MultipartFile multiPart,
			HttpServletRequest request, RedirectAttributes attributes) {
		String imageName = null;
		
		
		if (result.hasErrors()) {
			System.out.println("Existieron errores");
			Response.ofMessage("Error");
		}

		if (multiPart != null && !multiPart.isEmpty()) {
			imageName = util.saveImage(multiPart, request, "products");
		}
		if (imageName != null) {
			product.setImage(imageName);

		}
		product.setEnable(ProductStatus.ENABLE.getStatus());
		//Save all product specifications, Tipo prenda, estado producto, etc
		
		productService.save(product);
		
		product.convertProductTypesFromString();
		if(product.getId()!=0)
			product.getProductProductTypes().forEach(ppt->ppt.setProductId(product.getId()));
		
		productTypeService.removeByProduct(product);
		if(product.getProductProductTypes()!=null) {
			product.getProductProductTypes()
			.stream()
			.forEach(productProductType->{
				productProductType.setProductId(product.getId());
				productTypeService.saveProductProductType(productProductType);
			});
		}
		

		// return "redirect:/peliculas/index";
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
		
		
		productDB.getProductProductTypes().forEach(ppt->ppt.setProductId(productDB.getId()));
		
		if(productDB.getProductProductTypes()!=null) {
			productDB.getProductProductTypes()
			.stream()
			.forEach(productProductType->{
				productProductType.setProductId(productDB.getId());
				productTypeService.saveProductProductType(productProductType);
			});
		}
		
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
