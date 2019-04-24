app.factory('clientService',function($http,$q){
	var factory ={
			loadClients : loadClients,
	};
	return factory;
	
	
	function loadClients(){
		 var deferred = $q.defer();
	     $http.get(context+"admin/client/getAll")
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