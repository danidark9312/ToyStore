var app = angular.module('myApp', []);
app.controller('cartController', function($scope,cartService) {
  $scope.title= "Carro de compras";
  $scope.valorEnvioBase = 7000;
  $scope.valorEnvio = 7000;
  $scope.shoppingList = new Array();
  
  angular.element(document).ready(function () {
	  $scope.loadShoppingCart();
  });
  
  $scope.getTotalProducts = function(shoppingList){
	  var total = 0;
	  angular.forEach(shoppingList, function(item, key) {
		  total=total+(item.product.value*item.count);
		});
	  if(total>65000)
		  $scope.valorEnvio = 0;
	  else
		  $scope.valorEnvio = $scope.valorEnvioBase;
		  
		  
	  return total;
  }
  
  $scope.loadShoppingCart = function(){
	  cartService.loadShoppingCart().then(
			  function(d) {
				  $scope.shoppingList = d.data;
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
	  
  }
  $scope.increaseCant = function(item, cant){
	  if(item.count == 1 && cant<0)
		  return;
	  item.count+=cant;
	  $scope.updateCart(false,true); //false go home, true to not redirect
  }
  $scope.removeItemConfirm = function(){
	  return confirm("desea eliminar el producto ?");
  }
  $scope.removeProduct = function(item, productRemoved){
	  item.count = 0;
	  $scope.updateCart(false,true);
  }
  
  $scope.updateCart = function(backHome, notRedirect){
	  console.log($scope.shoppingList);
	  
	  cartService.updateCart($scope.shoppingList).then(
			  function(d) {
				  if(!notRedirect){
					  if(backHome)
							window.location = context+"store";
						  else
							window.location = context+"checkout";
				  }
				  
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
  }
});
