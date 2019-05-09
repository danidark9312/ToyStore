package co.toyslove.controller;

import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.toyslove.entity.Client;
import co.toyslove.entity.OrderStatus;
import co.toyslove.entity.PurchaseItem;
import co.toyslove.entity.PurchaseOrder;
import co.toyslove.model.ShoppingCart;
import co.toyslove.model.ShoppingItem;
import co.toyslove.service.ClientService;
import co.toyslove.service.PurchaseOrderService;
import co.toyslove.util.EmailSender;
import co.toyslove.viewmodel.Response;

@Controller
@RequestMapping("checkout")
public class CheckoutController {
	
	private static final double SHIPPING_COST = 7000;
	
	@Autowired
	ShoppingCart shoppingCart;
	
	@Autowired
	ClientService clientService;
	
	@Autowired
	EmailSender emailSender;
	
	@Autowired
	PurchaseOrderService purchaseOrderService;
	
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
	public String showFormThankYou(Model model,HttpServletRequest request) {
		if(shoppingCart.getItemsCount()==0)
			return "thankyou";
		
		PurchaseOrder po = purchaseOrderService.savePurchaseOrder(getPurchaseFromCart(shoppingCart));
		shoppingCart.setPurchaseOrder(po);
		String orderLink = getOrderLink(po,request);
		try {
			emailSender.sendCheckoutOrder(shoppingCart, SHIPPING_COST, orderLink);	
		}catch (Exception e) {
			System.out.println("Email could not be sent");
			e.printStackTrace();
		}
		model.addAttribute("po",po.getId());
		model.addAttribute("orderLink",orderLink);
		shoppingCart.clear();
		return "thankyou";
	}
	


	@GetMapping("email")
	public @ResponseBody Response<String> email() {
		emailSender.sendTest();
		return Response.ofMessage("success");
	}
	
	private PurchaseOrder getPurchaseFromCart(ShoppingCart shoppingCart) {
		Client client = shoppingCart.getClient();
		PurchaseOrder purchaseOrder = new PurchaseOrder();
		purchaseOrder.setClient(client);
		purchaseOrder.setAddress(client.getAddress()+" - "+client.getAddressAppend());
		purchaseOrder.setEmail(client.getEmail());
		purchaseOrder.setPhone(client.getPhone());
		purchaseOrder.setOrderStatus(OrderStatus.PENDIENTE_APROBACION);
		
		purchaseOrder.setItems(shoppingCart.getShoppingItems()
				.stream()
				.map(this::getPurchaseItemFromChart)
				.collect(Collectors.toList()));
		
		return purchaseOrder;
	}
	
	private PurchaseItem getPurchaseItemFromChart(ShoppingItem item) {
		PurchaseItem purchaseItem = new PurchaseItem();
		purchaseItem.setPrice(item.getProduct().getValue());
		purchaseItem.setProductName(item.getProduct().getName());
		purchaseItem.setQuantity(item.getCount());
		purchaseItem.setImage(item.getProduct().getImage());
		purchaseItem.setIdProduct(item.getProduct().getId());
		return purchaseItem;
	}
	
	private String getOrderLink(PurchaseOrder po, HttpServletRequest request) {
		return String.format("%s://%s:%d%s/order/list/%s/%s"
				,request.getScheme()
				,request.getServerName()
				,request.getServerPort()
				,request.getContextPath()
				,po.getId()
				,po.getClient().getDocument());
	}
}
