<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE HTML>
<html>
<head>
<title>GEO Shop</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style><%@include file="css/dropdown.css"%></style>
<script><%@include file="js/dropdown.js"%></script>
<style><%@include file="css/style.css"%></style>
<style><%@include file="css/form.css"%></style>
<link href='http://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
<script><%@include file="js/jquery1.min.js"%></script>
<!-- start menu -->
<style><%@include file="css/megamenu.css"%></style>
<script><%@include file="js/megamenu.js"%></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!--start slider -->
<!--     <script src="js/jquery-ui.min.js"></script> -->
    <style><%@include file="css/fwslider.css"%></style>
    <script><%@include file="js/css3-mediaqueries.js"%></script>
    <script><%@include file="js/fwslider.js"%></script>
<!--end slider -->
  <script><%@include file="js/jquery.easydropdown.js"%></script>
  
  <style type="text/css">
  	ul li:hover > ul.dropdown {
	display: block;
	background-color:teal;

}

ul li > ul.dropdown {
	position: absolute;
	display: none;
	/* background-color: green; */
}
ul{
  position: relative;
  z-index: 5;
}
	img{
		width: 250px;
		height: 200px;	
	}
	.name{
		font-variant: small-caps;
		display: inline;
	}
  </style>
  <base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
     <div class="header-top">
	   <div class="wrap"> 
			  <div class="header-top-left">
			  	   <div class="box">
   				      <select tabindex="4" class="dropdown" style="position:relative;z-index:1">
							<option value="" class="label" value="">Language :</option>
							<option value="1">English</option>
							<option value="2">Vietnam</option>
					  </select>
   				    </div>
   				    <div class="clear"></div>
   			 </div>
			 <div class="cssmenu">
				<ul>
					<c:if test="${tenkh != null}">
						<li><a href="user/info.htm">Thông Tin Tài Khoản</a></li>					
						<li><a href="">${tenkh}</a>						
							<ul class="dropdown">
								<li><a href="user/order.htm">đơn hàng</a></li>
								<li><a href="user/cart.htm">giỏ hàng</a></li>
								<li><a href="user/logout.htm">logout</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${tenkh == null}">
						<li><a href="user/login.htm">Log In</a></li> |
						<li><a href="user/register.htm">Sign Up</a></li>
					</c:if>
					
				</ul>
			</div>
			<div class="clear"></div>
 		</div>
	</div>
	<div class="header-bottom">
	    <div class="wrap">
			<div class="header-bottom-left">
			
<!--  				<div class="logo">
					<a href="user/index.html"><img src="https://i.ibb.co/Zgw19xb/logo.png" alt=""/></a>
				</div> --> 
				
<!-- 				 <div class="logo">
                    <a href="user/index.htm" class="simple-text">
                        WEBQA
                    </a>
                </div> -->
				<div class="menu">
	            <ul class="megamenu skyblue">
	            <a href="user/index.htm"><img alt="" style=" width: 60px; height: 60px ; margin-right: 50px" src="https://i.ibb.co/Zgw19xb/logo.png"></a>
			<li class="active grid"><a href="user/index.htm">Home</a></li>			
				<li><a class="color5" href="#">SẢN PHẨM</a>
				<div class="megapanel">
					<div class="col1">
							<div class="h_nav">
								<h4>ÁO THUN</h4>
								<ul>
									<li><a href="mens.html">Áo thun tay ngắn</a></li>
									<li><a href="mens.html">Áo thun tay dày</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>ÁO KHOÁC</h4>
								<ul>
									<li><a href="mens.html">Áo khoác da</a></li>
									<li><a href="mens.html">Áo khoác lông</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>QUẦN</h4>
								<ul>
									<li><a href="mens.html">Quần đùi</a></li>
									<li><a href="mens.html">Quần dài</a></li>
								</ul>	
							</div>												
						</div>
					</div>
				</li>
<!-- 				<li><a class="color6" href="other.html">Other</a></li>
				<li><a class="color7" href="other.html">Purchase</a></li> -->
			</ul>
			</div>
		</div>
	   <div class="header-bottom-right">
         <div class="search">	  
				<input type="text" name="abcf" class="textbox" placeholder="Search"/>
<!-- 				<input type="submit" value="Subscribe" id="submit" name="submit"> -->
				<button style="padding-top: 7px;padding-bottom: 3px ; background-color: #1DC7EA"><a  style="color: white;" href="user/search.htm">Search</a></button>
				<div id="response"> </div>
		 </div>
	  <div class="tag-list">
	    <ul class="last"><li><a href="user/cart.htm">CART(${numcart})</a></li></ul>
	  </div>
    </div>
     <div class="clear"></div>
     </div>
	</div>
	<img  style="width: 1220px;height: 300px;margin-left: 150px" src="https://i.ibb.co/kDf919B/banner.png" alt=""/>
   <!-- start slider -->
    <div id="fwslider">
        <div class="slider_container">
            <div class="slide"> 
                <!-- Slide image -->
                    <img src="https://i.ibb.co/kDf919B/banner.png" alt=""/>
                <!-- /Slide image -->
                <!-- Texts container -->
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">Aluminium Club</h4>
                        <!-- /Text title -->
                        
                        <!-- Text description -->
                        <p class="description">Experiance ray ban</p>
                        <!-- /Text description -->
                    </div>
                </div>
                 <!-- /Texts container -->
            </div>
            <!-- /Duplicate to create more slides -->
            <div class="slide">
                <img src="https://i.ibb.co/kDf919B/banner.png" alt=""/>
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <h4 class="title">consectetuer adipiscing </h4>
                        <p class="description">diam nonummy nibh euismod</p>
                    </div>
                </div>
            </div>
            <!--/slide -->
        </div>
        <div class="timers"></div>
        <div class="slidePrev"><span></span></div>
        <div class="slideNext"><span></span></div>
    </div>
    <!--/slider -->
<div class="main">
	<div class="wrap">
		<div class="section group">
		  <div class="cont span_2_of_3">
		  	<c:if test="${tenloai == null}">
			   <h2 class="head">NEW Products</h2>
				<div class="top-box">
				<c:forEach var="mh"  items="${mathang}">
					<div class="col_1_of_3 span_1_of_3" style="margin:10px 15px 10px 0px ; height: 320px"> 
					   <a href="user/single.htm?id=${mh.mamathang}">
						<div class="inner_content clearfix">
							<div class="product_image">
								<img src="${mh.anh}">
							</div>	                    
		                    <div class="price">
							   <div class="cart-left">
									<p class="title">${mh.tenmathang}</p>
									<div class="price1">
									  <span class="actual"><fmt:formatNumber type="number" maxFractionDigits="3" value="${mh.giaban}"  /></span>
									  <span class="actual" >VNĐ</span>
									</div>
								</div>
								<div class="cart-right"> </div>
								<div class="clear"></div>
							 </div>				
		                   </div>
		                 </a>
						</div>			
				</c:forEach>
				
				</div>	
		  	</c:if>
		  	<c:if test="${tenloai != null }">
				  	<h2 class="head">${tenloai}</h2>
					<div class="top-box">
					<c:forEach var="mh"  items="${mathang}">
						<div class="col_1_of_3 span_1_of_3" style="margin:10px 15px 10px 0px ; height: 320px"> 
						   <a href="user/single.htm?id=${mh.mamathang}">
							<div class="inner_content clearfix">
								<div class="product_image">
									<img src="${mh.anh}">
								</div>	                    
			                    <div class="price">
								   <div class="cart-left">
										<p class="title">${mh.tenmathang}</p>
										<div class="price1">
										  <span class="actual"><fmt:formatNumber type="number" maxFractionDigits="3" value="${mh.giaban}"  /></span>
										  <span class="actual" >VNĐ</span>
										</div>
									</div>
									<div class="cart-right"> </div>
									<div class="clear"></div>
								 </div>				
			                   </div>
			                 </a>
							</div>			
					</c:forEach>				
					</div>			
		  	</c:if>
		 						 			    
		  </div>
			<div class="rsidebar span_1_of_left">
				<div class="top-border"> </div>
           <div class="top-border"> </div>
			<div class="sidebar-bottom">
			    <h2 class="m_1">Categories<br></h2>
			    				<ul class="kids" style="text-align: left; margin-left: 40px">
						<c:forEach var="l" items="${listloai}"> 
							<li><a href="user/type.htm?id=${l.maloai}">${l.tenloai}</a></li>
						</c:forEach>					
					</ul>
<!-- 			    <p class="m_text"></p>
			    <div class="subscribe"> -->
	  			</div>
			</div> 
	    </div>
	   <div class="clear"></div>
	</div>
	</div>
	</div>
   <div class="footer">
		<div class="footer-top">
			<div class="wrap">
			  <div class="section group example">
				<div class="col_1_of_2 span_1_of_2">
					<ul class="f-list">
					  <li><span class="f-text">Free Shipping on orders over 100.000vnđ</span><div class="clear"></div></li>
					</ul>
				</div>
				<div class="col_1_of_2 span_1_of_2">
					<ul class="f-list">
					  <li><span class="f-text">Call us! toll free-222-555-6666 </span><div class="clear"></div></li>
					</ul>
				</div>
				<div class="clear"></div>
		      </div>
			</div>
		</div>
		<div class="footer-middle">
			<div class="wrap">
			 <!-- <div class="section group">
			  	<div class="f_10">
					<div class="col_1_of_4 span_1_of_4">
						<h3>Facebook</h3>
						<script>(function(d, s, id) {
						  var js, fjs = d.getElementsByTagName(s)[0];
						  if (d.getElementById(id)) return;
						  js = d.createElement(s); js.id = id;
						  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
						  fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));</script>
						<div class="like_box">	
							<div class="fb-like-box" data-href="http://www.facebook.com/w3layouts" data-colorscheme="light" data-show-faces="true" data-header="true" data-stream="false" data-show-border="true"></div>
						</div>
					</div>
					<div class="col_1_of_4 span_1_of_4">
						<h3>From Twitter</h3>
						<div class="recent-tweet">
							<div class="recent-tweet-icon">
								<span> </span>
							</div>
							<div class="recent-tweet-info">
								<p>Ds which don't look even slightly believable. If you are <a href="#">going to use nibh euismod</a> tincidunt ut laoreet adipisicing</p>
							</div>
							<div class="clear"> </div>
						</div>
						<div class="recent-tweet">
							<div class="recent-tweet-icon">
								<span> </span>
							</div>
							<div class="recent-tweet-info">
								<p>Ds which don't look even slightly believable. If you are <a href="#">going to use nibh euismod</a> tincidunt ut laoreet adipisicing</p>
							</div>
							<div class="clear"> </div>
						</div>
					</div>
				</div>
				<div class="f_10">
					<div class="col_1_of_4 span_1_of_4">
					    <h3>Information</h3>
						<ul class="f-list1">
						    <li><a href="#">Duis autem vel eum iriure </a></li>
				            <li><a href="#">anteposuerit litterarum formas </a></li>
				            <li><a href="#">Tduis dolore te feugait nulla</a></li>
				             <li><a href="#">Duis autem vel eum iriure </a></li>
				            <li><a href="#">anteposuerit litterarum formas </a></li>
				            <li><a href="#">Tduis dolore te feugait nulla</a></li>
			         	</ul>
					</div>
					<div class="col_1_of_4 span_1_of_4">
						<h3>Contact us</h3>
						<div class="company_address">
					                <p>500 Lorem Ipsum Dolor Sit,</p>
							   		<p>22-56-2-9 Sit Amet, Lorem,</p>
							   		<p>USA</p>
					   		<p>Phone:(00) 222 666 444</p>
					   		<p>Fax: (000) 000 00 00 0</p>
					 	 	<p>Email: <span>mail[at]leoshop.com</span></p>
					   		
					   </div>
					   <div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="Google"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Linked in"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Rss"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Facebook"><a href="#" target="_blank"> </a></span></li>
						    </ul>
					   </div>
					</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		  </div>-->
		   
		   
		   
		   
		   
		   <div class="section group example">
			  <div class="col_1_of_f_1 span_1_of_f_1">
				 <div class="section group example">
				   <div class="col_1_of_f_2 span_1_of_f_2">
				      <h3>Facebook</h3>
						<script>(function(d, s, id) {
						  var js, fjs = d.getElementsByTagName(s)[0];
						  if (d.getElementById(id)) return;
						  js = d.createElement(s); js.id = id;
						  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
						  fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));</script>
						<div class="like_box">	
							<div class="fb-like-box" data-href="http://www.facebook.com/w3layouts" data-colorscheme="light" data-show-faces="true" data-header="true" data-stream="false" data-show-border="true"></div>
						</div>
 				  </div>
				  <div class="col_1_of_f_2 span_1_of_f_2">
						<h3>From Twitter</h3>
				       <div class="recent-tweet">
							<div class="recent-tweet-icon">
								<span> </span>
							</div>
							<div class="recent-tweet-info">
								<p>Ds which don't look even slightly believable. If you are <a href="#">going to use nibh euismod</a> tincidunt ut laoreet adipisicing</p>
							</div>
							<div class="clear"> </div>
					   </div>
					   <div class="recent-tweet">
							<div class="recent-tweet-icon">
								<span> </span>
							</div>
							<div class="recent-tweet-info">
								<p>Ds which don't look even slightly believable. If you are <a href="#">going to use nibh euismod</a> tincidunt ut laoreet adipisicing</p>
							</div>
							<div class="clear"> </div>
					  </div>
				</div>
				<div class="clear"></div>
		      </div>
 			 </div>
			 <div class="col_1_of_f_1 span_1_of_f_1">
			   <div class="section group example">
				 <div class="col_1_of_f_2 span_1_of_f_2">
				    <h3>Information</h3>
						<ul class="f-list1">
						    <li><a href="#">Duis autem vel eum iriure </a></li>
				            <li><a href="#">anteposuerit litterarum formas </a></li>
				            <li><a href="#">Tduis dolore te feugait nulla</a></li>
				             <li><a href="#">Duis autem vel eum iriure </a></li>
				            <li><a href="#">anteposuerit litterarum formas </a></li>
				            <li><a href="#">Tduis dolore te feugait nulla</a></li>
			         	</ul>
 				 </div>
				 <div class="col_1_of_f_2 span_1_of_f_2">
				   <h3>Contact us</h3>
						<div class="company_address" style="text-align: center;">
							   		<p>đường 120 ,HCM city,</p>
							   		<p>Vietnam</p>
					   		<p>Phone: 0965669609</p>
					   		<p>Fax: (000) 000 00 00 0</p>
					 	 	<p>Email: <span>weedcry74664@gmai.com</span></p>
					   		
					   </div>
					   <div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="Google"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Linked in"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Rss"><a href="#" target="_blank"> </a></span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Facebook"><a href="#" target="_blank"> </a></span></li>
						    </ul>
					   </div>
				</div>
				<div class="clear"></div>
		    </div>
		   </div>
		  <div class="clear"></div>
		    </div>
		  </div>
		</div>
		<div class="footer-bottom">
			<div class="wrap">
	             <div class="copy">
			        <p>ÃÂ© 2014 Template by <a href="http://w3layouts.com" target="_blank">w3layouts</a></p>
		         </div>
				<div class="f-list2">
				 <ul>
					<li class="active"><a href="about.html">About Us</a></li> |
					<li><a href="delivery.html">Delivery & Returns</a></li> |
					<li><a href="delivery.html">Terms & Conditions</a></li> |
					<li><a href="contact.html">Contact Us</a></li> 
				 </ul>
			    </div>
			    <div class="clear"></div>
		      </div>
	     </div>
	</div>
</body>
</html>