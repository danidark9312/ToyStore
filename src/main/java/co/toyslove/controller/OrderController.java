package co.toyslove.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import co.toyslove.entity.PurchaseOrder;
import co.toyslove.service.OrderService;

@Controller()
public class OrderController {
	
	@Autowired
	OrderService orderService;
		
	@GetMapping({"/order/list/{trackId}/{document}","/order/list/"})
	public String showForm(Model model,@PathVariable(value="trackId",required=false)Integer trackId,@PathVariable(value="document",required=false) String document) {
		if(trackId != null && document != null){
			PurchaseOrder purchaseOrder = orderService.findByIdAndClient(trackId, document);
			if(purchaseOrder==null) 
				model.addAttribute("message","No existe orden con esa información");
			else
				model.addAttribute(purchaseOrder);
		}
		return "orderList";
	}
	
	
		
}
