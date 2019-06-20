<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%@ page import="co.toyslove.util.Variables" %>
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link rel="stylesheet" href="${urlResources}/css/ribbon.css">
    <script>
    var context = '${url}';
    
    </script>
    <link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
  </head>
  <body>
	<div class="floating-cart bouncing-anim" style="opacity: 0">
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
        <a href="cart"><button type="button" class="btn btn-default" style="letter-spacing:0" id="modal-btn-si">Editar carro</button></a>
        <a href="checkout" style="color:white"><button type="button" style="letter-spacing:0" class="btn btn-primary" id="modal-btn-no">Finalizar compra</button></a>
      </div>
    </div>
  </div>
</div>
	
	<div class="site-wrap" ng-app="myApp" ng-controller="shopController">
    
   <jsp:include page="include/header.jsp" />

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/">Inicio</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Tienda</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section" id="mainSection">
      <div class="site-blocks-cover" style="background-image: url(${urlResources}/img/hero_1.jpg);" data-aos="fade">
      <div class="container">
        <div class="row align-items-start align-items-md-center justify-content-end">
          <div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
            <h1 class="mb-2">Encuentra la ropa perfecta para ti</h1>
            <div class="intro-text text-left">
              <p class="mb-4" style="color:black;">
              Venta de ropa online a excelente precio y calidad garantizada
              <ul class="categoryList">
              	<c:forEach var ="category" items="${categories}">
              	<li>
              		<a class="categoryLink" href="${url}?category=${category.id}">${category.name}</a>
              	</li>
              	</c:forEach>
<!--               	<li>Buzos</li> -->
<!--               	<li>Camisetas</li> -->
<!--               	<li>Camisas Tipo Polo</li> -->
<!--               	<li>Sudaderas</li> -->
<!--               	<li>Ropa interior</li> -->
              </ul>
              </p>
              <p>
                <a href="${url}store" class="btn btn-sm btn-primary">Catálogo Completo</a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section site-section-sm site-blocks-1">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="">
            <div class="icon mr-4 align-self-start">
              <span class="icon-truck"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Envío inmediato</h2>
              <p>Para compras realizadas antes de las 11:00 am, el producto podrá ser entregado el mismo día</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-refresh2"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Devolución sin costo</h2>
              <p>Los cambios y devoluciones son gratuitas y contará con 8 días para solicitar la devolución</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
            <div class="icon mr-4 align-self-start">
              <span class="icon-help"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Soporte al cliente</h2>
              <p>Soporte al cliente y seguimiento de ordenes disponible las 24 horas del día</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section site-blocks-2">
      <div class="container">
        <div class="row">
        <c:forEach var ="category" items="${categories}">
        <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
            <a class="block-2-item" href="${url}?category=${category.id}">
              <figure class="image">
                <img src="${urlResources}/images/categories/${category.image}" alt="" class="img-fluid">
              </figure>
              <div class="text">
                <span class="text-uppercase">Categoría</span>
                <h3>${category.name}</h3>
              </div>
            </a>
          </div>
        </c:forEach>
        
          
          
        </div>
      </div>
    </div>
    </div>
    
    
    
    
    
   <jsp:include page="include/footer.jsp" />

    
  </div>

  <script src="${urlResources}/js/jquery-3.3.1.min.js"></script>
  <script src="${urlResources}/js/jquery-ui.js"></script>
  <script src="${urlResources}/js/jquery-ui-touch-punch.js"></script>
  <script src="${urlResources}/js/popper.min.js"></script>
  <script src="${urlResources}/js/bootstrap.min.js"></script>
  <script src="${urlResources}/js/owl.carousel.min.js"></script>
  <script src="${urlResources}/js/jquery.magnific-popup.min.js"></script>
  <script src="${urlResources}/js/aos.js"></script>

  <script src="${urlResources}/js/main.js"></script>
  
  
  <script>
    </script>
    
  </body>
</html>