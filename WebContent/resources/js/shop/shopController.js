var app = angular.module('myApp', []);
app.controller('shopController', function($scope,shopService) {
  $scope.shopTitle= "Listado de Productos";
  $scope.products = "-";

  angular.element(document).ready(function () {
	  loadProductos();
  });
  
  
  var loadProductos = function(){
	  
	  shopService.loadProducts().then(
				 function(d) {
					 $scope.products = d.data;
	         		},
	         function(errResponse){
	             console.error('Error while fetching Users');
	         }	  
	  );
	  //console.log($scope.products);
  }
});
;