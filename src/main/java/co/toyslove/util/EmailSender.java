package co.toyslove.util;

import java.text.NumberFormat;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import co.toyslove.entity.Client;
import co.toyslove.model.ProductQuestion;
import co.toyslove.model.ShoppingCart;
import co.toyslove.model.ShoppingItem;

@Component
public class EmailSender {
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	TemplateReader templateReader;
	
	@Autowired
	@Qualifier("currencyFormat")
	NumberFormat currencyFormat;
	
	public void sendCheckoutOrder(ShoppingCart shoppingCart, double shippingCost, String orderLink){
		//SimpleMailMessage message = new SimpleMailMessage();
		MimeMessage createMimeMessage = sender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(createMimeMessage, true,"UTF-8");
			List<String> toAddresses = getNotificationEmails();
			toAddresses.add(shoppingCart.getClient().getEmail());
			helper.setTo(toAddresses.toArray(new String[0]));
			helper.setSubject("Orden de compra");
			helper.setText(getHTMLBodyOrder(shoppingCart, shippingCost, orderLink),true);
			sender.send(createMimeMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public void sendQuestionReceived(ProductQuestion productQuestion, String productLink){
		//SimpleMailMessage message = new SimpleMailMessage();
		MimeMessage createMimeMessage = sender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(createMimeMessage, true,"UTF-8");
			List<String> toAddresses = getNotificationEmails();
			helper.setTo(toAddresses.toArray(new String[0]));
			helper.setSubject("Pregunta producto "+productQuestion.getProduct().getName());
			helper.setText(getHTMLQuestion(productQuestion, productLink),true);
			sender.send(createMimeMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
	}
	
	private List<String> getNotificationEmails() {
		 List<String> emailsTo = Stream.of("danielgm9312@hotmail.com").collect(Collectors.toList());
		return emailsTo;
	}

	private String getHTMLBodyOrder(ShoppingCart shoppingCart, double shippingCost, String orderLink) {
		int purchaseOrderId = shoppingCart.getPurchaseOrder().getId();
		String base = templateReader.getTemplate("PurchaseOrder");
		String table = "";
		table+="<table border=0>";
		table+=	"<tr>";
		table+=	 "<th>Producto</th>";
		table+=	 "<th>Valor</th>";
		table+=	 "<th>Cantidad</th>";
		table+=	 "<th>Total</th>";
		table+=	"</tr>";
		table+=getItemsDetails(shoppingCart.getShoppingItems(), shippingCost);
		
		table+="<tr><td colspan=3>Total</td><td>"+currencyFormat.format(getTotal(shoppingCart.getShoppingItems())+shippingCost)+"</td></tr>";
		table+="</table>";
		table+=getClentInfo(shoppingCart.getClient());
		String bodyEmail = String.format(base, purchaseOrderId ,orderLink,table);
		System.out.println(bodyEmail);
		return bodyEmail;
	}
	private String getHTMLQuestion(ProductQuestion productQuestion, String orderLink) {
		String base = templateReader.getTemplate("QuestionReceived");
		String formatBody = String.format(
				base
				, productQuestion.getProduct().getName()
				,orderLink
				,productQuestion.getQuestion()
				,productQuestion.getUserEmail()
				);
		
		return formatBody;
	}

	private String getClentInfo(Client client) {
		String body = "";
		body+="<h3>Información de cliente</h3>";
		body+="<label>"+client.getName()+" "+client.getLastName()+"</label><br/>";
		body+="<label>"+client.getEmail()+"</label><br/>";
		body+="<label>"+client.getPhone()+"</label><br/>";
		body+="<label>"+client.getAddress()+" - "+client.getAddressAppend()+"</label><br/>";
		body+="<label>"+client.getAddressComment()+"</label><br/>";
		body+="<label>"+client.getCity()+"</label><br/>";
		body+="<label>Antioquia</label><br/>"; //TODO Cargar estado de BD
		return body;
	}

	private int getTotal(List<ShoppingItem> shoppingItems) {
		return shoppingItems.stream().mapToInt(item->item.getProduct().getValue()*item.getCount()).sum();
	}

	private String getItemsDetails(List<ShoppingItem> shoppingItems, double shippingCost) {
		String body = shoppingItems.stream().map(item->{
			String details = "<tr>";
			details+=	"<td>"+item.getProduct().getName()+"</td>";
			details+=	"<td>"+currencyFormat.format(item.getProduct().getValue())+"</td>";
			details+=	"<td>"+item.getCount()+"</td>";
			details+=	"<td>"+currencyFormat.format((long)item.getCount()*item.getProduct().getValue())+"</td>";
			details+="</tr>";
			return details;
		}).reduce("", String::concat);
			if(shippingCost != 0) {
				String details = "<tr>";
				details+=	"<td style=\"text-align='right'\" colspan='3'>Envío</td>";
				details+=	"<td>"+currencyFormat.format(shippingCost)+"</td>";
				details+="</tr>";
				body+=details;
			}
		return body;
	}

	public void sendTest() {
		System.out.println(templateReader.getTemplate("PurchaseOrder"));
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("danielgm9312@hotmail.com");
		message.setSubject("Prueba tienda");
		message.setText("Mensaje de prueba");
		sender.send(message);

	}
	
	
}
