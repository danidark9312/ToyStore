<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="co.toyslove.util.Variables" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
 	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	
	<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />
	<spring:url value="/order/list/" var="urlForm" />
    <title><%=Variables.pageTitle%> </title>
    <meta charset="ISO-88591">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${urlResources}/fonts/icomoon/style.css">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${urlResources}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${urlResources}/css/magnific-popup.css">
    <link rel="stylesheet" href="${urlResources}/css/jquery-ui.css">
    <link rel="stylesheet" href="${urlResources}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${urlResources}/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="${urlResources}/css/aos.css">

    <link rel="stylesheet" href="${urlResources}/css/style.css">
    <link rel="stylesheet" href="${urlResources}/css/general.css">
    
    <style>
    .site-blocks-table thead th{
    padding: 0px;
    }
    
    </style>
    
    <script>
    var url = '${urlForm}';
    var context = '${url}';
    
    
    </script>
    
  </head>
  <body>
  
  <div class="site-wrap" ng-app="myApp" ng-controller="orderController">
  	<c:import url="include/header.jsp"></c:import>
    <div class="site-section">
      <div class="container">
        <div class="row">
					<div class="col-md-12">
						<h2 class="h3 mb-3 text-black">Listado de ordenes</h2>
							
						<div class="row">
							<div class="input-group mb-3 col-12">
								<input type="text" class="form-control"
									ng-model="search.id" placeholder="Orden" aria-label="Orden" aria-describedby="basic-addon2">
									
								<select class="form-control" ng-model="search.statusDescription" placeholder="Estado orden" 
								ng-options="status for status in statusList">
									
								</select>
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button" 
									ng-click="search.id='';search.statusDescription=''"
									><i class="fa fa-eraser"></i></button>
		 						</div>
							</div>
						</div>
						
						

					</div>
						<div class="col-md-10 offset-md-1 site-blocks-table">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Id</th>
										<th scope="col">Fecha Compra</th>
										<th scope="col">Estado</th>
										<th scope="col">Guia</th>
										<th scope="col">Empresa transportadora</th>
										<th scope="col">Detalle</th>
										<th>Valor</th>
										
									</tr>
								</thead>
								<tbody>
										<tr ng-repeat="order in orderList | orderBy : '-id' | filter:search |limitTo:20" >
											<th scope="row">
												<a href="javascript:void(0)" ng-click="setOrderSelected(order)" data-toggle="modal" data-target="#modalDetail">{{order.id}}</a>
											</th>
											<td>{{order.dateOrder | date : 'dd/MM/yyyy HH:mma'}}</td>
											<td ng-init="showStatusList=false">
												<span ng-show="!showStatusList" ng-class="getClassByStatus(order.statusDescription)">{{order.statusDescription}}</span>
												<div ng-show="showStatusList" ng-init="newStatus=order.statusDescription">
													<select ng-model="newStatus" ng-options="status for status in statusList"></select>
													<a ng-show="showStatusList" href="javascript:void(0)" ng-click="showStatusList=false;saveStatus(order,newStatus)"><i class="fa fa-save"></i></a>
												</div>
												<a ng-show="!showStatusList" href="javascript:void(0)" ng-click="showStatusList=true"><i class="fa fa-edit"></i></a>
											</td>
											<td ng-init="showEditTrack=false">
												<input ng-show="showEditTrack" type="text" ng-model="order.trackGuide"/>
												<a ng-show = "showEditTrack" href="javascript:void(0)" ng-click="showEditTrack=false;saveTrackGuide(order)"><i class="fa fa-save"></i></a>
												<span ng-show="!showEditTrack" ng-if="order.trackGuide">{{order.trackGuide}}</span>
												<span ng-show="!showEditTrack" ng-if="!order.trackGuide">Guia no cargada aún</span>
												<a href="javascript:void(0)" ng-show="!showEditTrack" ng-click="showEditTrack=true"><i class="fa fa-edit"></i></a>
											</td>
											<td ng-init="showEditShippingC=false">
												<input ng-show="showEditShippingC" type="text" ng-model="order.shippingCarrier"/>
												<a ng-show = "showEditShippingC" href="javascript:void(0)" ng-click="showEditShippingC=false;saveShippingC(order)"><i class="fa fa-save"></i></a>
												<span ng-show="!showEditShippingC" ng-if="order.shippingCarrier">{{order.shippingCarrier}}</span>
												<span ng-show="!showEditShippingC" ng-if="!order.shippingCarrier">Empresa no cargada aún</span>
												<a href="javascript:void(0)" ng-show="!showEditShippingC" ng-click="showEditShippingC=true"><i class="fa fa-edit"></i></a>
												
											</td>
											
											<td ng-if="order.includeShipping">{{getTotal(order.items)+7000 | currency:"$":0}}</td>
											<td ng-if="!order.includeShipping">{{getTotal(order.items) | currency:"$":0}}</td>
											<td>
												<a href="javascript:void(0)" ng-click="setOrderSelected(order)" data-toggle="modal" data-target="#modalDetail"><i class="fa fa-eye"></i></a>
											</td>
											
											
										</tr> 
								</tbody>
							</table>
	
						</div>
          
        </div>
      </div>
    </div>
    
 <div class="modal fade" id="modalDetail">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Información compra</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="col-md-10 offset-md-1 site-blocks-table">
							<table class="table table-striped" style="table-layout: fixed;">
								<thead>
									<tr>
										<th scope="col" width="10%">id</th>
										<th scope="col" width="20%">Producto</th>
										<th scope="col" width="20%">Imagen</th>
										<th scope="col" width="20%">Precio</th>
										<th scope="col" width="10%">Cant</th>
										<th scope="col" width="20%">Total</th>
										
									</tr>
								</thead>
								<tbody>
										<tr ng-repeat="item in orderSelected.items">
											<th scope="row">
											{{item.purchaseItemPK.productConsecutive}}
											</th>
											<th>{{item.productName}}
											<span ng-if="item.size">({{item.size}})</span>
											</th>
												<th>
												<a ng-href="${url}item/{{item.idProduct}}">
													<img class="imgList" ng-src="${urlResources}/images/products/{{item.image}}">
												</a>
											</th>
											<th>{{item.price | currency:"$":0}}</th>
											<th>{{item.quantity}}</th>
											<th>{{item.price*item.quantity | currency:"$":0}}</th>
										</tr>
										<tr>
											<td colspan="5" align="right">Envio</th>
											<td ng-if="orderSelected.includeShipping">{{7000 | currency:"$":0}}</td>
											<td ng-if="!orderSelected.includeShipping">{{0 | currency:"$":0}}</td>
										</tr>
										<tr>
											<td colspan="5" align="right">Total</th>
											<td ng-if="orderSelected.includeShipping">{{getTotal(orderSelected.items)+7000 | currency:"$":0}}</td>
											<td ng-if="!orderSelected.includeShipping">{{getTotal(orderSelected.items) | currency:"$":0}}</td>
											
										</tr> 
								</tbody>
							</table>
	
						</div>
						
						<div class="col-md-10 offset-md-1">
							<p><strong>{{orderSelected.client.name}} {{orderSelected.client.lastName}}</strong><br/>
							{{orderSelected.address}} {{orderSelected.client.addressAppend}}<br/>
							{{orderSelected.client.addressComment}}<br/>
							{{orderSelected.client.email}}<br/>
							{{orderSelected.client.phone}}</p>
						</div>
						
						
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
    
   
<c:import url="include/footer.jsp"></c:import>    
  </div>

  <script src="${urlResources}/js/jquery-3.3.1.min.js"></script>
  <script src="${urlResources}/js/jquery-ui.js"></script>
  <script src="${urlResources}/js/popper.min.js"></script>
  <script src="${urlResources}/js/bootstrap.min.js"></script>
  <script src="${urlResources}/js/owl.carousel.min.js"></script>
  <script src="${urlResources}/js/jquery.magnific-popup.min.js"></script>
  <script src="${urlResources}/js/aos.js"></script>

  <script src="${urlResources}/js/main.js"></script>
  
  <script src="${urlResources}/js/angular/angular.min.js"></script>
  <script src="${urlResources}/js/order/orderController.js" charset="utf-8"></script>
  <script src="${urlResources}/js/order/orderService.js"></script>

  
  <script>
  function selectCurrentStatus(select, currentStatus){
	  console.log(select);
	  console.log(currentStatus);
  }
  </script>
    
  </body>
</html>