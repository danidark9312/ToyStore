<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title></title>
    <meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />

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
    	
    	function promptBackStore(){
    		if(confirm('Regresar a la tienda')){
    			window.location=context
    		}
    	}
    </script>
    
  </head>
  <body>
  
  <div class="site-wrap">
    <jsp:include page="include/header.jsp" />

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <a href="cart.html">Cart</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Checkout</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section" ng-app="myApp" ng-controller="checkoutController">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-12">
            <div class="border p-4 rounded" role="alert">
              Returning customer? <a href="#">Click here</a> to login
            </div>
          </div>
        </div>
        <form ng-init="user=getDummy()" name="billingForm">
	        <div class="row checkoutSeccion">
		      <div class="col-md-6 mb-5 mb-md-0">
		            <h2 class="h3 mb-3 text-black">Detalles de compra</h2>
		            <div class="p-3 p-lg-5 border">
		              <div class="form-group row">
		                <div class="col-md-12">
		                  <label for="c_fname" class="text-black">Documento<span class="text-danger">*</span></label>
		                  <input type="text" class="form-control" ng-model="user.document" name="document" required >
		                  <span ng-show="!isNotEmptyField(billingForm.document)">Documento</span>
		                </div>
		              </div>
		              <div class="form-group row">
		                <div class="col-md-6">
		                  <label for="c_fname" class="text-black">Nombres<span class="text-danger">*</span></label>
		                  <input type="text" class="form-control" ng-model="user.name" name="name" required >
		                  <span ng-show="!isNotEmptyField(billingForm.name)">Nombre es requerido</span>
		                </div>
		                <div class="col-md-6">
		                  <label for="c_lname" class="text-black">Apellidos<span class="text-danger">*</span></label>
		                  <input type="text" class="form-control" name="lname" ng-model="user.lastName" required>
		                  <span ng-show="!isNotEmptyField(billingForm.lname)">apellido es requerido</span>
		                </div>
		              </div>
		
		
		              <div class="form-group row">
		                <div class="col-md-12">
		                  <label for="c_address" class="text-black">Dirección<span class="text-danger">*</span></label>
		                  <input type="text" class="form-control" id="c_address" name="address" ng-model="user.address" placeholder="Dirección de entrega" required>
		                  <span ng-show="!isNotEmptyField(billingForm.address)">Dirección es requerida</span>
		                </div>
		              </div>
		
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="Apartamento, piso, oficia,etc" ng-model="user.addressAppend" name="addressAppend">
		              </div>
		              <div class="form-group row">
		                <div class="col-md-6">
		                  <label for="c_state_country" class="text-black">Departamento<span class="text-danger">*</span></label> 
		                  <select class="custom-select" ng-options="dep as dep.name for dep in departamentos track by dep.id" ng-init="user.state.id='1'" ng-model="user.state"></select>
		                  
						</div>
		                <div class="col-md-6">
		                  <label for="c_postal_zip" class="text-black">Ciudad<span class="text-danger">*</span></label>
		                  <input type="text" class="form-control" name="city" ng-model="user.city" required>
		                  <span ng-show="!isNotEmptyField(billingForm.city)">Ciudad es requerida</span>
		                </div>
		              </div>
		
		              <div class="form-group row mb-5">
		                <div class="col-md-6">
		                  <label for="c_email_address" class="text-black">Email<span class="text-danger">*</span></label>
		                  <input type="text" class="form-control" name="email" ng-model="user.email" required>
		                  <span ng-show="!isNotEmptyField(billingForm.email)">Email es requerido</span>
		                </div>
		                <div class="col-md-6">
		                  <label for="c_phone" class="text-black">Teléfono <span class="text-danger">*</span></label>
		                  <input type="text" class="form-control" name="phone" ng-model="user.phone" placeholder="Número Telefónico" required>
		                  <span ng-show="!isNotEmptyField(billingForm.phone)">Teléfono es requerido</span>
		                </div>
		              </div>
		
<!-- 		Boton Crear cuenta -->


<!-- 		              <div class="form-group"> -->
<!-- 		                <label for="c_create_account" class="text-black" data-toggle="collapse" href="#create_an_account" role="button" aria-expanded="false" aria-controls="create_an_account"><input type="checkbox" value="1" id="c_create_account"> Crear cuenta ?</label> -->
<!-- 		                <div class="collapse" id="create_an_account"> -->
<!-- 		                  <div class="py-2"> -->
<!-- 		                    <p class="mb-3">Crear cuenta</p> -->
<!-- 		                    <div class="form-group"> -->
<!-- 		                      <label for="c_account_password" class="text-black">Contraseña</label> -->
<!-- 		                      <input type="email" class="form-control" id="c_account_password" name="c_account_password" placeholder=""> -->
<!-- 		                    </div> -->
<!-- 		                  </div> -->
<!-- 		                </div> -->
<!-- 		              </div> -->
		
		
		              <div class="form-group" style="display: none">
		                <label for="c_ship_different_address" class="text-black" data-toggle="collapse" href="#ship_different_address" role="button" aria-expanded="false" aria-controls="ship_different_address">
		                <input type="checkbox" value="1" id="c_ship_different_address"> Ship To A Different Address?</label>
		                <div class="collapse" id="ship_different_address">
		                  <div class="py-2">
		
		                    <div class="form-group">
		                      <label for="c_diff_country" class="text-black">Country <span class="text-danger">*</span></label>
		                      <select id="c_diff_country" class="form-control">
		                        <option value="1">Select a country</option>    
		                        <option value="2">bangladesh</option>    
		                        <option value="3">Algeria</option>    
		                        <option value="4">Afghanistan</option>    
		                        <option value="5">Ghana</option>    
		                        <option value="6">Albania</option>    
		                        <option value="7">Bahrain</option>    
		                        <option value="8">Colombia</option>    
		                        <option value="9">Dominican Republic</option>    
		                      </select>
		                    </div>
		
		
		                    <div class="form-group row">
		                      <div class="col-md-6">
		                        <label for="c_diff_fname" class="text-black">First Name <span class="text-danger">*</span></label>
		                        <input type="text" class="form-control" id="c_diff_fname" name="c_diff_fname">
		                      </div>
		                      <div class="col-md-6">
		                        <label for="c_diff_lname" class="text-black">Last Name <span class="text-danger">*</span></label>
		                        <input type="text" class="form-control" id="c_diff_lname" name="c_diff_lname">
		                      </div>
		                    </div>
		
		                    <div class="form-group row">
		                      <div class="col-md-12">
		                        <label for="c_diff_companyname" class="text-black">Company Name </label>
		                        <input type="text" class="form-control" id="c_diff_companyname" name="c_diff_companyname">
		                      </div>
		                    </div>
		
		                    <div class="form-group row">
		                      <div class="col-md-12">
		                        <label for="c_diff_address" class="text-black">Address <span class="text-danger">*</span></label>
		                        <input type="text" class="form-control" id="c_diff_address" name="c_diff_address" placeholder="Street address">
		                      </div>
		                    </div>
		
		                    <div class="form-group">
		                      <input type="text" class="form-control" placeholder="Apartment, suite, unit etc. (optional)">
		                    </div>
		
		                    <div class="form-group row">
		                      <div class="col-md-6">
		                        <label for="c_diff_state_country" class="text-black">State / Country <span class="text-danger">*</span></label>
		                        <input type="text" class="form-control" id="c_diff_state_country" name="c_diff_state_country">
		                      </div>
		                      <div class="col-md-6">
		                        <label for="c_diff_postal_zip" class="text-black">Posta / Zip <span class="text-danger">*</span></label>
		                        <input type="text" class="form-control" id="c_diff_postal_zip" name="c_diff_postal_zip">
		                      </div>
		                    </div>
		
		                    <div class="form-group row mb-5">
		                      <div class="col-md-6">
		                        <label for="c_diff_email_address" class="text-black">Email Address <span class="text-danger">*</span></label>
		                        <input type="text" class="form-control" id="c_diff_email_address" name="c_diff_email_address">
		                      </div>
		                      <div class="col-md-6">
		                        <label for="c_diff_phone" class="text-black">Phone <span class="text-danger">*</span></label>
		                        <input type="text" class="form-control" id="c_diff_phone" name="c_diff_phone" placeholder="Phone Number">
		                      </div>
		                    </div>
		
		                  </div>
		
		                </div>
		              </div>
		
		              <div class="form-group">
		                <label for="c_order_notes" class="text-black">Observaciones de entrega</label>
		                <textarea ng-model="user.addressComment" cols="30" rows="5" class="form-control" placeholder="Mencione puntos de referencia, indicaciones y sugerencias para una entrega efectiva"></textarea>
		              </div>
		
		            </div>
		          </div>
		      
	          <div class="col-md-6">
	
	            <div class="row mb-5">
	              <div class="col-md-12">
	                <h2 class="h3 mb-3 text-black">Cupon</h2>
	                <div class="p-3 p-lg-5 border">
	                  
	                  <label for="c_code" class="text-black mb-3">Ingrese el cupon si tiene</label>
	                  <div class="input-group w-75">
	                    <input type="text" class="form-control" id="c_code" placeholder="Código de cupon" aria-label="Coupon Code" aria-describedby="button-addon2">
	                    <div class="input-group-append">
	                      <button class="btn btn-primary btn-sm" type="button" id="button-addon2">Aplicar</button>
	                    </div>
	                  </div>
	
	                </div>
	              </div>
	            </div>
	            
	            <div class="row mb-5">
	              <div class="col-md-12">
	                <h2 class="h3 mb-3 text-black">Tu orden</h2>
	                <div class="p-3 p-lg-5 border">
	                  <table class="table site-block-order-table mb-5">
	                    <thead>
	                      <th>Producto</th>
	                      <th>Total</th>
	                    </thead>
	                    <tbody>
	                      <tr ng-repeat="item in shoppingList">
	                        <td>{{item.product.name}}<strong class="mx-2">x</strong>{{item.count}}</td>
	                        <td>{{item.product.value * item.count | currency:"$":0}}</td>
	                      </tr>
	                      <tr>
	                        <td class="text-black font-weight-bold"><strong>Subtotal</strong></td>
	                        <td class="text-black">{{totalProducts | currency:"$":0}}</td>
	                      </tr>
	                      <tr>
	                        <td>Envio</td>
	                        <td>{{valorEnvio | currency:"$":0}}</td>
	                      </tr>
	                      <tr>
	                        <td class="text-black font-weight-bold"><strong>Total Orden</strong></td>
	                        <td class="text-black font-weight-bold"><strong>{{totalOrden | currency:"$":0}}</strong></td>
	                      </tr>
	                      <tr>
	                      	<td colspan="2">
	                      	
	                      	</td>
	                      </tr>
	                    </tbody>
	                  </table>
	
	                  <div class="blueBorder p-3 mb-3">
	                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsebank" role="button" aria-expanded="false" aria-controls="collapsebank">
	                    Pago</a></h3>
	                    <div class="collapse" id="collapsebank">
	                      <div class="py-2">
	                        <p class="mb-0">
	                        Realice el pago por medio de una transferencia bancaria a Bancolombia o pague contra entrega
	                        </p>
	                      </div>
	                    </div>
	                  </div>
	                  
	                  <div class="row">
		                  <div class="col-3">
			                  <div class="form-group">
										<button class="btn btn-success btn-lg btn-block" style="font-size: 36px ;padding: 1px"
											onclick="promptBackStore()"><i class="fa fa-cart-plus"
												aria-hidden="true"></i>
										</button>
								</div>
		                  </div>
		                  <div class="col-9">
			                  <div class="form-group">
			                    <button class="btn btn-primary btn-lg py-3 btn-block" ng-click="finalizarOrden(billingForm,user)">Finalizar orden</button>
			                  </div>
		                  </div>
	                  </div>
	                  
	                  
	
	                </div>
	              </div>
	            </div>
	
	          </div>
	        </div>
        </form>
        <!-- </form> -->
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
  
  <script src="${urlResources}/js/checkout/checkoutController.js"></script>
  <script src="${urlResources}/js/cart/cartService.js"></script>

  
    
  </body>
</html>