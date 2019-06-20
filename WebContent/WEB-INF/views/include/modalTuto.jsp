<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="co.toyslove.util.Variables" %>
	<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />

<div class="modal fade" id="modalTuto" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Como comprar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Para agregar un producto al carro de compras solo debes darle click a este �cono
        <span class="fa fa-cart-plus" style="color: var(--main-bg-color)"></span>
        Seleccionar la cantidad y confirmar tu producto 
        </p> 
        
        <p>
        Veras como el producto es llevado a la canasta
        </p>
        <img class="tutoImage" src="${urlResources}/img/tuto/shoppingCart.png">
        
        <p>Luego cuando estes a gusto con tus productos, es hora de darle click al carrito de compras y finalizar la orden</p>
        
        <img class="tutoImage" src="${urlResources}/img/tuto/confirmCart2.png">
        
        <p>Una vez en la pantalla de checkout es muy sencillo concretar tu orden,
        solo tienes que llenar el formulario con la informaci�n de env�o, y darle al bot�n
        "Finalizar", esto generar� una orden la cual podr�s seguir a cada momento hasta recibir el producto
        </p>
        
        <img class="tutoImage" src="${urlResources}/img/tuto/checkoutForm.png">
        
        <p>Como opci�n adicional podras crear una contrase�a, para poder cargar tu informaci�n 
        autom�ticamente la proxima vez que quieras realizar una compra
        </p>
        <img class="tutoImage" src="${urlResources}/img/tuto/savePass.png">
        
        <p>Ahora tu orden esta en el sistema siendo verificada</p>
        
        <img class="tutoImage" src="${urlResources}/img/tuto/orderEnded.png">
        
        <p>Nota: <strong>La �rden no sera cobrada al momento de finalizar el proceso, los descuentos y pagos seran 
        aplicados luego y por correo electr�nico sera coordinado y ajustado los descuentos y pagos, por ende usted
        podr� cancelar la orden en cualquier momento sin necesidad de pagar ning�n cargo.
        </strong></p>
        
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    
  </div>
</div>

<script>
function showTutorial(){
	$('#modalTuto').modal("show");	
}

function isFirstTimeUser(){
	if(!localStorage.getItem("visted")){
		   localStorage.setItem("visted",true);
		   return true;
	}else{
		return false;
	}
		
}

window.onload = function(){
	validateNotification();
}

function validateNotification(){
	if(isFirstTimeUser()){
		document.getElementById("notifications").innerText = "1";
		document.getElementById("notifications").style.display="block";
	}else{
		document.getElementById("notifications").innerText = "";
		document.getElementById("notifications").style.display="none";
	}
}

</script>