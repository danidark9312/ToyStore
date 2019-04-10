<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="urlRoot" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CPM</title>
<link href="${urlPublic}/css/bootstrap.min.css" rel="stylesheet">
<link href="${urlPublic}/css/base.css" rel="stylesheet">
<link href="${urlPublic}/css/login.css" rel="stylesheet">


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

		<div class="panel panel-default login-container">
		<div class="panel-body">
		<form name="f" action="login" method="POST">
			<div class="row">
				<div class="col-md-4 labelText">
					<label>Usuario</label>
				</div>
				<div class="col-md-8">
					<input name="username" type="text" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 labelText">
					<label>Password</label>
				</div>
				<div class="col-md-8">
					<input name="password" type="password" />
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</div>
			</div>
			<div style="text-align: center;">
				<input type="submit" name="submit" value="Login"/>
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
</body>
</html>