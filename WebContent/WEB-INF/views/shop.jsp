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
    var category = '${param.category}';
    var tipoPrenda = '${param.tipoPrenda}';
    
    
    window.mobilecheck = function() {
    	  var check = false;
    	  (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
    	  return check;
    	};
  
    	
    	
    
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
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-2">
          
          <c:if test="${error!=null}">
          <div class="alert alert-danger col-12" role="alert">
  				<c:out value="${error}"></c:out>
			</div>
          </c:if>
            <div class="row">
              <div class="col-md-12 mb-2">
                <div class="float-md-left mb-4 hide"><h2 class="text-black h5">{{shopTitle}}</h2></div>
                <div class="d-flex hide">
                  <div class="dropdown mr-1 ml-md-auto">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Lo Último
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                      <a class="dropdown-item" href="#">Hombres</a>
                      <a class="dropdown-item" href="#">Mujeres</a>
                      <a class="dropdown-item" href="#">Otros</a>
                    </div>
                  </div>
                  
                  
                  
                  <div class="btn-group">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuReference" data-toggle="dropdown">Ordenar</button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                      <a class="dropdown-item" href="#">Destacado</a>
                      <a class="dropdown-item" href="#">Nombre, A a la Z</a>
                      <a class="dropdown-item" href="#">Nombre, Z a la A</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Precio, el mas bajo</a>
                      <a class="dropdown-item" href="#">Price, el mas alto</a>
                    </div>
                  </div>
                </div>
                
                <div class="col-12 p-2 order-2 order-md-1 site-search-icon text-left">
	              <form ng-submit="searchProducts(filter)" class="site-block-top-search" ng-init="filter=''">
		              <div class="form-group row">
	                    <div class="col-sm-6">
	            		     <span class="icon icon-search2"></span>
	                        <input type="text" class="form-control" placeholder="Buscar" ng-model="filter"/>
	                    </div>
	                    <div class="col-sm-6 xs-center">
	                    	<input type="button" ng-click="searchProducts(filter);moveToProductSection();" class="btn btn-sm btn-primary" value="Buscar">
	                    </div>
	                </div>
	             </form>
            	</div>
                
              </div>
            </div>
            <div class="row mb-5" id="productSection">

<!-- 			<div class="box"> -->
<!-- 				<div class="ribbon"> -->
<!-- 					<span>POPULAR</span> -->
<!-- 				</div> -->
<!-- 			</div> -->

			<div>
	        </div>
	            <div ng-repeat="product in products | orderBy : '-stars'"
	             ng-show="!product.invisible && product.enable=='Y'" 
	             class="col-sm-6 col-lg-4 mb-4 box" 
	             ng-init="cant=1;showCant=false;productSize=''"
	             callback-on-end="attachImageObserver()"
	             >
	            
		            <div ng-if="product.ribbon"class="ribbon">
						<span 
						ng-class="{
						ribbon_New : product.ribbon=='NUEVO'
						,ribbon_Limited : product.ribbon=='LIMITADO'
						,ribbon_Hidden : product.ribbon=='N_A'
						}">{{product.ribbon}}</span>
					</div>
	                <div class="block-4 text-center border" ng-class="{productInCart : product.inCart}">
	                  <figure class="block-4-image">
	                    <a ng-href="${url}item/{{product.id}}" style="width: 100%;display: block">
	                    	<img data-lazy="${urlResources}/images/products/small_{{product.image}}" alt="Image placeholder" class="img-fluid" style="width: 100%">
	                    </a>
	                  </figure>
	                  <div class="block-4-text p-4 limitedSize200">
	                  	
	                  	<div class="row" ng-show="showCant">
							<div class="col-8 mb-1">
								<div class="input-group input-group-sm">
		  							<input value="{{cant}}" type="text" readonly="readonly" class="form-control" placeholder="Cantidad" aria-label="Cantidad" aria-describedby="basic-addon2">
		  							<div class="input-group-append">
									    <button ng-click="cant=cant+1" class="btn btn-outline-secondary" type="button">+</button>
									    <button ng-click="cant=cant==1?1:cant-1" class="btn btn-outline-secondary" type="button">-</button>
		  							</div>
								</div>
							</div>
	           				<div class="col-4 mb-1">
								<div class="input-group input-group-sm">
	  							    <span class="fa fa-check confirmCartIcon text-success" ng-click="addItemToCart(product,cant);showCant=false;cant=1"></span>
	  							    <span class="fa fa-times confirmCartIcon" ng-click="showCant=false"></span>
								</div>
							</div>
							<div class="col-8 mb-1" ng-if="product.sizeArray.length > 0" >
								<div class="input-group input-group-sm">
									<div class="input-group-prepend">
										<span class="input-group-text">Tamaño</span>
									</div>
<!-- 									    <select ng-model="productSize" > -->
<!-- 									    	<option ng-repeat="size in product.sizeArray" vlue="size">{{size}}</option> -->
<!-- 									    </select> -->

									    <select ng-init="product.size=product.sizeArray[0]" ng-model="product.size" ng-options="size for size in product.sizeArray"></select>
								</div>
							</div>
							
							<p ng-show="cant<1" class="text-primary font-weight-bold text-danger">Cantidad debe ser superior a 0</p>
						</div>
						<span ng-show="product.inCart" class="shoppingCant">{{product.qntyInCart}}</span>
		                <div ng-show="!showCant">  
			                <a href="javascript:void(0)" ng-click="showCant=true">
<!-- 			                	ng-show="!product.inCart" -->
			                
			                	<span class="fa fa-cart-plus shoppingIcon" ></span>
			                </a>
			                <sec:authorize access="isAuthenticated()">
			  					<a href="${url}admin/products/{{product.id}}/duplicate">
			             		   	<span class="fa fa-pause duplicateProductAtStore"></span>
				                </a>
			  					<a href="${url}admin/products/{{product.id}}">
			             		   	<span class="fa fa-pencil editProductAtStore"></span>
				                </a>
							</sec:authorize>
			                
			                
			                
<!-- 			            <span ng-click="removeItemFromCart(product)" class="fa fa-trash-o shoppingIcon" ng-show="product.inCart"></span> -->
			                
			                <h3><a ng-href="${url}item/{{product.id}}">{{product.name}}</a></h3>
			                
			                <p class="mb-0" style="margin-bottom: 0">{{product.description | limitTo:80}}</p>
			                <div ng-if="product.value_prev">
		                    	<p class="font-weight-bold previous_value" style="margin-bottom: 0">{{product.value_prev | currency:"$":0}}</p>
			                	<p class="text-primary font-weight-bold" style="margin-bottom: 0">{{product.value | currency:"$":0}}</p>
			                </div>
			                <div ng-if="!product.value_prev">
			                	<p class="text-primary font-weight-bold" style="margin-bottom: 0">{{product.value | currency:"$":0}}</p>
			                </div>
			                
		                    
		                    
		                    
		                </div>
	                    <span class="fa fa-star" ng-class="{checked: product.stars>0} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>1} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>2} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>3} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>4} "></span>
						<br/>
						
						
						<div ng-show="!showCant" ng-init="sizes = product.sizeArray" ng-if="product.sizeArray.length > 0">
							<span class="badge badge-primary m-1" ng-repeat="size in sizes">{{size}}</span>
						</div>
						
						
						

						
	                  </div>
	                </div>
	              </div>
            </div>
            
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                    <li><a href="#">&lt;</a></li>
                    <li class="active"><span>1</span></li>
                    <li><a href="#">&gt;</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-3 order-1 mb-5 mb-md-0">

			<div class="border rounded p-4">
			
			<div class="row" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapsefilter" onclick="$('#collapsefilter').collapse('toggle')"
				style="background-color: #d7d9e2;opacity: 0.8;border-radius: 7px;">
				<div class="col-4 p-2">
						<h3 class="mb-3 h6 text-uppercase text-black d-block m-3">Filtros </h3>
				</div>
				<div class="col-2 offset-5 p-2" style="text-align: center;color : var(--main-bg-color);font-size: xx-large;">
					<i class="fa fa-arrow-circle-o-down"></i>
				</div>
			</div>
			
				
	            <div class="mb-4 collapse show" id="collapsefilter">
		          <div class="border p-4 rounded mb-4">
	              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categorías</h3>
	              <ul class="list-unstyled mb-0">
	              <li class="mb-1">
	              			<a href="#productSection" ng-click="resetCategoryFilters()" class="d-flex">
	              				<span>Catálogo completo</span>
	              			</a> 
	              		</li>
	              	<c:forEach var ="category" items="${categories}">
	              		<li class="mb-1">
	              			<a href="${url}?category=${category.id}#productSection" class="d-flex">
	              				<span>${category.name} (${category.items})</span>
	              			</a> 
<!-- 	              				<span class="text-black ml-auto">(2,220)</span></a> -->
	              		</li>
	              	</c:forEach>
	              </ul>
	            </div>
	            <c:forEach var="productType" items="${productTypes}" varStatus="status">
	            	<div class="border p-4 rounded mb-4">
	              <h3 class="mb-3 h6 text-uppercase text-black d-block">${productType.typeDescription}</h3>
	              <ul class="list-unstyled mb-0">
	              <li class="mb-1">
	              			<a href="#productSection" ng-click="addTypeFilter(${status.index},'${productType.id}',0)" class="d-flex">
	              				<span>TODOS</span>
	              			</a> 
	              		</li>
	              	<c:forEach var ="value" items="${productType.values}">
	              		<li class="mb-1">
	              			<a 	href="#productSection" 
	              				ng-click="addTypeFilter(${status.index},'${productType.id}','${value.productValuePK.productValue}');" 
	              				class="d-flex">
	              				<span>${value.typeDescription}</span>
	              			</a> 
	              		</li>
	              	</c:forEach>
	              </ul>
	            </div>
	            </c:forEach>
		            <div class="border p-4 rounded mb-4">
	              <h3 class="mb-3 h6 text-uppercase text-black d-block">OTROS</h3>
	              <ul class="list-unstyled mb-0">
	              <li class="mb-1">
	              			<a href="#productSection" ng-click="resetRibbonFilters()" class="d-flex">
	              				<span>TODOS</span>
	              			</a> 
	              		</li>
	              	<c:forEach var ="ribbon" items="${ribbons}">
	              		<li class="mb-1">
	              			<a 	href="#productSection" 
	              				ng-click="addRibbonFilter('ribbon=${ribbon}');loadProductos()" 
	              				class="d-flex">
	              				<span>${ribbon}</span>
	              			</a> 
	              		</li>
	              	</c:forEach>
	              </ul>
	            </div>
	             <div class="mb-4" style="text-align: center;">
	                <h3 class="mb-3 h6 text-uppercase text-black d-block">Filtro por precio</h3>
	                <div id="slider-range" class="border-primary"></div>
					<input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
					
					<div class="input-group">
						<input type="button" ng-click="addPriceFilter();moveToProductSection()" class="form-control btn btn-sm btn-primary" value="Filtrar">
						<div class="input-group-append">
							<a href="javascript:void(0)" ng-click="resetFilters()" class="input-group-text fa fa-eraser" id="basic-addon1"></a>
						</div>
					</div>

					<br/>
<!-- 	                <div class="row"> -->
<!-- 	                	<div class="col-8"> -->
<!-- 		                	<input type="button" ng-click="addPriceFilter()" class="btn btn-sm btn-primary" value="Filtrar"> -->
<!-- 		                </div> -->
<!-- 		                <div class="col-4"> -->
<!-- 		                	<a href="javascript:void(0)" ng-click="" ><i class="fa fa-eraser"></i></a> -->
<!-- 		                </div> -->
<!-- 	                </div> -->
	                
	                
	              </div>
	
	              <!--  <div class="mb-4">
	                <h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
	                <label for="s_sm" class="d-flex">
	                  <input type="checkbox" id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small (2,319)</span>
	                </label>
	                <label for="s_md" class="d-flex">
	                  <input type="checkbox" id="s_md" class="mr-2 mt-1"> <span class="text-black">Medium (1,282)</span>
	                </label>
	                <label for="s_lg" class="d-flex">
	                  <input type="checkbox" id="s_lg" class="mr-2 mt-1"> <span class="text-black">Large (1,392)</span>
	                </label>
	              </div>
					-->
	              <!--  <div class="mb-4">
	                <h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
	                <a href="#" class="d-flex color-item align-items-center" >
	                  <span class="bg-danger color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Red (2,429)</span>
	                </a>
	                <a href="#" class="d-flex color-item align-items-center" >
	                  <span class="bg-success color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Green (2,298)</span>
	                </a>
	                <a href="#" class="d-flex color-item align-items-center" >
	                  <span class="bg-info color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Blue (1,075)</span>
	                </a>
	                <a href="#" class="d-flex color-item align-items-center" >
	                  <span class="bg-primary color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Purple (1,075)</span>
	                </a>
	              </div>-->
	
	            </div>
			</div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12">
            <div class="site-section site-blocks-2">
                <div class="row justify-content-center text-center mb-5">
                  <div class="col-md-7 site-section-heading pt-4">
                    <h2>Categorías Destacadas</h2>
                  </div>
                </div>
                <div class="row">
                <c:forEach items="${categories}" var="category" varStatus="index">
	                <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0 p-md-2" data-aos="fade" data-aos-delay="${(index.count-1)*100}">
	                    <a class="block-2-item" href="#productSection" ng-click="addCategoryFilter('categoryId=${category.id }');loadProductos()">
	                      <figure class="image">
	                        <img data-lazy="${urlResources}/images/categories/${category.image}" alt="" class="img-fluid">
	                      </figure>
	                      <div class="text">
	                        <span class="text-uppercase">${category.description}</span>
	                        <h3>${category.name}</h3>
	                      </div>
	                    </a>
	                  </div>
                </c:forEach>

                </div>
              
            </div>
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
  
  <script src="${urlResources}/js/angular/angular.min.js"></script>
  
  <script src="${urlResources}/js/shop/shopController.js"></script>
  <script src="${urlResources}/js/shop/shopService.js"></script>
  <script src="${urlResources}/js/lazy-load-image.js"></script>
  <script>
  
  $(document).ready(function(){
	  	setFloatingProperties(200);
	 	 changeFloatingVisibility(window.scrollY);
	 });
  
  
    </script>
    
  </body>
</html>