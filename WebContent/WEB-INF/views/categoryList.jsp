<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
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
    
  </head>
  <body>
  
  <div class="site-wrap" ng-app="">
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
						<p>
							<a href="${url}admin/categories" class="btn btn-sm btn-primary">Agregar
								Categoria<i class="fa fa-plus" aria-hidden="true"></i>
							</a>
						</p>
					</div>
					<div class="col-md-10 offset-md-1">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Nombre</th>
									<th scope="col">Descripción</th>
									<th scope="col">Primera Pagina</th>
									<th scope="col">Imagen</th>
									<th scope="col">Editar</th>
									<th scope="col">Eliminar</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${categories}" var="category">
									<tr>
										<th scope="row">${category.id}</th>
										<td>${category.name}</td>
										<td>${category.description}</td>
										<td><c:choose>
												<c:when test="${category.firstPage}">Si</c:when>
												<c:otherwise>No</c:otherwise>
											</c:choose>
										</td>

										<td><img class="imgList" src="${urlResources}/images/categories/${category.image}"></td>
										<td>
										<a href="${url}admin/categories/${category.id}/#product">
											<i class="fa fa-pencil" aria-hidden="true"></i>
										</a>
										</td>
										<td><a href="${url}admin/categories/${category.id}/remove">
											<i class="fa fa-times" aria-hidden="true"></i>
										</a></td>
									</tr> 
								</c:forEach>
								
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
    
  </body>
</html>