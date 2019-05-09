<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="co.toyslove.util.Variables" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
 	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	
	<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />
	<spring:url value="/order/list/" var="urlForm" />
    <title><%=Variables.pageTitle%> </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${urlResources}/fonts/icomoon/style.css">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${urlResources}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${urlResources}/css/magnific-popup.css">
    <link rel="stylesheet" href="${urlResources}/css/jquery-ui.css">
    <link rel="stylesheet" href="${urlResources}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${urlResources}/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="${urlResources}/css/aos.css">

    <link rel="stylesheet" href="${urlResources}/css/style.css">
    <link rel="stylesheet" href="${urlResources}/css/general.css">
    <script>
    var url = '${urlForm}'
    
    </script>
    
  </head>
  <body>
  
  <div class="site-wrap" ng-app="">
  	<c:import url="include/header.jsp"></c:import>
    

    <div class="site-section">
      <div class="container">
        <div class="row">
					<div class="col-md-12">
						<h2 class="h3 mb-3 text-black">Estado Orden</h2>
						
						
			<form method="POST" enctype="multipart/form-data" modelAttribute="product" >
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              
              <div class="p-3 border col-md-6 offset-md-3">
                <div class="form-group row">
                  <div class="col-md-6">
                    <input id="trackId" type="number" class="form-control" placeholder="Número Orden" value="${trackId}"/>
                  </div>
                  <div class="col-md-6">
                    <input id="document" type="text" class="form-control" placeholder="Documento identidad" value="${document}"/>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-lg-12">
                    <button onclick="loadOrder()" class="btn btn-primary btn-lg btn-block" value="Guardar">Rastrear Orden</button>
                  </div>
                  <div class="alert alert-danger col-md-12 text-center" role="alert" style="display: none" id="alertMessage">
  					Los campos son obligatorios
				</div>
				<c:if test="${message ne null}">
					<div class="alert alert-danger col-md-12 text-center" role="alert" id="alertMessage">
	  					${message}
					</div>
				</c:if>
                </div>
              </div>
            </form>
						
					</div>
					<c:if test="${purchaseOrder ne null}">
					<c:set var="order" value="${purchaseOrder}" />
							<div class="col-md-10 offset-md-1 site-blocks-table">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Id</th>
										<th scope="col">Fecha Compra</th>
										<th scope="col">Estado</th>
										<th scope="col">Guia</th>
										<th scope="col">Empresa transportadora</th>
										<th scope="col">Valor</th>
										
									</tr>
								</thead>
								<tbody>
										<tr>
											<th scope="row">${order.id}</th>
											<td>${order.dateOrder}</td>
											<td><span class="badge badge-primary">${order.statusDescription}</span></td>
											<td>
											<c:choose>
												<c:when test="${order.trackGuide ne null}">
													${order.trackGuide}
												</c:when>
												<c:otherwise>
													Guía no cargada aún
												</c:otherwise>
											</c:choose>
											 </td>
											<td>
											<c:choose>
												<c:when test="${order.shippingCarrier ne null}">
													${order.shippingCarrier}
												</c:when>
												<c:otherwise>
													Empresa no cargada aún
												</c:otherwise>
											</c:choose>
											 </td>
											<td>
											<c:set var="total" value="${0}"/>
												<c:forEach var="item" items="${order.items}" >
													<c:set var="total" value="${total + (item.price*item.quantity)}" />
												</c:forEach>
												<fmt:formatNumber 
											value = "${total+7000}" 
											currencySymbol = "$"
											maxFractionDigits="0" 
											type = "currency"/>
											
											</td>
										</tr> 
								</tbody>
							</table>
	
						</div>
							<div class="col-md-10 offset-md-1 p-4 site-blocks-table">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">Producto</th>
										<th scope="col">Valor Unitario</th>
										<th scope="col">Cantidad</th>
										<th scope="col">Valor total</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="item" items="${order.items}" >
										<tr>
											<td>
												<a ng-href="${url}item/${item.idProduct}">
													<img class="imgList" src="${urlResources}/images/products/${item.image}">
												</a>
											</td>
											<td>${item.productName}</td>
											<td><fmt:formatNumber 
											value = "${item.price}" 
											currencySymbol = "$"
											maxFractionDigits="0" 
											type = "currency"/></td>
											<td>${item.quantity}</td>
											<td><fmt:formatNumber 
											value = "${item.quantity * item.price}" 
											currencySymbol = "$"
											maxFractionDigits="0" 
											type = "currency"/></td>
										</tr>
								</c:forEach>
								<tr>
											<td style="text-align: right" colspan="4">Envío</td>
											<td><fmt:formatNumber 
											value = "${7000}" 
											currencySymbol = "$"
											maxFractionDigits="0" 
											type = "currency"/></td>
										</tr>
								</tbody>
							</table>
	
						</div>
					</c:if>
          
        </div>
      </div>
    </div>
<c:import url="include/footer.jsp"></c:import>    
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
  
  <script>
  function loadOrder(){
	  var trackId = $("#trackId").val();
	  var document = $("#document").val();
	  if(trackId!="" && document!=""){
		  window.location = url+trackId+"/"+document;
	  }else{
		$("#alertMessage").show();  
	  }
  }
  </script>
    
  </body>
</html>