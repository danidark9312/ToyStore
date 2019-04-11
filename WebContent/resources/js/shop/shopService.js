app.factory('shopService',function($http,$q){
	var factory ={
			loadProducts : loadProducts,
			addItemToCart : addItemToCart,
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
	function addItemToCart(item){
		var deferred = $q.defer();
		$http.get(context+"cart/add")
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
});