<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>MovieCinema</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Style Css -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">

</head>
<body>
	<div class="wrapper">
		<div class="page">
			<div class="mtw_banner_top">
				<div class="mtw_banner_top_content">
					<a href="#" target="_blank"> <img
						src="https://advserver.cgv.vn/www/images/e0b160ebe54fa49fd27794466581172e.jpg"
						width="980" height="80" alt="" title="" border="0"></a>
				</div>
			</div>
			<div class="header-login">
				<div class="header-container">
					<div class="header-top-account">
						<div class=" acccount-header-wrapper  mn-login">
							<!-- Login-Register -->
							<c:choose>
								<c:when test="${not empty pageContext.request.userPrincipal.name}">
						           <a href="${pageContext.request.contextPath}/member/history"> &nbsp Wellcome ${pageContext.request.userPrincipal.name}</a>  
                           			 <a href="${pageContext.request.contextPath}/logout"><i
									class="fa fa-sign-out" aria-hidden="true"></i>Logout</a>
						         </c:when>
						          <c:otherwise>
						            <a href="${pageContext.request.contextPath}/login"
										class="topskip-link skip-account text-decoration-none"> <span
										class="label">Đăng nhập/ Đăng ký</span>
									</a>
						         </c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<!-- Menu <HEADer></HEADer> -->
			<header id="header" class="page-header">
				<div class="page-header-container">
					<div id="header-nav">
						<nav>
							<ul class="primary-nav">
								<li><a href="${pageContext.request.contextPath}/"> HOME </a></li>
								<li><a href="${pageContext.request.contextPath}/member/show"> BOOKING </a></li>
							<!-- 	<li class="sub-nav"><a href="javascript:;">Góc điện ảnh</a>
									<div id="sub-menu">
										<ul class="undefined">
											<li><a href="dien-anh">Thể loại phim</a></li>
											<li><a href="dien-vien">Diễn viên</a></li>
											<li><a href="dao-dien">Đạo diễn</a></li>
											<li><a href="binh-luan-phim">Bình luận phim</a></li>
										</ul>
									</div>
								</li> -->

							</ul>
						</nav>
					</div>
				</div>
			</header>

			<!-- BODY -->

			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/resources/image/2048x682_1610618266142.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/resources/image/2048x682_1611196751479.png"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/resources/image/2048x682_1611211318409.jpg"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
