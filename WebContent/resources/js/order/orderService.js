app.factory('orderService',function($http,$q){
	var factory ={
			loadOrders : loadOrders,
			loadStatus : loadStatus,
			updateOrderStatus : updateOrderStatus
			
	};
	return factory;
	
	function loadOrders(){
		 var deferred = $q.defer();
	     $http.get(context+"admin/order/list")
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
	function loadStatus(){
		var deferred = $q.defer();
		$http.get(context+"order/status")
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
	function updateOrderStatus(order){
		var deferred = $q.defer();
		var req = {
				 method: 'POST',
				 url: context+"admin/order/update",
				 // headers: {'Content-Type': 'application/json'},
				 data: JSON.stringify(order)};
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