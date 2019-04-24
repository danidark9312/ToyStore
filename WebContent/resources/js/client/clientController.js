var app = angular.module('myApp', []);
app.controller('clientController', function($scope,clientService) {
  $scope.title= "Carro de compras";
  $scope.clients;
  
  angular.element(document).ready(function () {
	  $scope.loadClients();
  });
  
  
  $scope.loadClients = function(){
	  clientService.loadClients().then(
			  function(d) {
				$scope.clients = d.data;
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
  }
  
  
  
  
});
