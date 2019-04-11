<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
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
    <script>
    var context = '${url}';
    </script>
  </head>
  <body>
  
  <div class="site-wrap" ng-app="myApp" ng-controller="shopController">
    
   <jsp:include page="include/header.jsp" />

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-2">

            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">{{shopTitle}}</h2></div>
                <div class="float-md-left mb-4"><h2 class="text-black h5">Cart items : <c:out value="${shoppingCart.itemsCount}"></c:out> </h2></div>
                <div class="d-flex">
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
              </div>
            </div>
            <div class="row mb-5">
            <div>
	        </div>
	            <div ng-repeat="product in products" class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
	                <div class="block-4 text-center border">
	                  <figure class="block-4-image">
	                    <a href="shop-single.html">
	                    	<img src="${urlResources}/images/products/{{product.image}}" alt="Image placeholder" class="img-fluid">
	                    </a>
	                  </figure>
	                  <div class="block-4-text p-4">
	                  	
		                  
		                <span class="fa fa-cart-plus shoppingIcon"></span>
		                  	
	                  	
	                    <h3><a href="shop-single.html">{{product.name}}</a></h3>
	                    <p class="mb-0">{{product.description}}</p>
	                    <p class="text-primary font-weight-bold">{{product.value | currency:"$":0}}</p>
	                    <span class="fa fa-star" ng-class="{checked: product.stars>0} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>1} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>2} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>3} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>4} "></span>
						
						<div class="row" ng-init="cant=1">
              				<div class="col-md-6 mb-5">
								<div class="input-group input-group-sm">
		  							<input value="{{cant}}" type="text" readonly="readonly" class="form-control" placeholder="Recipient's username" aria-label="Cantidad" aria-describedby="basic-addon2">
		  							<div class="input-group-append">
									    <button ng-click="cant=cant+1" class="btn btn-outline-secondary" type="button">+</button>
									    <button ng-click="cant=cant-1" class="btn btn-outline-secondary" type="button">-</button>
		  							</div>
								</div>
						</div>
              				<div class="col-md-5 mb-5">
								<div class="input-group input-group-sm">
		  							    <span class="fa fa-check confirmCartIcon" ></span>
		  							    <span class="fa fa-times confirmCartIcon" ></span>
								</div>
							</div>
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
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categorias</h3>
              <ul class="list-unstyled mb-0">
              	<c:forEach var ="category" items="${categories}">
              		<li class="mb-1">
              			<a href="" ng-click="addCategoryFilter('categoryId=${category.id }')" class="d-flex">
              				<span>${category.name}</span> 
              				<span class="text-black ml-auto">(2,220)</span></a>
              		</li>
              	</c:forEach>
              </ul>
            </div>

            <div class="border p-4 rounded mb-4">
              <div class="mb-4" style="text-align: center;">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Filtro por precio</h3>
                <div id="slider-range" class="border-primary"></div>
                <input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
                <br/>
                <input type="button" ng-click="addPriceFilter()" class="btn btn-sm btn-primary" value="Filtrar">
                <input type="button" ng-click="addItemToCart()" class="btn btn-sm btn-primary" value="AddCart">
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
	                <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="${(index.count-1)*100}">
	                    <a class="block-2-item" href="?categoryId=${category.id}">
	                      <figure class="image">
	                        <img src="${urlResources}/images/categories/${category.image}" alt="" class="img-fluid">
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
  <script src="${urlResources}/js/popper.min.js"></script>
  <script src="${urlResources}/js/bootstrap.min.js"></script>
  <script src="${urlResources}/js/owl.carousel.min.js"></script>
  <script src="${urlResources}/js/jquery.magnific-popup.min.js"></script>
  <script src="${urlResources}/js/aos.js"></script>

  <script src="${urlResources}/js/main.js"></script>
  
  <script src="${urlResources}/js/angular/angular.min.js"></script>
  
  <script src="${urlResources}/js/shop/shopController.js"></script>
  <script src="${urlResources}/js/shop/shopService.js"></script>
    
  </body>
</html>