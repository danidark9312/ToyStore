<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="co.toyslove.util.Variables" %>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="urlRoot" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=Variables.pageTitle%> </title>
<link rel="stylesheet" href="${urlPublic}/css/bootstrap.min.css">
<link href="${urlPublic}/css/base.css" rel="stylesheet">
<link href="${urlPublic}/css/login.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="${urlPublic}/css/magnific-popup.css">
 <link rel="stylesheet" href="${urlPublic}/css/jquery-ui.css">
 <link rel="stylesheet" href="${urlPublic}/css/owl.carousel.min.css">
 <link rel="stylesheet" href="${urlPublic}/css/owl.theme.default.min.css">


 <link rel="stylesheet" href="${urlPublic}/css/aos.css">

 <link rel="stylesheet" href="${urlPublic}/css/style.css">
 <link rel="stylesheet" href="${urlPublic}/css/general.css">
 
 <script src="${urlPublic}/js/jquery-3.3.1.min.js"></script>
 <script src="${urlPublic}/js/jquery-ui.js"></script>
 <script src="${urlPublic}/js/popper.min.js"></script>
 <script src="${urlPublic}/js/bootstrap.min.js"></script>


</head>

<!--  <body onload='document.f.username.focus();'>
<h3>Custom Login with Username and Password</h3><form name='f' action='login' method='POST'>
<table>
    <tr><td>User:</td><td><input type='text' name='username' value=''></td></tr>
    <tr><td>Password:</td><td><input type='password' name='password'/></td></tr>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <tr><td colspan='2'><input name="submit" type="submit" value="Login"/></td></tr>
</table>
</form></body>-->

   <body>
<div>

	<div class="row">
		<div class="panel panel-default login-container mt-2 col-8 col-md-4 p-5">
				<div class="panel-body">
				<form name="f" action="login" method="POST">
					<div class="form-group row">
	                  <label for="username" class="col-sm-4 col-form-label text-right" >Usuario<span class="text-danger ">*</span></label>
	                    <div class="col-sm-8">
							<input name="username" type="text" class="form-control" />
						</div>
	                </div>
	                <div class="form-group row">
	                  <label for="username" class="col-sm-4 col-form-label text-right" >Contraseña<span class="text-danger ">*</span></label>
	                    <div class="col-sm-8">
							<input name="password" type="password" class="form-control" />
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</div>
	                </div>
	                
					
					
					<div style="text-align: center;">
						<input class="btn btn-primary" type="submit" name="submit" value="Login"/>
					</div>
					<c:if test="${!empty param.success}">
							<div class="alert alert-success">
								${param.success}
							</div>
					</c:if>
					<c:if test="${!empty param.error}">
							<div class="alert alert-danger">
								${param.error}
							</div>
					</c:if>
						</form>
				
				</div>
			</div>
	
	</div>
</div>
</body>
</html>