<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
    <base href="${pageContext.servletContext.contextPath}/">
    <style type="text/css">
    	.chinhsua{
		    border-top:1px solid #ddd;	    
		    	font-size:0.95em;
				color:#777;
				padding: 8px;
				outline: none;
				margin:10px 0;
				width:91%;
				font-family: 'Exo 2', sans-serif;
				border:none;
				box-shadow:0 0 2px #aaa;
				-webkit-box-shadow:0 0 2px #aaa;
				-moz-box-shadow:0 0 2px #aaa;
				-o-box-shadow:0 0 2px #aaa;
		    
    	}
    	.chinhsua:hover {
		box-shadow:0 0 4px #aaa;
	-webkit-box-shadow:0 0 4px #aaa;
	-moz-box-shadow:0 0 4px #aaa;
	-o-box-shadow:0 0 4px #aaa;
	
}

    </style>
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
<%-- 					<c:if test="${tenkh != null}">
<!-- 						<li><a href="user/info.htm">Thông Tin Tài Khoản</a></li> -->
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
					</c:if>	 --%>
				</ul>
			</div>
			<div class="clear"></div>
 		</div>
	</div>
	<div class="header-bottom">
	    <div class="wrap">
			<div class="header-bottom-left">
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
	    <ul class="last"><li><a href="user/cart.htm">CART(${numcart})</a></li></ul>
	  </div>
    </div>
     <div class="clear"></div>
     </div>
	</div>

	
          <div class="register_account">
          	<div class="wrap">
          	<c:if test="${makh == null}">
          		  <h4 class="title">Create an Account</h4>
	    	      <form:form action="" modelAttribute="kh"   >
			    	 <div class="col_1_of_2 span_1_of_2">
			    	 	<div color="red"><form:errors path="ho" /></div>
			   			<div><form:input path="ho"  type="text"  name="Ho" placeholder="Họ"/></div>
			   			<div><form:errors path="ten" /></div>
			    		<div><form:input path="ten" type="text" name="Ten" placeholder="Tên"/></div>
			    	    <div><form:errors path="ngaysinh" /></div>
			    		<div><input name="ns" type="date" max="2010-12-31"/></div>
			    		<div><form:errors path="diachi" /></div>
			    		<div><form:input path="diachi" type="text" name="diachi" placeholder="Địa chỉ" /></div>	    		
			    	 </div>
			    	 <div class="col_1_of_2 span_1_of_2">
				    	 <form:select path="gioitinh">
				    	 	<form:option value="0">Nữ</form:option>
				    	 	<form:option value="1">Nam</form:option>
				    	 </form:select>			    	 		    		
				    	 <div ><form:errors path="sdt" /></div>
						 <div><form:input path="sdt" type="text" name="sdt" placeholder="SDT được sử dụng làm username" /></div>	
						 <div><form:errors path="password" /></div>	 			
				         <div ><form:input class="chinhsua" path="password"  type="password" name="password" placeholder="password" /></div>	
				         <div><form:errors path="mail" /></div>        
			          	<div><form:input  class="chinhsua"  path="mail"  type="email" name="mail" placeholder="E-Mail" /></div>
			         </div>
			         <div>${message}</div>
				     <button class="grey" type="submit">Submit</button>
				     <p class="terms">By clicking 'Create Account' you agree to the Terms &amp; Conditions.</p>
				     <div class="clear"></div>				    					
			    	</form:form>
          	</c:if>
          	<c:if test="${makh != null}">
          	      <h4 class="title">Info an Account</h4>
	    	      <form:form action="" modelAttribute="kh"   >
			    	 <div class="col_1_of_2 span_1_of_2">
			    	 	<div color="red"><form:errors path="ho" /></div>
			   			<div><form:input path="ho"  type="text"  name="Ho" placeholder="Họ"/></div>
			   			<div><form:errors path="ten" /></div>
			    		<div><form:input path="ten" type="text" name="Ten" placeholder="Tên"/></div>
			    	    <%-- <div><form:errors path="ngaysinh" /></div> --%>
			    		<div><input name="ns" type="date" max="2010-12-31" value="${kh.ngaysinh}" /></div>
			    		<div><form:errors path="diachi" /></div>
			    		<div><form:input path="diachi" type="text" name="diachi" placeholder="Địa chỉ" /></div>	    		
			    	 </div>
			    	 <div class="col_1_of_2 span_1_of_2">
				    	 <form:select path="gioitinh">
				    	 	<form:option value="0">Nữ</form:option>
				    	 	<form:option value="1">Nam</form:option>
				    	 </form:select>			    	 		    		
				    	 <div ><form:errors path="sdt" /></div>
						 <div><form:input path="sdt" disabled="true" type="text" name="sdt" placeholder="SDT được sử dụng làm username" /></div>	
						 <div><form:errors path="password" /></div>	 			
				         <div><form:input  class="chinhsua" path="password" disabled="true" type="password" name="password" placeholder="password" /></div>	
				         <div><form:errors path="mail" /></div>        
			          	<div><form:input class="chinhsua" path="mail" disabled="true"  type="email" name="mail" placeholder="E-Mail" /></div>
			         </div>
			         <div>${message}</div>
				     <button class="grey" type="submit">Submit</button>
				     <div class="clear"></div>				    					
			    	</form:form>
          	</c:if>

    		  
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
</body>
</html>