<!--
=========================================================
 Light Bootstrap Dashboard - v2.0.1
=========================================================

 Product Page: https://www.creative-tim.com/product/light-bootstrap-dashboard
 Copyright 2019 Creative Tim (https://www.creative-tim.com)
 Licensed under MIT (https://github.com/creativetimofficial/light-bootstrap-dashboard/blob/master/LICENSE)

 Coded by Creative Tim

=========================================================

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  -->
<%@ page pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Admin</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <style><%@include file="assets/css/bootstrap.min.css"%></style>
    <link href="../assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <style><%@include file="assets/css/light-bootstrap-dashboard.css"%></style>
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="../assets/css/demo.css" rel="stylesheet" />
    <style><%@include file="assets/css/demo.css"%></style>
        <style type="text/css">
    	img{
		width: 375px;
		height: 410px;	
		}
    
    </style>
      <base href="${pageContext.servletContext.contextPath}/">
</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-image="../assets/img/sidebar-5.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="user/index.htm" class="simple-text">
                        GEO SHOP
                    </a>
                </div>
                <ul class="nav">
                    <li>
                        <a class="nav-link" href="admin/dashboard.htm">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                    	<a class="nav-link" href="admin/user.htm?id=${sessionScope.manv}">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>User Profile</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="admin/product.htm">
                            <i class="nc-icon nc-notes"></i>
                            <p>Product</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="admin/type.htm">
                            <i class="nc-icon nc-paper-2"></i>
                            <p>Type</p>
                        </a>
                    </li>
                    
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="admin/product.htm">Product </a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                        </ul>
                        <ul class="navbar-nav ml-auto">
	                        	<li class="nav-item">
									<a class="nav-link" href="admin/user.htm?id=${sessionScope.manv}">
										<span class="no-icon">${sessionScope.tennv}</span>
									</a>
								</li>
                            <li class="nav-item">
                                <a class="nav-link" href="admin/logout.htm">
                                    <span class="no-icon">Log out</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <c:if test="${check==1}">       	            
	            <div class="content">
	                <div class="container-fluid">
	                    <div class="row">
	                        <div class="col-md-8">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">Edit Product</h4>
	                                </div>
	                                <div class="card-body">
	                                    <form:form action="admin/product/update.htm" modelAttribute="mh"  method="post" enctype="multipart/form-data">
	                                       <div class="row">
		                                       <div class="col-md-6 pr-1">
			                                       <label>Mã Sản Phẩm</label>
		                                            <form:input path="mamathang" disabled="true" type="text" class="form-control"/>
		                                       </div>                                       		
	                                       </div>
	                                        <div class="row">
	                                            <div class="col-md-6 pr-1">
	                                                <div class="form-group">
	                                                    <label>Tên Sản Phẩm</label>
	                                                    <div ><form:errors path="tenmathang" /></div>
	                                                    <form:input path="tenmathang"  type="text" class="form-control"/>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-6 pr-1">
	                                            <label>Loại</label>
	                                                <div class="form-group">
	                                                    <form:select path="loai.tenloai">
	                                                    	<c:forEach var="l" items="${loai}">
	                                                    		<div class="form-group"><form:option  value="${l.tenloai}"></form:option></div>                                                  		
	                                                    	</c:forEach>
	                                                    </form:select>                                                    
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="row">
	                                        	<div class="col-md-12">
	                                                <div class="form-group">
	                                                    <label for="exampleInputEmail1">Mô Tả</label>
	                                                    <div ><form:errors path="mota" /></div>
	                                                    <form:input path="mota" type="text" name="mail" class="form-control"/>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="row">
	                                            <div class="col-md-6 pr-1">
	                                                <div class="form-group">
	                                                    <label>Xuất Xứ</label>
	                                                    <div ><form:errors path="xuatxu" /></div>
	                                                    <form:input path="xuatxu" type="text" class="form-control" name="ten" />
	                                                </div>
	                                            </div>
	                                            <div class="col-md-6 pl-1">
	                                                <div class="form-group">
	                                                    <label>anh</label>
	                                                    <input name="photo" type="file" class="form-control" />
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="row">
	                                            <div class="col-md-6 pr-1">
	                                                <div class="form-group">
	                                                    <label>Giá Bán</label>
	                                                    <div ><form:errors path="giaban" /></div>                   
	                                                    <form:input path="giaban" type="text" class="form-control"  name ="giaban"/>
	                                                </div>
	                                            </div>                                         
	                                        </div>
	                                        <div>${mess}</div>
	                                        <button  type="submit" class="btn btn-info btn-fill pull-right">Update Product</button>
	                                        <div class="clearfix"></div>
	                                    </form:form>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-md-4">
	                            <div class="card card-user">
	                                	<img src="${mh.anh}" alt="...">
	                                <hr>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </c:if>
            <c:if test="${check==2}">           	            
	            <div class="content">
	                <div class="container-fluid">
	                    <div class="row">
	                        <div class="col-md-8">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">Insert Product</h4>
	                                </div>
	                                <div class="card-body">
	                                    <form:form action="admin/product/insert.htm" modelAttribute="mh" method="post"  enctype="multipart/form-data">
	                                        <div class="row">
	                                            <div class="col-md-6 pr-1">
	                                                <div class="form-group">
	                                                    <label>Tên Sản Phẩm</label>
	                                                    <div ><form:errors path="tenmathang" /></div>
	                                                    <form:input path="tenmathang" type="text" class="form-control"/>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-6 pr-1">
	                                            <label>Loại</label>
	                                                <div class="form-group">
	                                                    <form:select path="loai.tenloai">
	                                                    	<c:forEach var="l" items="${loai}">
	                                                    		<div class="form-group"><form:option  value="${l.tenloai}"></form:option></div>                                                  		
	                                                    	</c:forEach>
	                                                    </form:select>                                                    
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="row">
	                                        	<div class="col-md-12">
	                                                <div class="form-group">
	                                                    <label for="exampleInputEmail1">Mô Tả</label>
	                                                    <div ><form:errors path="mota" /></div>
	                                                    <form:input path="mota" type="text" name="mail" class="form-control"/>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="row">
	                                            <div class="col-md-6 pr-1">
	                                                <div class="form-group">
	                                                    <label>Xuất Xứ</label>
	                                                    <div ><form:errors path="xuatxu" /></div>
	                                                    <form:input path="xuatxu" type="text" class="form-control" name="ten" />
	                                                </div>
	                                            </div>
	                                            <div class="col-md-6 pl-1">
	                                                <div class="form-group">	                                               
	                                                    <label>anh</label>
	                                                     <div ><form:errors path="anh" /></div>
	                                                    <input name="photo" type="file" class="form-control" />
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="row">
	                                            <div class="col-md-6 pr-1">
	                                                <div class="form-group">
	                                                    <label>Giá Bán</label>
	                                                    <div ><form:errors path="giaban" /></div>                   
	                                                    <form:input path="giaban" type="text" class="form-control"  name ="giaban"/>
	                                                </div>
	                                            </div>                                         
	                                        </div>
	                                        <div>${mess}</div>
	                                        <button  type="submit" class="btn btn-info btn-fill pull-right">Insert Product</button>                                      
	                                        <div class="clearfix"></div>
	                                    </form:form>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </c:if>

            
            
            <footer class="footer">
                <div class="container-fluid">
                    <nav>
                        <ul class="footer-menu">
                            <li>
                                    Home
                            </li>
                            <li>                               
                                    Company
                            </li>
                            <li>
                                    Blog
                            </li>
                        </ul>
                        <p class="copyright text-center">
                            ©
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
                        </p>
                    </nav>
                </div>
            </footer>
        </div>
    </div>
    <!--   -->
    <!-- <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
        <a href="#" data-toggle="dropdown">
            <i class="fa fa-cog fa-2x"> </i>
        </a>

        <ul class="dropdown-menu">
			<li class="header-title"> Sidebar Style</li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>Background Image</p>
                    <label class="switch">
                        <input type="checkbox" data-toggle="switch" checked="" data-on-color="primary" data-off-color="primary"><span class="toggle"></span>
                    </label>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger background-color">
                    <p>Filters</p>
                    <div class="pull-right">
                        <span class="badge filter badge-black" data-color="black"></span>
                        <span class="badge filter badge-azure" data-color="azure"></span>
                        <span class="badge filter badge-green" data-color="green"></span>
                        <span class="badge filter badge-orange" data-color="orange"></span>
                        <span class="badge filter badge-red" data-color="red"></span>
                        <span class="badge filter badge-purple active" data-color="purple"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="header-title">Sidebar Images</li>

            <li class="active">
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-1.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-3.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="..//assets/img/sidebar-4.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-5.jpg" alt="" />
                </a>
            </li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard" target="_blank" class="btn btn-info btn-block btn-fill">Download, it's free!</a>
                </div>
            </li>

            <li class="header-title pro-title text-center">Want more components?</li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard-pro" target="_blank" class="btn btn-warning btn-block btn-fill">Get The PRO Version!</a>
                </div>
            </li>

            <li class="header-title" id="sharrreTitle">Thank you for sharing!</li>

            <li class="button-container">
				<button id="twitter" class="btn btn-social btn-outline btn-twitter btn-round sharrre"><i class="fa fa-twitter"></i> · 256</button>
                <button id="facebook" class="btn btn-social btn-outline btn-facebook btn-round sharrre"><i class="fa fa-facebook-square"></i> · 426</button>
            </li>
        </ul>
    </div>
</div>
 -->
</body>
<!--   Core JS Files   -->
<script src="../assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="../assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="../assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="../assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="../assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>

</html>
