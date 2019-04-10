<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
 	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />
	<spring:url value="/admin/categories/save" var="urlForm" />
    <title></title>
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
    <link rel="stylesheet" href="${urlResources}/css/general.css" />
    
    
    
  </head>
  <body>
  
  <div class="site-wrap" ng-app="">
    <jsp:include page="include/header.jsp" />

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
            <h2 class="h3 mb-3 text-black">Categorias</h2>
          </div>
          <div class="col-md-7 offset-md-2">

            <form:form action="${urlForm}" method="POST" enctype="multipart/form-data" modelAttribute="category" >
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              
              <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                <div class="col-md-6">
                    <label for="name">Nombre Categoria<span class="text-danger">*</span></label>
                    <form:hidden path="id" />
                    <form:input path="name" type="text" class="form-control" id="name" name="name" />
                  </div>
                  <div class="col-md-4">
                    <label for="valor">Prioridad(1-10)</label>
                    <form:input type="number" path="priority" class="form-control" />
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="valor">Primera página<span class="text-danger">*</span></label>
                    <form:checkbox path="firstPage"/> 
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12" style="text-align: center;color:white">
                    <label for="archivoImagen">Imagen de Categoria<span class="text-danger">*</span></label>
                    <input type="file" id="archivoImagen" name="archivoImagen" />
	                    <c:if test="${not empty category.image}">
	                    	<img id="imagePreview" class="imgInForm" src="${urlResources}/images/categories/${category.image}">
	                    </c:if>              
              		<form:hidden path="image" />
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_message">Descripción</label>
                    <form:textarea path="description" name="c_message" id="c_message" cols="30" rows="7" class="form-control"></form:textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                  <div class="col-lg-12">
                    <button type="submit" class="btn btn-primary btn-lg btn-block" value="Guardar">Guardar</button>
                  </div>
                </div>
              </div>
            </form:form>
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
  
  <script>
  function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      $('#imagePreview').attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
	}

	$("#archivoImagen").change(function() {
	  readURL(this);
	});
  </script>
    
  </body>
</html>