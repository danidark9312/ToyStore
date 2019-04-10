app.factory('shopService',function($http,$q){
	var factory ={
			loadProducts : loadProducts,
	};
	return factory;
	
	function loadProducts(){
		 var deferred = $q.defer();
	     $http.get(context+"products/list")
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