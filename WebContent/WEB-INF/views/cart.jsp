<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title></title>
	<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />
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
    <script>
    	var context = '${url}';
    </script>
    
  </head>
  <body>
  
  <div class="site-wrap">
	<jsp:include page="include/header.jsp" />
	
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section" ng-app="myApp" ng-controller="cartController">
      <div class="container">
        <div class="row mb-5">
          <form class="col-md-12" method="post">
            <div class="site-blocks-table">
              <table class="table table-bordered" style="table-layout: fixed;width: 800px;">
                <thead>
                  <tr>
                    <th width="15%" class="product-thumbnail">Imagen</th>
                    <th width="20%" class="product-name">Producto</th>
                    <th width="15%" class="product-price">Precio</th>
                    <th width="22%" class="product-quantity">Cantidad</th>
                    <th width="15%" class="product-total">Total</th>
                    <th width="13%" class="product-remove">Quitar</th>
                  </tr>
                </thead>
                <tbody>
                <tr ng-repeat="item in shoppingList" ng-show="item.count!=0">
                    <td class="product-thumbnail">
                    <a ng-href="${url}item/{{item.product.id}}">
                      <img src="${urlResources}/images/products/{{item.product.image}}" alt="Image" class="img-fluid">
					</a>
                    </td>
                    <td class="product-name">
                      <h2 class="h5 text-black">{{item.product.name}}</h2>
                    </td>
                    <td>{{item.product.value | currency:"$":0}}</td>
                    <td>
                      <div class="input-group mb-3 checkoutQntyGroup" style="max-width: 120px;">
                      	<div class="input-group-prepend">
                          <button class="btn btn-outline-primary js-btn-minus" type="button" ng-click="increaseCant(item,-1)">&minus;</button>
                        </div>
                        <input type="text" class="form-control text-center" ng-model="item.count" readonly="readonly" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                        <div class="input-group-append">
                          <button class="btn btn-outline-primary js-btn-plus" type="button" ng-click="increaseCant(item,1)">&plus;</button>
                        </div>
                      </div>

                    </td>
                    <td>{{item.product.value * item.count | currency:"$":0}}</td>
                    <td><a href="" class="btn btn-primary btn-sm" ng-click="removeItemConfirm() ? removeProduct(item) : angular.noop()"><i class="fa fa-trash-o"/></a></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </form>
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-10 mb-3 mb-md-0">
                <button class="btn btn-primary btn-sm btn-block" ng-click="updateCart(true)">Actualizar y continuar comprando</button>
              </div>
<!--               <div class="col-md-6"> -->
<!--                 <button class="btn btn-outline-primary btn-sm btn-block">Continuar Comprando</button> -->
<!--               </div> -->
            </div>
            <div class="row">
              <div class="col-md-12">
                <label class="text-black h4" for="coupon">Cupón</label>
                <p>Enter your coupon code if you have one.</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <input type="text" class="form-control py-3" id="coupon" placeholder="Código">
              </div>
              <div class="col-md-4">
                <button class="btn btn-primary btn-sm">Ingresar cupón</button>
              </div>
            </div>
          </div>
          <div class="col-md-3 col-lg-3 floating-summary">
            <div class="row justify-content-end">
              <div class="col-md-12">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">Total Carro</h3>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">Subtotal</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">{{getTotalProducts(shoppingList) | currency:"$":0}}</strong>
                  </div>
                  <div class="col-md-6">
                    <span class="text-black">Envío</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">{{valorEnvio | currency:"$":0}}</strong>
                  </div>
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">Total</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">{{getTotalProducts(shoppingList)+valorEnvio | currency:"$":0}}</strong>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-12">
                    <button class="btn btn-primary btn-lg py-3 btn-block" ng-click="updateCart(false)">Pagar</button>
                  </div>
                </div>
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
  
  <script src="${urlResources}/js/cart/cartController.js"></script>
  <script src="${urlResources}/js/cart/cartService.js"></script>
  
    
  </body>
</html>