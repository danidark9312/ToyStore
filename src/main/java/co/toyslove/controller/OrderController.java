package co.toyslove.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.toyslove.entity.OrderStatus;
import co.toyslove.entity.PurchaseItem;
import co.toyslove.entity.PurchaseOrder;
import co.toyslove.service.PurchaseOrderService;

@Controller()
public class OrderController {
	
	@Autowired
	PurchaseOrderService PurchaseOrderService;
		
	@GetMapping({"/order/list/{trackId}/{user}","/order/list/"})
	public String showForm(Model model,@RequestParam(value="trackId",required=false)Integer trackId,@RequestParam(value="user",required=false) String user) {
		if(trackId != null && user != null){
			PurchaseOrder purchaseOrder = PurchaseOrderService.findByIdAndClient(trackId, user);
			if(purchaseOrder==null) {
				model.addAttribute("message","No existe orden con esa información");
			}else {
				model.addAttribute(purchaseOrder);
			}
			try {
				model.addAttribute("user", URLEncoder.encode(user, "UTF-8"));
				model.addAttribute("trackId", trackId);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
		}
		return "orderList";
	}
	
	@GetMapping("admin/order")
	public String getAdminForm(Model model) {
		model.addAttribute("orderStatusList", OrderStatus.values());
		return "orderAdmin";
	}
	
	
	@GetMapping(value = "admin/order/list", produces="application/json")
	public @ResponseBody List<PurchaseOrder> getOrderList(Model model) {
			List<PurchaseOrder> orderList = PurchaseOrderService.findAll();
			orderList.forEach(order->{
				double total = order.getItems().stream().mapToDouble(PurchaseItem::getPrice).sum();
				order.setIncludeShipping(total<65000);
			});
		return orderList;
	}
	
	@GetMapping(value = "order/status", produces="application/json")
	public @ResponseBody List<String> getStatusList(Model model) {
		List<String> status = Stream.of(OrderStatus.values())
				.map(OrderStatus::getName)
				.collect(Collectors.toList());
		return status;
	}
	
	@PostMapping(value = "admin/order/update", produces="application/json")
	public @ResponseBody PurchaseOrder updateStatusOrder(@RequestBody PurchaseOrder order) {
		System.out.println(order);
		PurchaseOrder orderDB = PurchaseOrderService.findById(order.getId());
		updateFields(orderDB,order);
		PurchaseOrder updatedOrder = PurchaseOrderService.updatePurchaseOrder(orderDB);
		return updatedOrder;
	}

	
	private void updateFields(PurchaseOrder orderDB, PurchaseOrder order) {
		if(order.getStatusDescription()!=null)
			orderDB.setStatusDescription(order.getStatusDescription());
		if(order.getTrackGuide()!=null)
			orderDB.setTrackGuide(order.getTrackGuide());
		if(order.getShippingCarrier()!=null)
			orderDB.setShippingCarrier(order.getShippingCarrier());
		
	}
	
	
		
}
