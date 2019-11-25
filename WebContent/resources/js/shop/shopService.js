app.factory('shopService',function($http,$q){
	var factory ={
			loadProducts : loadProducts,
			addItemToCart : addItemToCart,
			removeItemFromCart : removeItemFromCart,
			getProductsInCart : getProductsInCart,
			getCountTotalProductsInCart:getCountTotalProductsInCart
	};
	return factory;
	
	function loadProducts(filters){
		 var deferred = $q.defer();
	     $http.get(context+"products/list"+((filters!=undefined)?("?"+filters):''))
            .then(
            function (response) {
            	deferred.resolve(response);        
            },
            function(errResponse){
                console.error('Error while fetching Acciones');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
	}
	
	function getProductsInCart(){
		 var deferred = $q.defer();
	     $http.get(context+"cart/list")
           .then(
           function (response) {
           	deferred.resolve(response);        
           },
           function(errResponse){
               console.error('Error while fetching products');
               deferred.reject(errResponse);
           }
       );
       return deferred.promise;
	}
	
	function getCountTotalProductsInCart(){
		 var deferred = $q.defer();
	     $http.get(context+"cart/count")
          .then(
          function (response) {
          	deferred.resolve(response);        
          },
          function(errResponse){
              console.error('Error while fetching products');
              deferred.reject(errResponse);
          }
      );
      return deferred.promise;
	}
	
	function addItemToCart(shoppingItem){
		var deferred = $q.defer();
		var req = {
				 method: 'POST',
				 url: context+"cart/add",
				 // headers: {'Content-Type': 'application/json'},
				 data: JSON.stringify(shoppingItem)};
		$http(req)
		.then(
				function (response) {
					deferred.resolve(response);        
				},
				function(errResponse){
					console.error(errResponse);
					deferred.reject(errResponse);
				}
		);
		return deferred.promise;
	}
	function removeItemFromCart(product){
		var deferred = $q.defer();
		var req = {
				method: 'POST',
				url: context+"cart/remove",
				data: JSON.stringify(product)};
		$http(req)
		.then(
				function (response) {
					deferred.resolve(response);        
				},
				function(errResponse){
					console.error(errResponse);
					deferred.reject(errResponse);
				}
		);
		return deferred.promise;
	}
});