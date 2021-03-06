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
	<spring:url value="/admin/products/save" var="urlForm" />
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
    <link rel="stylesheet" href="${urlResources}/css/cropper.css" />
    
    <script>
    var imageUrl = '${product.image}';
    var formUrl = '${urlForm}';
    var url = '${url}';
    </script>
    
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
            <h2 class="h3 mb-3 text-black">Administrador productos</h2>
          </div>
          <div class="col-md-12 text-center p-2 text-md-left">
            <a href="${url}admin/products" class="btn btn-sm btn-primary">Nuevo Producto<i class="fa fa-plus" aria-hidden="true"></i>
							</a>
          </div>
          
          
          
          <div class="col-md-7 offset-md-2">
<%-- 
action="${urlForm}" 
--%>
            <form:form method="POST" enctype="multipart/form-data" modelAttribute="product" >
            <div class="alert alert-danger" role="alert" id="errorMessage" style="display:none;">
  			</div>
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              
              <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="name">Nombre Producto<span class="text-danger">*</span></label>
                    <form:hidden path="id" />
                    <form:input path="name" type="text" class="form-control" id="name" name="name" />
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-6">
                    <label for="valor">Valor<span class="text-danger">*</span></label>
                    <form:input type="number" path="value" class="form-control" id="valor" name="valor"  />
                  </div>
                  <div class="col-md-6">
                    <label for="valor">Valor Anterior<span class="text-danger">*</span></label>
                    <form:input type="number" path="value_prev" class="form-control" id="valor_ant" name="valor_ant"  />
                  </div>
                  <div class="col-md-6">
                    <label for="valor">Inventario</label>
                    <form:input type="number" path="stock" class="form-control" id="stocl"  />
                  </div>
                  <div class="col-md-6">
                    <label for="valor">Categoria</label>
                    <form:select path="category.id" items="${categories}" itemValue="id" itemLabel="name" class="form-control" />
                  </div>
                  <div class="col-md-6">
                    <label for="valor">Tallas</label>
                    <form:select path="sizeArray"  class="form-control" multiple="true">
                    	<form:options items="${sizes}" />
                    </form:select>
                  </div>
                </div>
                
                
                <div class="form-group row">
                  <div class="col-md-12" style="text-align: center;color:white">
                    <label for="archivoImagenPreload">Imagen de producto<span class="text-danger">*</span></label>
                    <input type="file" id="archivoImagenPreload" name="archivoImagenPreload" />
                    <div>
                		<img id="imageCrop" class="imgInForm" src="${urlResources}/images/products/${product.image}"/>
                	</div>
	                  
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
                  <label for="stars">Estrellas</label>
                    <form:input type="number" path="stars" class="form-control" id="estrellas" name="estrellas" />
                </div>
                <div class="form-group row">
                  <label for="stars">Cinta</label>
                  <form:select path="ribbon"  class="form-control">
                  	<option value=""></option>
                    	<form:options items="${ribbons}" />
                    </form:select>
                    
                </div>
                
                <c:forEach items="${productTypes}" var="productType" varStatus="status">
	                <div class="form-group row">
	                  <label>${productType.typeDescription}</label>
	                  <select name="productTypesSelect"  class="form-control" product_type_id="${productType.id}">
	                  		<option value=""></option>
	                  		<c:forEach items="${productType.values}" var="value">
		                  		<c:choose>
		                  			<c:when test="${value.productValuePK.productValue == productType.valueSelected}">
		                  				<option selected value="${value.productValuePK.productValue}">${value.typeDescription}</option>
		                  			</c:when>
		                  			<c:otherwise>
		                  				<option value="${value.productValuePK.productValue}">${value.typeDescription}</option>
		                  			</c:otherwise>
		                  		</c:choose>
	                  		</c:forEach>
	                    </select>
	                </div>
                </c:forEach>
                
                <div class="form-group row">
                  <div class="col-lg-12">
                    <button type="button" onclick="saveFormProduct()" class="btn btn-primary btn-lg btn-block" value="Guardar">Guardar</button>
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
  <script src="${urlResources}/js/cropper.js"></script>
  <script src="${urlResources}/js/product.js"></script>
  
  <script>
  
  
  </script>
    
  </body>
</html>