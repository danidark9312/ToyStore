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
<!--             <h3 class="footer-heading mb-4">Promoción</h3> -->
<%--             <a href="${url}?category=6" class="block-6"> --%>
<%--               <img src="${urlResources}/img/IMG_5435_edited.jpg" alt="Image placeholder" class="img-fluid rounded mb-4"> --%>
<!--               <h3 class="font-weight-light  mb-0">Camisetas de los super heroes que tanto amamos</h3> -->
<!--               <p><span class="badge badge-secondary">Tiempo Limitado</span></p> -->
<!--             </a> -->
<!--           </div> -->

		<div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
            <h3 class="footer-heading mb-4">Promoción</h3>
            <a href="${url}?category=3" class="block-6">
              <img src="${urlResources}/img/promoBuz.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
              <h3 class="font-weight-light  mb-0">10% de descuento en todos los buzos</h3>
              <p><span class="badge badge-secondary">Hasta Junio 30</span></p>
            </a>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4">Contacto</h3>
              <ul class="list-unstyled">
              	<li><a href="fb://outletEnLinea.co" target="blank"><i class="fa fa-facebook-square" style="color:var(--main-bg-color)"></i>/OutletEnLinea.co</a></li>
                <li><a href="http://www.instagram.com/outletEnLinea.info" target="blank"><i class="fa fa-camera-retro" style="color:var(--main-bg-color)"></i>@OutletEnLinea.info</a></li>
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
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> Todos los derechos reservados | <i class="icon-heart" aria-hidden="true"></i>  <a href="${url}home" target="_blank" class="text-primary"><%=Variables.pageName%></a>
            </p>
          </div>
          
        </div>
      </div>
    </footer>
    
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-140664519-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-140664519-1');
  
  
  function addCheckoutConversion(url) {
    var callback = function () {
      if (typeof(url) != 'undefined') {
        window.location = url;
      }
    };
    gtag('event', 'conversion', {
        'send_to': 'AW-742416802/zng2CI7e-KEBEKLDgeIC',
        'transaction_id': '',
        'event_callback': callback
    });
    return false;
  }
  function addCartConversion(url) {
	  var callback = function () {
	      if (typeof(url) != 'undefined') {
	        window.location = url;
	      }
	    };
	    gtag('event', 'conversion', {
	        'send_to': 'AW-742416802/ORJWCOjjiqIBEKLDgeIC',
	        'event_callback': callback
	    });
	    return false;
  }
  
  function addProductAddedToCart(url) {
	  var callback = function () {
	      if (typeof(url) != 'undefined') {
	        window.location = url;
	      }
	    };
	    gtag('event', 'conversion', {
	        'send_to': 'AW-742416802/IqutCJO3-KEBEKLDgeIC',
	        'event_callback': callback
	    });
	    return false;
  }
  function sendQuestionConversion(url) {
	  var callback = function () {
	    if (typeof(url) != 'undefined') {
	      window.location = url;
	    }
	  };
	  gtag('event', 'conversion', {
	      'send_to': 'AW-742416802/Oo2hCICDgqIBEKLDgeIC',
	      'event_callback': callback
	  });
	  return false;
	}
  

  
  
  
  
</script>
<!--Begin Comm100 Live Chat Code-->
<div id="comm100-button-301"></div>
<script type="text/javascript">
  var Comm100API=Comm100API||{};(function(t){function e(e){var a=document.createElement("script"),c=document.getElementsByTagName("script")[0];a.type="text/javascript",a.async=!0,a.src=e+t.site_id,c.parentNode.insertBefore(a,c)}t.chat_buttons=t.chat_buttons||[],t.chat_buttons.push({code_plan:301,div_id:"comm100-button-301"}),t.site_id=233313,t.main_code_plan=301,e("https://chatserver.comm100.com/livechat.ashx?siteId="),setTimeout(function(){t.loaded||e("https://hostedmax.comm100.com/chatserver/livechat.ashx?siteId=")},5e3)})(Comm100API||{})
</script>
<!--End Comm100 Live Chat Code-->

    