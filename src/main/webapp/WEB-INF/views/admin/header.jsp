<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Movie Cinema  | Admin</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!-- Font Awesome -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
  
  <!-- Ionicons -->
  <!-- DataTables -->
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin/_all-skins.min.css">

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="${pageContext.request.contextPath}/" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Movie</b>Admin</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         <!-- IMG ADMIN -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
             <c:choose>
					<c:when test="${not empty member.image }">
						<img
							src="<%=request.getContextPath()%>/resources/img/${member.image}"
							class="user-image" alt="Card image">
					</c:when>
					<c:otherwise>
						<img
							src="<%=request.getContextPath()%>/resources/img/img_avatar1.png"
							class="user-image" alt="Card image">
					</c:otherwise>
				</c:choose>
              <span class="hidden-xs">${pageContext.request.userPrincipal.name}</span>
            </a>
           
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a  href="${pageContext.request.contextPath}/logout" >Logout</a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<c:choose>
					<c:when test="${not empty member.image }">
						<img
							src="<%=request.getContextPath()%>/resources/img/${member.image}"
							class="img-circle" alt="Card image">
					</c:when>
					<c:otherwise>
						<img
							src="<%=request.getContextPath()%>/resources/img/img_avatar1.png"
							class="img-circle" alt="Card image">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="pull-left info">
				<p>${pageContext.request.userPrincipal.name}</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
<spring:url value="/admin" var="myURL" />
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MAIN NAVIGATION</li>
			
				<li>
					<a href="${pageContext.request.contextPath}/admin/"> <i class="fa fa-share"></i>
						<span>Member</span> 
							<!-- <i class="fa fa-angle-left pull-right"></i> -->
						</span>
					</a>
					<!-- <ul class="treeview-menu">
						<li><a href="#"><i class="fa fa-circle-o"></i>View List</a></li>
						
					</ul> -->
				</li>
				<li >
					<a href="${pageContext.request.contextPath}/employee/showtime"> <i class="fa fa-share"></i>
						<span>Booking</span> <span class="pull-right-container">
						</span>
					</a>
				</li>
				<li >
					<a href="${pageContext.request.contextPath}/admin/bookinglist"> <i class="fa fa-share"></i>
						<span>Booking List</span> <span class="pull-right-container">
						</span>
					</a>
				</li>
				<li class="treeview">
					<a href=""> <i class="fa fa-share"></i>
						<span>Movie</span> <span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
            <li><a href="${myURL}/movie"><i class="fa fa-circle-o"></i>Movie List</a></li>
            <li><a href="${myURL}/add-movie"><i class="fa fa-circle-o"></i>Add Movie</a></li>
					</ul>
        </li>
				<li >
					<a href="${pageContext.request.contextPath}/admin/cinemaroom"> <i class="fa fa-share"></i>
						<span>Cinema Room</span> <span class="pull-right-container">
						</span>
					</a>
				</li>
				<li >
					<a href="${pageContext.request.contextPath}/admin/promotion"> <i class="fa fa-share"></i>
						<span>Promotion</span> <span class="pull-right-container">
						</span>
					</a>
				</li>
				<li >
					<a href="${pageContext.request.contextPath}/admin/employee"> <i class="fa fa-share"></i>
						<span>Employee</span> <span class="pull-right-container">
						</span>
					</a>
				</li>
				

		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
  