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
	<spring:url value="/admin/products/save" var="urlForm" />
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
    	var context = '${url}';
    </script>
    
    
  </head>
  <body>
  
  <div class="site-wrap" ng-app="myApp" ng-controller="productController">
  	<c:import url="include/header.jsp"></c:import>
  	
    

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Contact</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
					<div class="col-md-12">
						<h2 class="h3 mb-3 text-black">Administrador Productos</h2>
						
						
						<div class="row">
							<div class="input-group mb-3 col-12">
								<input type="text" class="form-control"
									ng-model="search.name" placeholder="Producto" aria-label="producto" aria-describedby="basic-addon2">
									
								<select class="form-control" ng-model="search.enable" placeholder="Estado producto">
								<option value="Y">Activo</option>
								<option value="N">Suspendido</option>
									
								</select>
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button" 
									ng-click="search.name='';search.enable=''"
									><i class="fa fa-eraser"></i></button>
		 						</div>
							</div>
						</div>
						
						<p>
							<a href="${url}admin/products" class="btn btn-sm btn-primary">Agregar
								Producto<i class="fa fa-plus" aria-hidden="true"></i>
							</a>
						</p>
					</div>
					<div class="col-m2-12 site-blocks-table">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Nombre</th>
									<th scope="col">Valor</th>
									<th scope="col">Inventario</th>
									<th scope="col">Categoria</th>
									<th scope="col">Rating</th>
									<th scope="col">Imagen</th>
									<th scope="col">Activar/Suspender</th>
									<th scope="col">Editar</th>
									<th scope="col">Eliminar</th>
									<th scope="col">Duplicar</th>
								</tr>
							</thead>
							<tbody>
<%-- 								<c:forEach items="${products}" var="product"> --%>
<!-- 									<tr> -->
<%-- 										<th scope="row">${product.id}</th> --%>
<%-- 										<td>${product.name}</td> --%>
<!-- 										<td> -->
<%-- 											<fmt:formatNumber  --%>
<%-- 											value = "${product.value}"  --%>
<%-- 											currencySymbol = "$" --%>
<%-- 											maxFractionDigits="0"  --%>
<%-- 											type = "currency"/> --%>
<!-- 										</td> -->
<%-- 										<td>${product.stock}</td> --%>
<%-- 										<td>${product.category.name}</td> --%>
<!-- 										<td> -->
<%-- 											<c:forEach begin="1" end="${product.stars}" var="index"> --%>
<%-- 												<c:if test="${index<=5}"> --%>
<!-- 													<span class="fa fa-star checked"></span> -->
<%-- 												</c:if> --%>
<%-- 											</c:forEach> --%>
										
<!-- 										</td> -->
<%-- 										<td><img class="imgList" src="${urlResources}/images/products/${product.image}"></td> --%>
<!-- 										<td> -->
<%-- 										<a href="${url}admin/products/${product.id}/toggleStatus"> --%>
<%-- 											<c:choose> --%>
<%-- 												<c:when test="${product.enable=='Y'}"> --%>
<!-- 													<span class="badge badge-secondary">Suspender</span> -->
<%-- 												</c:when> --%>
<%-- 												<c:otherwise> --%>
<!-- 													<span class="badge badge-secondary">Activar</span> -->
<%-- 												</c:otherwise> --%>
<%-- 											</c:choose> --%>
												
<!-- 										</a> -->
<!-- 										</td> -->
<!-- 										<td> -->
<%-- 										<a href="${url}admin/products/${product.id}/#product"> --%>
<!-- 											<i class="fa fa-pencil" aria-hidden="true"></i> -->
<!-- 										</a> -->
<!-- 										</td> -->
<%-- 										<td><a href="${url}admin/products/${product.id}/remove"> --%>
<!-- 											<i class="fa fa-times" aria-hidden="true"></i> -->
<!-- 										</a></td> -->
<!-- 									</tr>  -->
<%-- 								</c:forEach> --%>
								
									<tr ng-repeat="product in products | orderBy : '-id' | filter:search |limitTo:20">
										<th scope="row">{{product.id}}</th>
										<td>{{product.name}}</td>
										<td>{{product.value | currency:"$":0}}</td>
										<td>{{product.stock}}</td>
										<td>{{product.category.name}}</td>
										<td>
											<span class="fa fa-star" ng-class="{checked: product.stars>0} "></span>
											<span class="fa fa-star" ng-class="{checked: product.stars>1} "></span>
											<span class="fa fa-star" ng-class="{checked: product.stars>2} "></span>
											<span class="fa fa-star" ng-class="{checked: product.stars>3} "></span>
											<span class="fa fa-star" ng-class="{checked: product.stars>4} "></span>
										
										</td>
										<td><img class="imgList" src="${urlResources}/images/products/{{product.image}}"></td>
										<td>
											<a href="${url}admin/products/{{product.id}}/toggleStatus">
												<span ng-if="product.enable == 'Y'" class="badge badge-secondary">Suspender</span>
												<span ng-if="product.enable == 'N'" class="badge badge-secondary">Activar</span>
											</a>
										</td>
										<td>
										<a href="${url}admin/products/{{product.id}}/#product">
											<i class="fa fa-pencil" aria-hidden="true"></i>
										</a>
										</td>
										<td><a href="${url}admin/products/{{product.id}}/remove">
											<i class="fa fa-times" aria-hidden="true"></i>
										</a></td>
										<td><a href="${url}admin/products/{{product.id}}/duplicate">
											<i class="fa fa-pencil" aria-hidden="true"></i>
										</a></td>
									</tr> 
								
								
							</tbody>
						</table>

					</div>
          
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
  <script src="${urlResources}/js/product/productController.js"></script>
  <script src="${urlResources}/js/shop/shopService.js"></script>
    
  </body>
</html>