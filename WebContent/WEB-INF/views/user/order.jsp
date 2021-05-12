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
<title>Free Leoshop Website Template | Home :: w3layouts</title>
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
<!-- start slider -->
<!--     <script src="js/jquery-ui.min.js"></script> -->
    <style><%@include file="css/fwslider.css"%></style>
    <script><%@include file="js/css3-mediaqueries.js"%></script>
    <script><%@include file="js/fwslider.js"%></script>
<!--end slider -->
  <script><%@include file="js/jquery.easydropdown.js"%></script>
  <base href="${pageContext.servletContext.contextPath}/">
  
  
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
	
	.flex {
  display: flex;
  flex-wrap: wrap;
}

.j-between {
  justify-content: space-between;
}

.a-start {
  align-items: flex-start;
}

.a-center {
  align-items: center;
}

.j-center {
  justify-content: center;
}

.row {
  display: flex;
  margin: -10px;
  flex-wrap: wrap;
}

.row {
  display: flex;
  margin: -10px;
  flex-wrap: wrap;
}

.container {
  width: 1200px;
  margin: o auto;
}

.section-cart .container h1 {
  font-family: "OswaldRegular";
  font-size: 30px;
  position: relative;
  padding: 10px;
  text-align: center;
  color: #f7941d;
}

.section-cart .container h1:after {
  position: absolute;
  bottom: 0;
  left: 50%;
  width: 80px;
  height: 2px;
  content: "";
  transform: translateX(-50%);
  background-color: gray;
}

.section-cart .container ul.head {
  border-bottom: 1px solid rgba(128, 128, 128, 0.6);
  justify-content: flex-end;
}

.section-cart .container ul.head li {
  font-size: 18px;
  padding: 10px;
  color: #39464f;
}

.section-cart .container ul.head li:last-child {
  margin: 0;
}

.section-cart .container ul.content {
  border-bottom: 1px solid rgba(128, 128, 128, 0.6);
}

.section-cart .container ul.content li img {
  width: 300px;
}

.section-cart .container ul.content li strong {
  color: #e60000;
}

.section-cart .container ul.content li span {
  display: inline-block;
  width: 20px;
  height: 20px;
  cursor: pointer;
  text-align: center;
  border: 1px solid black;
  border-radius: 50%;
}

.section-cart .container ul.content li input {
  width: 40px;
  margin: 0 15px;
  text-align: center;
  border: 1px solid black;
}

.section-cart .container ul.content li a {
  font-size: 20px;
  font-weight: 600;
  transition: all 0.4s;
  color: black;
}

.section-cart .container ul.content li a:hover {
  color: #f7941d;
}

.section-cart .container ul.content li p {
  position: relative;
  top: 0;
  width: 20px;
  height: 2px;
  transform: rotate(-45deg);
  background-color: red;
}

.section-cart .container ul.content li p a:before {
  position: absolute;
  top: 0;
  display: inline-block;
  width: 20px;
  height: 2px;
  content: "";
  transform: rotate(90deg);
  background-color: red;
}

.section-cart .container .sub-total {
  margin-top: 20px;
  justify-content: flex-end;
}

.section-cart .container .sub-total span {
  font-size: 20px;
  color: #39464f;
}

.section-cart .container .sub-total strong {
  padding-left: 150px;
  color: #e60000;
}

.section-cart .container .payment {
  margin-top: 20px;
  margin-bottom : 20px;
  justify-content: flex-end;
}

.section-cart .container .payment button {
  margin-right: 20px;
  padding: 10px 30px;
  cursor: pointer;
  transition: all 0.4s;
  border-radius: 5px;
  background-color: black;
}

.section-cart .container .payment button:hover {
  background-color: #731317;
}

.section-cart .container .payment button a {
  font-size: 14px;
  color: white;
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
	           <c:if test="${sizelist != 0}">
	            <h4 class="title">Your Order</h4>
	            		<div class="section-cart">
					      <div class="container">
					        <h1>Đơn Hàng</h1>
					        <ul class="head flex">					          
					          <li style="padding-right: 100px">Số lượng</li>
					          <li style="padding-right: 50px">Đơn giá</li>
					          <li style="padding-right: 100px">Ngày đặt</li>
					          <li style="padding-right: 30px">Tình Trạng</li>
					        </ul>
					        <c:forEach var="h" items="${hd}">
						          <ul class="content flex j-between a-center">
						          <li><img src="${h.mathang.anh}" alt="" /></li>
						          <li><a href="user/single.htm?id=${h.mathang.mamathang}">${h.mathang.tenmathang}</a></li>
						          
						          <li>
						            <span class="sub">-</span
						            ><input name="number" disabled="true" type="text" value="${h.soluong}" /><span class="plus"
						              >+</span
						            >
						          </li>
						          <li style="margin-left: 20px"><strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${h.thanhtien}"/> VNĐ</strong></li>
						           <li style="margin-right: 20px"><fmt:formatDate type="date" value="${h.ngay}" pattern="dd/MM/yyyy" /></li>
						           <c:if test="${h.thanhtoan == 0}">
					           	    	<li style="margin-right: 20px">Đang giao hàng</li>
					           	    </c:if>
					           	    <c:if test="${h.thanhtoan == 1}">
					           	    		<li style="margin-right: 20px">Hoàn thành</li>
					           	    </c:if>					          
						        </ul>
							
							</c:forEach>
							<div class="payment flex">
					          <button><a href="user/index.htm">Mua tiếp</a></button>
					        </div>
	           </c:if>
				<c:if test="${sizelist == 0}">
				   <h4 class="title">Order is empty</h4>
		    	     <p class="cart">You have no order in your shopping cart.<br>Click<a href="user/index.htm"> here</a> to shopping</p>				
				</c:if>
			</div>
    	</div>
    <div class="footer">
		<div class="footer-top">
			<div class="wrap">
			  <div class="section group example">
				<div class="col_1_of_2 span_1_of_2">
					<ul class="f-list">
					  <li><span class="f-text">Free Shipping on orders over $ 100</span><div class="clear"></div></li>
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
</body>
</html>