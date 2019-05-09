<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="co.toyslove.util.Variables" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
 	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title><%=Variables.pageTitle%> </title>
	
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />
	<spring:url value="/admin/products/save" var="urlForm" />
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
    	var context = '${url}';
    </script>
    
  </head>
  <body>
  
  <div class="site-wrap">
  	<c:import url="include/header.jsp"></c:import>
    

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Contact</strong></div>
        </div>
      </div>
    </div>  
    <div class="site-section" ng-app="myApp" ng-controller="clientController">

      <div class="container">
        <div class="row">
					<div class="col-md-12">
						<h2 class="h3 mb-3 text-black">Administrador Clientes</h2>
<!-- 						<p> -->
<%-- 							<a href="${url}admin/products" class="btn btn-sm btn-primary">Agregar Cliente --%>
<!-- 							<i class="fa fa-plus" aria-hidden="true"></i> -->
<!-- 							</a> -->
<!-- 						</p> -->
					</div>
					<div class="col-md-10 offset-md-1">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Documento</th>
									<th scope="col">Nombre</th>
									<th scope="col">Email</th>
									<th scope="col">Dirección</th>
									<th scope="col">Teléfono</th>
<!-- 									<th scope="col">Editar</th> -->
<!-- 									<th scope="col">Eliminar</th> -->
								</tr>
							</thead>
							<tbody>
									<tr ng-repeat="client in clients">
										<th scope="row">{{client.document}}</th>
										<td>{{client.name}}  {{client.lastName}}</td>
										<td>{{client.email}}</td>
										<td>{{client.address}}</td>
										<td>{{client.phone}}</td>
<!-- 										<td> -->
<%-- 											<a href="${url}admin/products/${product.id}/#product"> --%>
<!-- 												<i class="fa fa-pencil" aria-hidden="true"></i> -->
<!-- 											</a> -->
<!-- 										</td> -->
<!-- 										<td><i class="fa fa-times" aria-hidden="true"></i></td> -->
									</tr> 
							</tbody>
						</table>

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
  
  <script src="${urlResources}/js/client/clientController.js"></script>
  <script src="${urlResources}/js/client/clientService.js"></script>
    
  </body>
</html>