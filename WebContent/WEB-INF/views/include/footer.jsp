<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="co.toyslove.util.Variables" %>
<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />
	
<footer class="site-footer border-top">
      <div class="container">
        <div class="row">
<!--           <div class="col-lg-6 mb-5 mb-lg-0"> -->
<!--             <div class="row"> -->
<!--               <div class="col-md-12"> -->
<!--                 <h3 class="footer-heading mb-4">Navigations</h3> -->
<!--               </div> -->
<!--               <div class="col-md-6 col-lg-4"> -->
<!--                 <ul class="list-unstyled"> -->
<!--                   <li><a href="#">Sell online</a></li> -->
<!--                   <li><a href="#">Features</a></li> -->
<!--                   <li><a href="#">Shopping cart</a></li> -->
<!--                   <li><a href="#">Store builder</a></li> -->
<!--                 </ul> -->
<!--               </div> -->
<!--               <div class="col-md-6 col-lg-4"> -->
<!--                 <ul class="list-unstyled"> -->
<!--                   <li><a href="#">Mobile commerce</a></li> -->
<!--                   <li><a href="#">Dropshipping</a></li> -->
<!--                   <li><a href="#">Website development</a></li> -->
<!--                 </ul> -->
<!--               </div> -->
<!--               <div class="col-md-6 col-lg-4"> -->
<!--                 <ul class="list-unstyled"> -->
<!--                   <li><a href="#">Point of sale</a></li> -->
<!--                   <li><a href="#">Hardware</a></li> -->
<!--                   <li><a href="#">Software</a></li> -->
<!--                 </ul> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!-- 		<div class="col-md-6 col-lg-3 mb-4 mb-lg-0"> -->
<!--             <h3 class="footer-heading mb-4">Promo</h3> -->
<!--             <a href="#" class="block-6"> -->
<%--               <img src="${urlResources}/img/IMG_5435_edited.jpg" alt="Image placeholder" class="img-fluid rounded mb-4"> --%>
<!--               <h3 class="font-weight-light  mb-0">Finding Your Perfect Shoes</h3> -->
<!--               <p>Promo from  nuary 15 &mdash; 25, 2019</p> -->
<!--             </a> -->
<!--           </div> -->
          <div class="col-md-6 col-lg-3">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4">Inquietudes</h3>
              <ul class="list-unstyled">
                <li class="address">Medellín - Colombia</li>
                <li class="phone"><a href="tel://301 663 7232">3016637232</a></li>
                <li class="email">danielgm9312@hotmail.com</li>
              </ul>
            </div>

<!--             <div class="block-7"> -->
<!--               <form action="#" method="post"> -->
<!--                 <label for="email_subscribe" class="footer-heading">Subscribe</label> -->
<!--                 <div class="form-group"> -->
<!--                   <input type="text" class="form-control py-4" id="email_subscribe" placeholder="Email"> -->
<!--                   <input type="submit" class="btn btn-sm btn-primary" value="Send"> -->
<!--                 </div> -->
<!--               </form> -->
<!--             </div> -->
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <p>
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> Todos los derechos reservados | <i class="icon-heart" aria-hidden="true"></i>  <a href="https://colorlib.com" target="_blank" class="text-primary"><%=Variables.pageName%></a>
            </p>
          </div>
          
        </div>
      </div>
    </footer>