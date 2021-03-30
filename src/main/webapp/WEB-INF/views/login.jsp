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
<style>
.invalid-feedback {
	display: block;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
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
						           <a href="${pageContext.request.contextPath}/member/info"> &nbsp Wellcome ${pageContext.request.userPrincipal.name}</a>  
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
								<li><a href="${pageContext.request.contextPath}/member/show"> Mua vé </a></li>
								<li class="sub-nav"><a href="javascript:;">Góc điện ảnh</a>
									<div id="sub-menu">
										<ul class="undefined">
											<li><a href="dien-anh">Thể loại phim</a></li>
											<li><a href="dien-vien">Diễn viên</a></li>
											<li><a href="dao-dien">Đạo diễn</a></li>
											<li><a href="binh-luan-phim">Bình luận phim</a></li>
										</ul>
									</div></li>

							</ul>
						</nav>
					</div>
				</div>
			</header>


	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-5">
				<div class="card shadow-lg border-0 rounded-lg mt-5">
					<div class="p-2 mt-4 text-center">
						<!-- Log errror -->
						<h3>
							LOGIN
							
						</h3>
						<p><c:if test="${logout != null} ">
							<p class="alert alert-warning">${logout  }</p>
						</c:if>
						
						<c:if test="${error != null}">
							<p class="alert alert-warning">${error }</p>
						</c:if>
						</p>

					</div>
					<div class="card-body">
						<spring:url value="/login"
							var="loginUrl" />

						<form:form action="${loginUrl}" method="POST"
							modelAttribute="loginForm">

							<div class="form-group">
								<input class="form-control py-4" name="userName"
									id="inputUserName" type="text" placeholder="Username">
							</div>
							<div class="form-group">
								<input class="form-control py-4" name="password"
									id="inputPassword" type="password" placeholder="Password">
							</div>


							<div>

								<button type="submit"
									class="btn btn-primary btn-xs btn-block mt-5">
									<i class="fa fa-sign-in" aria-hidden="true"></i> Login
								</button>


							</div>
						</form:form>
					</div>

				</div>
				<div class="mt-4 text-center">
					Don't have an account yet? <a class="text-dark"
						style="text-decoration: underline;"
						href="${pageContext.request.contextPath}/register">Register
						now !</a>
				</div>
			</div>

		</div>
	</div>


		<jsp:include page="index/footer.jsp"></jsp:include>
