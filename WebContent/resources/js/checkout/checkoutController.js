var app = angular.module('myApp', []);
app.controller('checkoutController', function($scope,cartService) {
  $scope.title= "Carro de compras";
  $scope.valorEnvio = 7000;
  $scope.totalProducts = 0;
  $scope.totalOrden = 0;
  $scope.shoppingList = new Array();
  $scope.departamentos = new Array();
  $scope.user;
  //$scope.user = $scope.getDummy();
  
  
  angular.element(document).ready(function () {
	  $scope.loadShoppingCart();
	  $scope.departamentos = $scope.loadDepartamentos();
  });
  
  $scope.getTotalProducts = function(){
	  var total = 0;
	  angular.forEach($scope.shoppingList, function(item, key) {
		  total=total+(item.product.value*item.count);
		});
	  return total;
  }
  $scope.getTotalOrden = function(shoppingList){
	  return $scope.totalProducts + $scope.valorEnvio;
  }
  
  $scope.loadShoppingCart = function(){
	  cartService.loadShoppingCart().then(
			  function(d) {
				  $scope.shoppingList = d.data;
				  $scope.totalProducts = $scope.getTotalProducts();
				  $scope.totalOrden = $scope.getTotalOrden();
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
  }
  $scope.finalizarOrden = function(form,user){
	  if(form.$valid){
		  cartService.saveClient(user).then(
				  function(d) {
					  console.log(d);
					  window.location = context + "checkout/thankyou"
				  },
				  function(errResponse){
					  console.error('Error while fetching Users');
				  }	  
		  );
		  
	  }
  }
  
  $scope.loadUser = function(document,password){
	  if(!document){
		  $scope.setErrorField($("#document"));
	  }else if(!password){
		  $scope.setErrorField($("#password"));
	  }else{
		  $scope.clearErrorField($("#document,#password"));
		  
		  var user = {document : document,
				  	  password : password}
		  
		  cartService.loadClient(user).then(
				  function(d) {
					  if(d.data.message){
						  $("#messageLoadClient").text(d.data.message).css("display","block");
					  }else{
						  $("#messageLoadClient").text("").css("display","none");
						  $scope.user=d.data.data;
						  $("#inputPassword").collapse('hide');
						  $("#checkShowPassword").prop("checked",false);
						  $("#newPasswordPanel,#passwordPanel").hide();
					  }
					  
					  console.log(d);
				  },
				  function(errResponse){
					  console.error('Error while fetching Users');
				  }	  
		  );
		  
	  } 
	
  }
  
  $scope.setErrorField = function(field){
	  field.css("border-color","red");
  }
  
  $scope.clearErrorField = function(field){
	  field.css("border-color","white");
  }
  
  
  
  $scope.isNotEmptyField = function(field){
	  if(!field.$touched)
		  return true;
	  return field.$valid;
  }
  $scope.loadDepartamentos = function(){
	  return [{id : 1, name : "Antioquia"}];
  }
  $scope.getDummy = function(){
	  var dni = {name : "Daniel",
			  	document : "1037626409",
				lastName : "Gutierrez",
				address : "cr46AA #45Csur 12",
				addressAppend : "Apartamento 201",
				city : "Envigado",
				email : "danielgm9312@hotmail.com",
				phone : "3016637232",
				addressComment : "Cerca al polideportivo de primavera"
		}
	  return new Object();
	  //return dni;
  }
});
