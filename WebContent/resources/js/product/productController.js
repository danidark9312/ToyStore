var defaultMinPriceFilter = 2000;
var defaultMaxPriceFilter = 200000;
var app = angular.module('myApp', []);
app.controller('productController', function($scope,shopService) {
	  $scope.shopTitle= "Listado de Productos";
	  $scope.products = "";
	  
	  angular.element(document).ready(function () {
		  $scope.loadProductos();
	  });
	  
	  $scope.loadProductos = function(){
		  shopService.loadProducts().then(
					 function(d) {
						 $scope.products = d.data;
		         		},
		         function(errResponse){
		             console.error('Error while fetching Users');
		         }	  
		  );
	  }
});

    	 
   	
