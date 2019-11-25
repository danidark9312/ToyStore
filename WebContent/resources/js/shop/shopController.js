var defaultMinPriceFilter = 2000;
var defaultMaxPriceFilter = 200000;
var app = angular.module('myApp', []);
var observerAttach = false;
app.controller('shopController', function($scope,shopService) {
  $scope.shopTitle= "Listado de Productos";
  $scope.products = "";
  $scope.shoppingCart = new Array();
  $scope.shopFilter = {
		  price : "priceMin="+defaultMinPriceFilter+"&priceMax"+defaultMaxPriceFilter,
		  productTypes : new Array()
  };

  angular.element(document).ready(function () {
	  //validateShowTuto();
	  $scope.initComponents();
	  $scope.setScreenToPhone();
	  if(category!=''){
		  $scope.addCategoryFilter("categoryId="+category);
	  }
	  if(tipoPrenda!=''){
		  $scope.shopFilter.productTypes[0] = 1+";"+tipoPrenda;
	  }
	  $scope.loadProductos();
	  //setTimeout("startLazyLoad()",1000);
  });
  
  
  
  $scope.initComponents = function(){
	  $("#cartMenuItem").show();
	  $scope.countItemsInCart();
	  $( "#slider-range" ).slider({
	      range: true,
	      min: 10000,
	      max: 500000,
	      step : 5000,
	      animate: 'slow',
	      values: [ defaultMinPriceFilter, defaultMaxPriceFilter],
	      slide: function( event, ui ) {
	        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
	      }
	    });
	    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
	      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
	
  }
  
  $scope.resetRibbonFilters = function(){
	  $scope.shopFilter.ribbon = undefined;
	  $scope.loadProductos();
  };
  
  $scope.resetCategoryFilters = function(){
	  $scope.shopFilter.category = undefined;
	  $scope.loadProductos();
  };
  
  $scope.resetFilters = function(){
	  $scope.shopFilter = {
			  price : "priceMin="+defaultMinPriceFilter+"&priceMax"+defaultMaxPriceFilter,
	  }; 
	  $( "#slider-range" ).slider( "values", 0 , defaultMinPriceFilter );
	  $( "#slider-range" ).slider( "values", 1 , defaultMaxPriceFilter );
	  
	  $scope.loadProductos();
  };
  
  $scope.addCategoryFilter = function(filter){
	  $scope.shopFilter.category = filter;
  };
  
  $scope.addRibbonFilter = function(filter){
	  $scope.shopFilter.ribbon = filter;
  };
  
  $scope.moveToProductSection = function(){
	  window.location="#productSection";
  };
  
  
  
  $scope.addPriceFilter = function(){
	  var min = $( "#slider-range" ).slider( "values", 0 );
	  var max = $( "#slider-range" ).slider( "values", 1 );

	  $scope.shopFilter.price ="priceMin="+min+"&priceMax="+max;
	  
	  $scope.loadProductos();
  };
  
  $scope.loadProductos = function(){
	  observerAttach = false;
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
  
  $scope.countItemsInCart = function(products){
	  shopService.getCountTotalProductsInCart().then(
				 function(d) {
					 if(d.data)
						 $("[id=itemsCant]").text(d.data.data);
	         		},
	         function(errResponse){
	             console.error('Error while fetching Users');
	         }	  
	  );
  };
  $scope.initializeCant = function(product){
	  if(product.qntyInCart==0)
		  return 1;
	  else
		  return product.qntyInCart;
	  
  };
  
  
  $scope.addItemToCartFromDetail = function(productId, cant){
	  var size = $("#size").val()?$("#size").val():"";
	  $scope.addItemToCart({
		  		id : productId,
			   size : size} 
			  ,cant);
	  

	  setTimeout(function(){
		  $('#successAlertItemAdded').show('slow');
		  $("#addProductBtn").hide();
	  },800);
	 
  }
  
  $scope.addItemToCart = function(product, cant){
	  addProductAddedToCart();//Google Conversion
	  var shoppingItem = {
			  product : product,
			  count : cant,
			  size : product.size
	  }
	  
	  shopService.addItemToCart(shoppingItem).then(
			  function(d) {
				  $scope.shoppingCart.push(shoppingItem);
				  $("[id=itemsCant]").text(d.data.data.totalProductsInCart);
				  $("#animatedCart").addClass("animated-cart");
				  shoppingItem.product.qntyInCart = d.data.data.totalProductsThisType;
				  shoppingItem.product
				  setTimeout(function(){
					  $("#animatedCart").removeClass("animated-cart")
				  },1000);
				  //$scope.initializeCant(product);
				  product.inCart = true;
				  cant = 1;
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
  
  $scope.addTypeFilter = function(typePosition,productType, productValue){
	  $scope.shopFilter.productTypes[typePosition] = productType+";"+productValue;
	  $scope.loadProductos();
  };
  
  var buildFilters = function(){
	var str = "";
	if($scope.shopFilter.category)
		str+=$scope.shopFilter.category+"&";
	if($scope.shopFilter.ribbon)
		str+=$scope.shopFilter.ribbon+"&";
	
	if($scope.shopFilter.productTypes.length>0){
		angular.forEach($scope.shopFilter.productTypes, function(productType, key){
			str+="strProductType["+key+"]="+productType+"&";	
		});
	}
		
		
	
	str+=$scope.shopFilter.price;
	return str;
  };
  
});


app.directive("callbackOnEnd", function() {
    return {
        restrict: "A",
        link: function(scope, element, attrs) {
            if (scope.$last) {
                eval(attrs.callbackOnEnd);
            }
        }
    };
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
   
   
   var scrollToDisappear = 500;
   function changeFloatingVisibility (scroll) {
   	  var element = $(".floating-cart")[0];
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

   
   function setFloatingProperties(scrollDisappearParam){
	   scrollToDisappear = scrollDisappearParam;
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
	   
   }
   
function validateShowTuto(){
	if(isFirstTimeUser()){
		showTutorial();
	}
}

attachImageObserver = function(){
	  if(observerAttach){
		  return;
	  }
	  else{
		  startLazyLoad();
		  observerAttach = true;
	  }
};


function addOrUpdateUrlParam(name, value){
  var href = window.location.href;
  var regex = new RegExp("[&\\?]" + name + "=");
  if(regex.test(href)){
    regex = new RegExp("([&\\?])" + name + "=\\d+");
    window.location.href = href.replace(regex, "$1" + name + "=" + value);
  }
  else {
    if(href.indexOf("?") > -1)
      window.location.href = href + "&" + name + "=" + value;
    else
      window.location.href = href + "?" + name + "=" + value;
  }
}
