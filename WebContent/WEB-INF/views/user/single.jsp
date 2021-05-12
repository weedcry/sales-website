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
<title>GEO Shop : ${mh.loai.tenloai}</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style><%@include file="css/style.css"%></style>
<style><%@include file="css/form.css"%></style>
<link href='http://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
<script><%@include file="js/jquery1.min.js"%></script>
<!-- start menu -->
<style><%@include file="css/megamenu.css"%></style>
<script><%@include file="js/megamenu.js"%></script>
<style><%@include file="css/number.css"%></style>
<script><%@include file="js/number.js"%></script>
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
	table{
	border-collapse: collapse;
	}
	th,td{
		line-height:5px;
		border: 2px solid black;
		padding: 15px;
		text-align: center;
	}
	img{
		width: 250px;
		height: 200px;	
	}
  </style>
    <base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
     <div class="header-top">
	   <div class="wrap"> 
			  <div class="header-top-left">
			  	   <div class="box">
   				      <select tabindex="4" class="dropdown">
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
				<div class="logo">
				<!-- 	<a href="user/index.html"><img src="image/logo.png" alt=""/></a> -->
				</div>
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
				<input type="text" name="s" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
				<input type="submit" value="Subscribe" id="submit" name="submit">
				<div id="response"> </div>
		 </div>
	  <div class="tag-list">
	    <ul class="last"><li><a href="user/cart.htm"><div>CART(${numcart})</div>
	      </a>
	     </li>
	    </ul>
	  </div>
    </div>
     <div class="clear"></div>
     </div>
	</div>
	
<div class="mens">    
  <div class="main">
     <div class="wrap">
     	<ul class="breadcrumb breadcrumb__t"><a class="home" href="user/index.htm">Home</a> / <a href="user/type.htm?id=${mh.loai.maloai}">${mh.loai.tenloai}</a> / ${mh.tenmathang}</ul>
		<div class="cont span_2_of_3">
		  	<div class="grid images_3_of_2">

						<ul id="etalage">
							<li>
								<a href="optionallink.html">	
								</a>
								<img src="${mh.anh}">
								<!-- <img class="etalage_thumb_image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0clzwIGzW95QZ156oGJgyqIbPrz9dPpM1zg&usqp=CAU" class="img-responsive" /> -->
							</li>
						</ul>
						 <div class="clearfix"></div>
	            </div>
		         <div class="desc1 span_3_of_2">
		         	<h3 class="m_3">${mh.tenmathang}</h3>
		             <p class="m_5"><fmt:formatNumber type="number" maxFractionDigits="3" value="${mh.giaban}"/> VNĐ</p>
		             
<!--  					<div class="value-button" id="decrease"
						onclick="decreaseValue()" value="Decrease Value">-</div>
						<input type="number" name ="son" />
					<div class="value-button" id="increase"
						onclick="increaseValue()" value="Increase Value">+</div>
						<div></div> -->
						<%-- <a type="submit" href="user/buy.htm?id=${mh.mamathang}" >buy</a></div> --%>
						<button><a class="btn_form"  href="user/buy.htm?id=${mh.mamathang}">Buy</a></button>		
					
				     <p class="m_text2"> ${mh.mota}</p>
			     </div>
			   <div class="clear"></div>	
	    <div class="clients">
	<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselDemo1").flexisel();
			$("#flexiselDemo2").flexisel({
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		
			$("#flexiselDemo3").flexisel({
				visibleItems: 5,
				animationSpeed: 1000,
				autoPlay: false,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
     </div>
     <div class="toogle">
     	<h3 class="m_3">Product Details</h3>
     	<p class="m_text">Mọi sản phẩm của Geo Shop được sản xuất 100% việt nam. Lắp ráp từ hệ thống máy móc hiện đại bậc nhất với chất liệu vải tơ tằm giúp bạn có trải nghiệm tốt nhất.</p>
     </div>
     <div class="toogle">
     	<h3 class="m_3">More Information</h3>
     	<p class="m_text">Mọi thông tin về chất liệu sản phẩm đều được bảo mật. Nếu bạn có nhu cầu biết về chất liệu hãy mua sử dụng nhé!</p>
     </div>
      </div>
			<div class="rsingle span_1_of_single">
				<h5 class="m_1">Categories</h5>
					<ul class="kids">
						<c:forEach var="l" items="${listloai}"> 
							<li><a href="user/type.htm?id=${l.maloai}">${l.tenloai}</a></li>
						</c:forEach>					
					</ul>
		       <script src="js/jquery.easydropdown.js"></script>
			</div>
		      <div class="clear"></div>
			</div>
			 <div class="clear"></div>
		   </div>
		</div>
	<div class="footer">
		<div class="footer-top">
			<div class="wrap">
			  <div class="section group example">
				<div class="col_1_of_2 span_1_of_2">
					<ul class="f-list">
					  <li><span class="f-text">Free Shipping on orders over 100000vnđ</span><div class="clear"></div></li>
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
						<div class="company_address">
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
	<c:if test="${kt == 0}">
		<script>
	        window.alert("bạn phải đăng nhập mới được phép mua hàng!");
	    </script> 
	</c:if>

</body>
</html>