var app = angular.module('myApp', []);
app.controller('cartController', function($scope,cartService) {
  $scope.title= "Carro de compras";
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
  }
  $scope.removeItemConfirm = function(){
	  return confirm("desea eliminar el producto ?");
  }
  $scope.removeProduct = function(item, productRemoved){
	  item.count = 0;
  }
  
  $scope.updateCart = function(backHome){
	  console.log($scope.shoppingList);
	  
	  cartService.updateCart($scope.shoppingList).then(
			  function(d) {
				  if(backHome)
					window.location = context+"home";
				  else
					window.location = context+"checkout";
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
  }
});
