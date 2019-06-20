<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="co.toyslove.util.Variables" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <title><%=Variables.pageTitle%> </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="${urlResources}/fonts/icomoon/style.css">


<%--     <link rel="stylesheet" href="${urlResources}/css/font-awesome.min.css"> --%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${urlResources}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${urlResources}/css/magnific-popup.css">
    <link rel="stylesheet" href="${urlResources}/css/jquery-ui.css">
    <link rel="stylesheet" href="${urlResources}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${urlResources}/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="${urlResources}/css/aos.css">

    <link rel="stylesheet" href="${urlResources}/css/style.css">
    <link rel="stylesheet" href="${urlResources}/css/general.css">
    <link rel="stylesheet" href="${urlResources}/css/animation.css">
    
    <link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
  </head>
  <body>
	<div class="floating-cart bouncing-anim">
	<div id="animatedCart">
		<a href="javascript:void()" onclick="sendBotFloating()" data-toggle="modal" data-target="#modal-buy" class="site-cart"> <span
				class="icon icon-shopping_cart"></span>
			</a><span class="count" id="itemsCant">0</span>
	</div>
	
	</div>
	
	<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="modal-buy">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Continuar</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-footer">
        <a href="${url}cart"><button type="button" class="btn btn-default" style="letter-spacing:0" id="modal-btn-si">Editar carro</button></a>
        <a href="${url}checkout" style="color:white"><button type="button" style="letter-spacing:0" class="btn btn-primary" id="modal-btn-no">Finalizar compra</button></a>
      </div>
    </div>
  </div>
</div>
	
	<div class="site-wrap">
    
   <jsp:include page="include/header.jsp" />

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/">Inicio</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Tienda</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section border-bottom" data-aos="fade">
      <div class="container">
        <div class="row mb-5">
					<div class="col-md-8 offset-md-2">
						<div class="site-section-heading pt-3 mb-4">
							<h2 class="text-black">T�rminos, condiciones y pol�ticas de privacidad</h2>
						</div>
						<p>Todos los elementos exhibidos en este sitio web est�n establecidos para la venta y el comercio,
						 para usted adquirir cualquier producto debe suministrar cierta informaci�n b�sica de despacho la cual
						 ser� guardada de forma confidencial y de a cuerdo con las pol�ticas de protecci�n a la informaci�n
						 personal
						 <br/>
						 Considerando lo anterior, en el momento que el usuario se decida por voluntad propia a comprar uno o varios productos, 
						 acepta los t�rminos y condiciones contemplados en este art�culo, dispuesto y elaborado para proteger al consumidor y 
						 garantizar que todo el proceso es llevado a cabo como es debido y que todo lo mostrado y expresado en este sitio web cumple
						 a la verdad 
						</p>
						<p>El inventario y los materiales ofrecidos en esta p�gina son actualizados de forma peri�dica, sin embargo 
						puede ocurrir que al comprar un art�culo este ya no cuente con existencia en la bodega, en esa situaci�n se le 
						informar� debidamente al cliente para que este decida esperar la llegada del pedido con uno o dos d�as de retrazo, si decide 
						comprar otra prenda, o si por el contrario requiere realizar la cancelaci�n de la compra
						<br/></p>
						<div class="site-section-heading pt-3 mb-4">
							<h2 class="text-black">Precio y env�o</h2>
						</div>
						<p>
						Todos los precios expuestos ser�n mantenidos y por ning�n motivos este sitio web luego de realizar un pedido, podr� cambiar
						el precio o alterar las condiciones del mismo, y de ser as�, los cambios no afectar�an las compras ya realizadas y pagadas. 
						No se le cobrar� ning�n valor adicional al del producto y el env�o
						</p>
						<div class="site-section-heading pt-3 mb-4">
							<h2 class="text-black">Pagos, Env�os y descuentos</h2>
						</div>
						<p>El pago ser� realizado posteriormente a la generaci�n de la orden de compra por medio de el sitio web,
						ya que los descuentos y bonos ser�n aplicados sobre la orden generada y no se ven reflejados en el sistema,
						por ello antes de pagar debe esperar que al correo le llegue el precio final con los descuentos aplicados
						</p>
						<p>Actualmente est�n disponibles los siguientes medios de pago</p>
						<ul>
							<li>Transferencia Bancolombia</li>
							<li>Transferencia Citibank</li>
							<li>PayPal</li>
							<li>Pago contra-entrega</li>
						</ul>
						<p>
						Actualmente solo esta disponible el pago contra-entrega en la ciudad de Medell�n y el �rea metropolitana 
						</p>
						<p>Los env�os en la mayor�a de productos y para ordenes
							generadas antes de las 11:00am ser�n despachados para entrega en
							horas de la tarde del mismo d�a, siempre y cuando se encuentre en el �rea
							metropolitana. Cuando la talla o el producto no esta disponible
							en bodega, el env�o podr� tardar entre 2 y no mas de 5 d�as
							h�biles contando a partir de confirmado el pago o la compra, 
							cuando el medio de pago escogido no es contra-entrega, el env�o del 
							producto ser� mas �gil
						</p>
						<div class="site-section-heading pt-3 mb-4">
							<h2 class="text-black">Devoluci�n y garant�a</h2>
						</div>
						<p>
						En caso de no sentirse a gusto con el producto, o que el tama�o o la talla no fue 
						la adecuada, usted podr� devolver o cambiar el producto y solicitar la devoluci�n del dinero,
						esto siempre y cuando suceda en un lapso no superior a 8 d�as despu�s de realizada la entrega
						</p>
						<p>Es importante mencionar que no se reciben devoluciones o cambios en ropa interior
						</p>
						<p>En caso de cambio o devoluci�n por talla el cliente deber� asumir los costos de env�o y estos
						no ser�n reembolsados.
						Para que el cambio o la devoluci�n sea aceptada debe conservar el empaque y las etiquetas de el art�culo
						</p>
						<p>Todos los productos tienen garant�a por da�os de f�brica de 30 d�as calendario, 
						y esta no aplica para deterioros causados por el uso normal, los da�os ocasionados por 
						no seguir las instrucciones de lavado en las etiquetas o por mal uso de las prendas
						</p>
						<p>Quedan excluidos de la garant�a los productos modificados o
							reparados por el Cliente y no cubrir� los productos da�ados por
							un uso inadecuado</p>

					</div>
				</div>
      </div>
    </div>
    
    
   <jsp:include page="include/footer.jsp" />

    
  </div>

  <script src="${urlResources}/js/jquery-3.3.1.min.js"></script>
  <script src="${urlResources}/js/jquery-ui.js"></script>
  <script src="${urlResources}/js/popper.min.js"></script>
  <script src="${urlResources}/js/bootstrap.min.js"></script>
  <script src="${urlResources}/js/owl.carousel.min.js"></script>
  <script src="${urlResources}/js/jquery.magnific-popup.min.js"></script>
  <script src="${urlResources}/js/aos.js"></script>

  <script src="${urlResources}/js/main.js"></script>
  
  <script src="${urlResources}/js/angular/angular.min.js"></script>
  </body>
</html>