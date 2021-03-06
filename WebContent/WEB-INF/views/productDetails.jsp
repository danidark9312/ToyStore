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
    <script>
    var context = '${url}';
    
    window.mobilecheck = function() {
    	  var check = false;
    	  (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
    	  return check;
    	};
  
    	
    	
    
    </script>
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
	
	<div class="site-wrap" ng-app="myApp" ng-controller="shopController">
    
   <jsp:include page="include/header.jsp" />

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/">Inicio</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Tienda</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
    
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img src="${urlResources}/images/products/${product.image}" alt="Image" class="img-fluid">
          </div>
          <div class="col-md-6" ng-init="qnty=1">
            <h2 class="text-black">${product.name}</h2>
            <p class="mb-4">${product.description}</p>
            <c:if test="${product.value_prev!=0}">
	            <p>
	            	<strong class="h4 previous_value" style="font-size:large;"><fmt:formatNumber 
												value = "${product.value_prev}" 
												currencySymbol = "$"
												maxFractionDigits="0" 
												type = "currency"/>
					</strong>
				</p>
            </c:if>
            
            <p><strong class="text-primary h4"><fmt:formatNumber 
											value = "${product.value}" 
											currencySymbol = "$"
											maxFractionDigits="0" 
											type = "currency"/></strong></p>
            <div class="mb-5">
              <div class="input-group mb-3" style="max-width: 120px;">
              <div class="input-group-prepend">
                <button ng-disabled = "qnty==1" ng-click="qnty=qnty-1" class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
              </div>
              <input value="{{qnty}}" type="text" class="form-control text-center" placeholder="" aria-describedby="button-addon1">
              <div class="input-group-append">
                <button ng-click="qnty=qnty+1" class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
              </div>
            </div>
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text">Tama�o</span>
								</div>
								<select id="size">
								<c:forEach items="${product.sizeArray}" var="size">
									<option value="${size}">${size}</option>
								</c:forEach>
								</select>
							</div>

						</div>
<%--             href="${url}" --%>
            <p><a href="javascript:void(0)" id="addProductBtn" class="buy-now btn btn-sm btn-primary" ng-click="addItemToCartFromDetail(${product.id},qnty);">Agregar al carrito</a></p>
            <div class="alert alert-success" id="successAlertItemAdded"  role="alert" style="display: none">Producto agregado con �xito
            <ul>
            	<li><a href="${url}store">Volver a la tienda</a></li>
            	<li><a href="${url}cart">Editar Compra</a></li>
            	<li><a href="${url}checkout">Finalizar Compra</a></li>
            </ul>
            </div>

          </div>
        </div>
      </div>
      
      <form method="POST" enctype="multipart/form-data" id="formQuestion" >
            <div class="alert alert-danger" role="alert" id="errorMessage" style="display:none;">
  			</div>
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              
              <div class="col-md-4 offset-md-1 p-3 mt-lg-4 p-lg-4 border">
              <div class="alert alert-danger" id="errorAlert"  role="alert" style="display: none"></div>
              <div class="alert alert-success" id="successAlert"  role="alert" style="display: none"></div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="name">Realizar pregunta<span class="text-danger">*</span></label>
							<input id="question" type="text" class="form-control" />

							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="Email"
									id="email"
									aria-label="Recipient's username"
									aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button type="button" onclick="sendQuestion(${product.id})" class="btn btn-outline-primary" value="Guardar">Env�ar</button>
								</div>
							</div>
							
                  </div>
                </div>
                
                <p>Las preguntas y comentarios son respondidos a la mayor brevedad posible, puede confirmar talla, 
                estilo o color antes de realizar la comprar
                </p>
                <p>La respuesta sera enviada directamente por correo electr�nico</p>
                
                
              </div>
           </form>
      
      
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
  
  <script src="${urlResources}/js/shop/shopController.js"></script>
  <script src="${urlResources}/js/shop/shopService.js"></script>
  <script>
  
  $(document).ready(function(){
	 	 setFloatingProperties(100);
	 	$("#cartMenuItem").show();
	 	changeFloatingVisibility(window.scrollY);
	 });
  
  function sendQuestion(productId){
	  if(isValidForm()){
		  var questionProduct = {
				  product : {id : productId},
				  question:  $("#question").val(),
				  userEmail:  $("#email").val(),
		  };
		  $.ajax({
			  method: "POST",
			  url: context+"products/sendQuestion",
			  contentType : "application/json",
			  data: JSON.stringify(questionProduct),
			  success: function(data){
				  if(data.message == "failed")
					  showErrorAlert("La pregunta no se pudo env�ar, intente mas tarde");
				  else{
					  sendQuestionConversion();
					  showSuccessAlert("Pregunta enviada con �xito, sera contestada en breve");
					  $("#formQuestion")[0].reset();  
				  }
					  
			  }
			})  
	  }else{
		  showErrorAlert("formulario incompleto");
	  }
  }
  
  function showSuccessAlert(message){
	  $("#errorAlert").hide();
	  $("#successAlert").show().text(message);
  }
  
  function showErrorAlert(message){
	  $("#successAlert").hide();
	  $("#errorAlert").show().text(message);
  }
  
  function isValidForm(){
	  if($("#question").val() == "" || $("#email").val()=="")
		  return false;
	  else
		  return true;
  }
    
    </script>
    
  </body>
</html>