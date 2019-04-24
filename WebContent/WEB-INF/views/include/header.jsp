<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />

<header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="site-logo">
                <a href="${url}" class="${urlResources}/js-logo-clone">ToysLove</a>
              </div>
            </div>

            <div class="col-12 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>
<!--                   <li><a href="#"><span class="icon icon-person"></span></a></li> -->
<!--                   <li><a href="#"><span class="icon icon-heart-o"></span></a></li> -->
                  <li>
<!--                     <a href="cart.html" class="site-cart"> -->

<!--                     <a href="cart" class="site-cart"> -->
<!--                       <span class="icon icon-shopping_cart"></span> -->
<!--                       <span class="count" id="itemsCant">0</span> -->
<!--                     </a> -->
                  </li> 
                  <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu" style="color: white;"></span></a></li>
                </ul>
              </div> 
            </div>

          </div>
        </div>
      </div>
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
<!--             <li class="has-children"> -->
<%--               <a href="${url}">Home</a> --%>
<!--               <ul class="dropdown"> -->
<!--                 <li><a href="#">Menu One</a></li> -->
<!--                 <li><a href="#">Menu Two</a></li> -->
<!--                 <li><a href="#">Menu Three</a></li> -->
<!--                 <li class="has-children"> -->
<!--                   <a href="#">Sub Menu</a> -->
<!--                   <ul class="dropdown"> -->
<!--                     <li><a href="#">Menu One</a></li> -->
<!--                     <li><a href="#">Menu Two</a></li> -->
<!--                     <li><a href="#">Menu Three</a></li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!--               </ul> -->
<!--             </li> -->
<!--             <li class="has-children"> -->
<!--               <a href="about.html">About</a> -->
<!--               <ul class="dropdown"> -->
<!--                 <li><a href="#">Menu One</a></li> -->
<!--                 <li><a href="#">Menu Two</a></li> -->
<!--                 <li><a href="#">Menu Three</a></li> -->
<!--               </ul> -->
<!--             </li> -->
            <li class="active"><a href="${url}">Tienda</a></li>
<!--             <li><a href="#">Catalogue</a></li> -->

            <li class="has-children">
              <a>Admin</a>
              <ul class="dropdown">
                <li><a href="${url}admin/products/list">Productos</a></li>
	             <li><a href="${url}admin/categories/list">Categorias</a></li>
	             <li><a href="${url}admin/client/list">Clientes</a></li>
              </ul>
            </li>

             
          </ul>
        </div>
      </nav> 
    </header>

