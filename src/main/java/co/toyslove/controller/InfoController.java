package co.toyslove.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InfoController {
	
	
	@GetMapping({"/terminos"})
	public String showForm(Model model) {
		return "terms";
	}
	
	
	
	

}
