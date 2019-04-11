var defaultMinPriceFilter = 1000;
var defaultMaxPriceFilter = 500000;
var app = angular.module('myApp', []);
app.controller('shopController', function($scope,shopService) {
  $scope.shopTitle= "Listado de Productos";
  $scope.products = "-";
  $scope.shopFilter = {
		  price : "priceMin="+defaultMinPriceFilter+"&priceMax"+defaultMaxPriceFilter,
  };

  angular.element(document).ready(function () {
	  $scope.initComponents();
	  $scope.loadProductos();
  });
  
  
  
  $scope.initComponents = function(){
	  $( "#slider-range" ).slider({
	      range: true,
	      min: 0,
	      max: 1000000,
	      step : 1000,
	      animate: 'slow',
	      values: [ defaultMinPriceFilter, defaultMaxPriceFilter],
	      slide: function( event, ui ) {
	        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
	      }
	    });
	    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
	      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
	
  }
  
  $scope.addCategoryFilter = function(filter){
	  $scope.shopFilter.category = filter;
	  $scope.loadProductos();
  };
  
  $scope.addPriceFilter = function(){
	  var min = $( "#slider-range" ).slider( "values", 0 );
	  var max = $( "#slider-range" ).slider( "values", 1 );

	  $scope.shopFilter.price ="priceMin="+min+"&priceMax="+max;
	  
	  $scope.loadProductos();
  };
  
  $scope.loadProductos = function(){
	  var filter = buildFilters();
	  shopService.loadProducts(filter).then(
				 function(d) {
					 $scope.products = d.data;
	         		},
	         function(errResponse){
	             console.error('Error while fetching Users');
	         }	  
	  );
  }
  $scope.addItemToCart = function(){
	  var filter = buildFilters();
	  
	  shopService.addItemToCart(filter).then(
			  function(d) {
				  console.log(d);
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );

  }
  
  var buildFilters = function(){
	var str = "";
	if($scope.shopFilter.category)
		str+=$scope.shopFilter.category+"&";
	
	str+=$scope.shopFilter.price;
	return str;
  };
  
});
;