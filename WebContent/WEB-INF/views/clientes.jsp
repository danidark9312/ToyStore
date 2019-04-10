<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="/resources" var="urlPublic" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CPM</title>
<link href="${urlPublic}/css/bootstrap.min.css" rel="stylesheet">
<link href="${urlPublic}/css/base.css" rel="stylesheet">
<link href="${urlPublic}/css/datatables.min.css" rel="stylesheet">
<link href="${urlPublic}/css/dataTables.jqueryui.min.css" rel="stylesheet">
<link href="${urlPublic}/css/datatables.min.css" rel="stylesheet">
<%-- <link href="${urlPublic}/css/jquery-ui.css" rel="stylesheet"> --%>

<link href="${urlPublic}/css/clientes.css" rel="stylesheet">

<%-- <script src="${urlPublic}/plugins/jquery.min.js"></script> --%>
<%-- <script src="${urlPublic}/plugins/jquery-ui.min.js"></script> --%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script src="${urlPublic}/plugins/datatables.min.js"></script>
<script src="${urlPublic}/plugins/bootstrap.js"></script>
<script src="${urlPublic}/js/general.js"></script>
<script src="${urlPublic}/js/clientes.js"></script>
<script>
$(document).ready(function(){
	initializeTableClientes();
	initializeAutoCompleteCities();
})
</script>
</head>
<body>
<%@include file="include/menu.jsp"%>
<div>
		<div class="panel panel-default">
		<div class="panel-body">
		
		<div class="row">
					<div class="col-md-12" 	style="text-align: right;">
						<div class="button">
							<a data-toggle="modal" href="#modalCliente"><span class="glyphicon glyphicon-plus"></span></a>
						</div>
					</div>
				</div>
		<table id="tableClientes" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Telefono</th>
                <th>Email</th>
                <th>Ciudad</th>
                <th>Accion</th>
                <th>Codigo</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Nombre</th>
                <th>Telefono</th>
                <th>Email</th>
                <th>Ciudad</th>
                <th>Accion</th>
                <th>Codigo</th>
            </tr>
        </tfoot>
        <tbody>
<!-- 						<tr> -->
<!-- 							<td>Daniel Gutierrez</td> -->
<!-- 							<td>3016637232</td> -->
<!-- 							<td>danielgm9312@hotmail.com</td> -->
<!-- 							<td>Maryland</td> -->
<!-- 						</tr> -->

					</tbody>
    </table>
		
		</div>
		</div>

	</div>

<!-- Modal -->
<div id="modalCliente" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Informacion Cliente</h4>
      </div>
      <div class="modal-body">
			<div class="container" style="width: 100%">
				<form id="formCliente" name="formCliente">
					<div class="form-group">
						<label class="control-label col-sm-2" for="nombreCliente">Nombre:</label>
						<div class="col-sm-10">
							<input class="form-control" name="nombreCliente">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="telefono">Telefono:</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" name="telefono">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">Email:</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" name="email">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="ciudad">Ciudad:</label>
						<div class="col-sm-10 ui-widget">
							<input type="text" class="form-control" name="ciudad">
							<input type="hidden" name="idCiudad">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10"></div>
					</div>
				</form>
			</div>
				</div>
      <div class="modal-footer">
      	<button type="submit" class="btn btn-primary" onclick="saveCliente()">Guardar</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div>

  </div>
</div>

</body>
</html>