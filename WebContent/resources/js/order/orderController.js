var app = angular.module('myApp', []);
app.controller('orderController', function($scope,orderService) {
  $scope.title= "Administrador de ordenes";
  $scope.orderList= new Array();
  $scope.orderSelected= "default";
  $scope.statusList = [];
  
  angular.element(document).ready(function () {
	  $scope.loadOrders();
	  $scope.loadStatus();
  });
  
 
  $scope.loadOrders = function(){
	  orderService.loadOrders().then(
			  function(d) {
				  $scope.orderList = d.data;
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
	  
  };
  
  $scope.loadStatus = function(){
	  orderService.loadStatus().then(
			  function(d) {
				  $scope.statusList = d.data;
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
	  
  };
  
  $scope.getTotal = function(items){
	  var total = 0;
	  angular.forEach(items, function(item, key){
		  total+=item.price*item.quantity;
	  });
	 return total; 
  }
  $scope.setOrderSelected = function(order){
	  $scope.orderSelected=order;
  }
  
  $scope.saveStatus = function(order, newStatus){
	  var orderUpdate = {id : order.id,statusDescription : newStatus};
	  orderService.updateOrderStatus(orderUpdate).then(
			  function(d) {
				  order.statusDescription = d.data.statusDescription;
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
  }
  $scope.saveTrackGuide = function(order){
	  var orderUpdate = {id : order.id,trackGuide : order.trackGuide};
	  orderService.updateOrderStatus(orderUpdate).then(
			  function(d) {
				  order.trackGuide = d.data.trackGuide;
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
  }
  $scope.saveShippingC = function(order){
	  var orderUpdate = {id : order.id,shippingCarrier : order.shippingCarrier};
	  orderService.updateOrderStatus(orderUpdate).then(
			  function(d) {
				  order.shippingCarrier = d.data.shippingCarrier;
			  },
			  function(errResponse){
				  console.error('Error while fetching Users');
			  }	  
	  );
  }
  $scope.getClassByStatus = function(status){
	  if(status=="PENDIENTE DE APROBACIÓN"){
		  return "badge badge-danger"
	  }if(status=="ORDEN APROBADA"){
		  return "badge badge-warning"
	  }if(status=="ENVÍO REALIZADO"){
		  return "badge badge-primary"
	  }if(status=="ORDEN ENTREGADA"){
		  return "badge badge-success"
	  }
  }
});
