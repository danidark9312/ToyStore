package co.toyslove.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.toyslove.entity.Client;
import co.toyslove.entity.Product;
import co.toyslove.model.ShoppingCart;
import co.toyslove.service.ClientService;
import co.toyslove.viewmodel.Response;

@Controller
public class ClientController {
	
	@Autowired
	ClientService clientService;
	
	@Autowired
	ShoppingCart shoppingCart;
	
	@GetMapping("/admin/client/list")
	public String showForm(@ModelAttribute Product product,Model model) {
		return "clientList";
	}
	@GetMapping("/admin/client/getAll")
	public @ResponseBody List<Client> loadClients() {
		return clientService.findAll();
	}
	
	@RequestMapping("/checkout/saveClient")
	public @ResponseBody Response saveClient(@RequestBody Client client) {
		if(shoppingCart.getShoppingItems()!=null && shoppingCart.getShoppingItems().size()>0)
			shoppingCart.setClient(client);
		if(clientService.findById(client.getDocument())!=null) {
			return Response.ofMessage("Usuario ya existe");
		}else {
			clientService.saveClient(client);
			return Response.ofMessage("success");	
		}
	}
	
}
