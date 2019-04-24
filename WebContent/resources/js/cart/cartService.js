app.factory('cartService',function($http,$q){
	var factory ={
			loadShoppingCart : loadShoppingCart,
			updateCart : updateCart,
			saveClient : saveClient
	};
	return factory;
	
	
	function loadShoppingCart(){
		 var deferred = $q.defer();
	     $http.get(context+"cart/list")
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
	function updateCart(shoppingItems){
		var deferred = $q.defer();
		var req = {
				 method: 'POST',
				 url: context+"cart/update",
				 data: JSON.stringify(shoppingItems)};
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
	
	function saveClient(client){
		var deferred = $q.defer();
		var req = {
				 method: 'POST',
				 url: context+"checkout/saveClient",
				 data: JSON.stringify(client)};
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