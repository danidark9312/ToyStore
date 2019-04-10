<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<spring:url value="/resources" var="urlResources" />
	<spring:url value="/" var="url" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="${urlResources}/fonts/icomoon/style.css">


<%--     <link rel="stylesheet" href="${urlResources}/css/font-awesome.min.css"> --%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${urlResources}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${urlResources}/css/magnific-popup.css">
    <link rel="stylesheet" href="${urlResources}/css/jquery-ui.css">
    <link rel="stylesheet" href="${urlResources}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${urlResources}/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="${urlResources}/css/aos.css">

    <link rel="stylesheet" href="${urlResources}/css/style.css">
    <link rel="stylesheet" href="${urlResources}/css/general.css">
    <script>
    var context = '${url}';
    </script>
  </head>
  <body>
  
  <div class="site-wrap" ng-app="myApp" ng-controller="shopController">
    
   <jsp:include page="include/header.jsp" />

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-2">

            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">{{shopTitle}}</h2></div>
                <div class="d-flex">
                  <div class="dropdown mr-1 ml-md-auto">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Lo �ltimo
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                      <a class="dropdown-item" href="#">Hombres</a>
                      <a class="dropdown-item" href="#">Mujeres</a>
                      <a class="dropdown-item" href="#">Otros</a>
                    </div>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuReference" data-toggle="dropdown">Ordenar</button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                      <a class="dropdown-item" href="#">Destacado</a>
                      <a class="dropdown-item" href="#">Nombre, A a la Z</a>
                      <a class="dropdown-item" href="#">Nombre, Z a la A</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Precio, el mas bajo</a>
                      <a class="dropdown-item" href="#">Price, el mas alto</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row mb-5">
            <div>
	        </div>
	            <div ng-repeat="product in products" class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
	                <div class="block-4 text-center border">
	                  <figure class="block-4-image">
	                    <a href="shop-single.html">
	                    	<img src="${urlResources}/images/products/{{product.image}}" alt="Image placeholder" class="img-fluid">
	                    </a>
	                  </figure>
	                  <div class="block-4-text p-4">
	                    <h3><a href="shop-single.html">{{product.name}}</a></h3>
	                    <p class="mb-0">{{product.description}}</p>
	                    <p class="text-primary font-weight-bold">{{product.value | currency:"$":0}}</p>
	                    <span class="fa fa-star" ng-class="{checked: product.stars>0} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>1} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>2} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>3} "></span>
						<span class="fa fa-star" ng-class="{checked: product.stars>4} "></span>
	                  </div>
	                </div>
	              </div>
            </div>
            
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                    <li><a href="#">&lt;</a></li>
                    <li class="active"><span>1</span></li>
                    <li><a href="#">&gt;</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categorias</h3>
              <ul class="list-unstyled mb-0">
                <li class="mb-1"><a href="#" class="d-flex"><span>Hombre</span> <span class="text-black ml-auto">(2,220)</span></a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>Mujer</span> <span class="text-black ml-auto">(2,550)</span></a></li>
                <li class="mb-1"><a href="#" class="d-flex"><span>Otros</span> <span class="text-black ml-auto">(2,124)</span></a></li>
              </ul>
            </div>

            <div class="border p-4 rounded mb-4">
              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Filtro por precio</h3>
                <div id="slider-range" class="border-primary"></div>
                <input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
              </div>

              <!--  <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
                <label for="s_sm" class="d-flex">
                  <input type="checkbox" id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small (2,319)</span>
                </label>
                <label for="s_md" class="d-flex">
                  <input type="checkbox" id="s_md" class="mr-2 mt-1"> <span class="text-black">Medium (1,282)</span>
                </label>
                <label for="s_lg" class="d-flex">
                  <input type="checkbox" id="s_lg" class="mr-2 mt-1"> <span class="text-black">Large (1,392)</span>
                </label>
              </div>
				-->
              <!--  <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-danger color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Red (2,429)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-success color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Green (2,298)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-info color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Blue (1,075)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-primary color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Purple (1,075)</span>
                </a>
              </div>-->

            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12">
<!--             <div class="site-section site-blocks-2"> -->
<!--                 <div class="row justify-content-center text-center mb-5"> -->
<!--                   <div class="col-md-7 site-section-heading pt-4"> -->
<!--                     <h2>Categor�as</h2> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <div class="row"> -->
<!--                   <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay=""> -->
<!--                     <a class="block-2-item" href="#"> -->
<!--                       <figure class="image"> -->
<%--                         <img src="${urlResources}/images/women.jpg" alt="" class="img-fluid"> --%>
<!--                       </figure> -->
<!--                       <div class="text"> -->
<!--                         <span class="text-uppercase">Collections</span> -->
<!--                         <h3>Women</h3> -->
<!--                       </div> -->
<!--                     </a> -->
<!--                   </div> -->
<!--                   <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100"> -->
<!--                     <a class="block-2-item" href="#"> -->
<!--                       <figure class="image"> -->
<%--                         <img src="${urlResources}/images/children.jpg" alt="" class="img-fluid"> --%>
<!--                       </figure> -->
<!--                       <div class="text"> -->
<!--                         <span class="text-uppercase">Collections</span> -->
<!--                         <h3>Children</h3> -->
<!--                       </div> -->
<!--                     </a> -->
<!--                   </div> -->
<!--                   <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200"> -->
<!--                     <a class="block-2-item" href="#"> -->
<!--                       <figure class="image"> -->
<%--                         <img src="${urlResources}/images/men.jpg" alt="" class="img-fluid"> --%>
<!--                       </figure> -->
<!--                       <div class="text"> -->
<!--                         <span class="text-uppercase">Collections</span> -->
<!--                         <h3>Men</h3> -->
<!--                       </div> -->
<!--                     </a> -->
<!--                   </div> -->
<!--                 </div> -->
              
<!--             </div> -->
          </div>
        </div>
        
      </div>
    </div>

    <footer class="site-footer border-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5 mb-lg-0">
            <div class="row">
              <div class="col-md-12">
                <h3 class="footer-heading mb-4">Navigations</h3>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="#">Sell online</a></li>
                  <li><a href="#">Features</a></li>
                  <li><a href="#">Shopping cart</a></li>
                  <li><a href="#">Store builder</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="#">Mobile commerce</a></li>
                  <li><a href="#">Dropshipping</a></li>
                  <li><a href="#">Website development</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="#">Point of sale</a></li>
                  <li><a href="#">Hardware</a></li>
                  <li><a href="#">Software</a></li>
                </ul>
              </div>
            </div>
          </div>
<!--           <div class="col-md-6 col-lg-3 mb-4 mb-lg-0"> -->
<!--             <h3 class="footer-heading mb-4">Promo</h3> -->
<!--             <a href="#" class="block-6"> -->
<%--               <img src="${urlResources}/images/hero_1.jpg" alt="Image placeholder" class="img-fluid rounded mb-4"> --%>
<%--               <h3 class="${urlResources}/font-weight-light  mb-0">Finding Your Perfect Shoes</h3> --%>
<!--               <p>Promo from  nuary 15 &mdash; 25, 2019</p> -->
<!--             </a> -->
<!--           </div> -->
          <div class="col-md-6 col-lg-3">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4">Contact Info</h3>
              <ul class="list-unstyled">
                <li class="address">203 Fake St. Mountain View, San Francisco, California, USA</li>
                <li class="phone"><a href="tel://23923929210">+2 392 3929 210</a></li>
                <li class="email">emailaddress@domain.com</li>
              </ul>
            </div>

            <div class="block-7">
              <form action="#" method="post">
                <label for="email_subscribe" class="footer-heading">Subscribe</label>
                <div class="form-group">
                  <input type="text" class="form-control py-4" id="email_subscribe" placeholder="Email">
                  <input type="submit" class="btn btn-sm btn-primary" value="Send">
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy; ToysLove <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" class="text-primary"></a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
    </footer>
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
  
  <script src="${urlResources}/js/shop/shopController.js"></script>
  <script src="${urlResources}/js/shop/shopService.js"></script>
    
  </body>
</html>