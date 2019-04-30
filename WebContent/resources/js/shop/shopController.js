var defaultMinPriceFilter = 1000;
var defaultMaxPriceFilter = 500000;
var app = angular.module('myApp', []);
app.controller('shopController', function($scope,shopService) {
  $scope.shopTitle= "Listado de Productos";
  $scope.products = "";
  $scope.shoppingCart = new Array();
  $scope.shopFilter = {
		  price : "priceMin="+defaultMinPriceFilter+"&priceMax"+defaultMaxPriceFilter,
  };

  angular.element(document).ready(function () {
	  $scope.initComponents();
	  $scope.loadProductos();
	  $scope.setScreenToPhone();
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
					 $("[id=itemsCant]").text($scope.getItemsInCart($scope.products));
	         		},
	         function(errResponse){
	             console.error('Error while fetching Users');
	         }	  
	  );
  }
  
  $scope.getItemsInCart = function(products){
	var total = 0;
	angular.forEach(products, function(product, key){
		if(product.inCart)
			total++;
	});
	  return total;
  };
  
  
  $scope.addItemToCart = function(product, cant){
	  var shoppingItem = {
			  product : product,
			  count : cant
	  }
	  
	  shopService.addItemToCart(shoppingItem).then(
			  function(d) {
				  $scope.shoppingCart.push(shoppingItem);
				  $("[id=itemsCant]").text(d.data.data);
				  $("#animatedCart").addClass("animated-cart");
				  setTimeout(function(){
					  $("#animatedCart").removeClass("animated-cart")
				  },1000);
				  
				  product.inCart = true;
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );

  }
  
  $scope.removeItemFromCart = function(product){
	  shopService.removeItemFromCart(product).then(
			  function(d) {
				  // $scope.shoppingCart.push(shoppingItem);
				  $("#itemsCant").text(d.data.data);
				  product.inCart = false;
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
	  
  }
  
  $scope.setScreenToPhone = function(){
	if(window.mobilecheck() || $(window).width()<768){
		$("#collapsefilter").collapse("hide");
	}  
  };
  $scope.searchProducts = function(text){
	  if(text == ""){
		  angular.forEach($scope.products, function(product, key){
					product.invisible = false;
			});
	  }else{
		  text = text.toLowerCase();
		  angular.forEach($scope.products, function(product, key){
			  if(        product.name.toLowerCase().includes(text) 
					  || product.description.toLowerCase().includes(text)
					  || product.category.name.toLowerCase().includes(text)
					  || product.category.description.toLowerCase().includes(text)
			  )
				  product.invisible = false;
			  else
				  product.invisible = true;
		  });
	  }
		  
  };
  
  var buildFilters = function(){
	var str = "";
	if($scope.shopFilter.category)
		str+=$scope.shopFilter.category+"&";
	
	str+=$scope.shopFilter.price;
	return str;
  };
  
});


$(document).ready(function(){
 	 changeFloatingVisibility(window.scrollY);
 });
 
  $('#modal-buy').on('hidden.bs.modal', function () {
   		restoredFloating();
   });
   	
   var sendBotFloating = function(){
   	$(".floating-cart").addClass("activated");
   }
   
   var restoredFloating = function(){
   	$(".floating-cart").removeClass("activated");
   }
   
   
   function changeFloatingVisibility (scroll) {
   	  var element = $(".floating-cart")[0];
   	  var scrollToDisappear = 500;
   	  var visibility;
   	  if(scroll)
   	  	visibility = this.scrollY/scrollToDisappear;
   	  else
   		 visibility = scroll/scrollToDisappear;
   	  
   	  this.scrollY > scrollToDisappear ? element.style.opacity = 1 : element.style.opacity = visibility;
   	  
   	  if(element.style.opacity < 0.1)
   		  element.style.display = "none";
   	  else
   		  element.style.display = "block";
   	}

   	 window.addEventListener("scroll", changeFloatingVisibility , false);
   	
   var lastScroll = 0;
   	$(window).scroll(function() {
   		var scrollY = $(window).scrollTop();
   		var element = $(".floating-cart")[0];
   		var scrollQnty = 10;
   		var isDown = lastScroll<scrollY;
   		lastScroll = scrollY; 
   		
   		if(isDown){
    		element.style.marginTop = "-"+scrollQnty+"px";  
    	}else{
    		element.style.marginTop = scrollQnty+"px";
    	}
   		
   	    clearTimeout($.data(this, 'scrollTimer'));
   	    $.data(this, 'scrollTimer', setTimeout(function() {
   	    	element.style.marginTop = "0"+"px";
   	    }, 80));
   	});
   	
