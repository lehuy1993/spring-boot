<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="index/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/booking.css">



			<div class="ticketbox  col-12 mt-5 ">
				<div class="page-title">
					<h1>TICKET INFORMATION</h1>
				</div>


				<!-- Member -->
				<div id="accordion">
					<div class="card mt-5">
						<div class="card-header" id="headingOne">

							<button class="btn btn-link text-de" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">
								<h4 class="text-secondary ">Booking ticket infomartion</h4>
							</button>

						</div>

						<div id="collapseOne" class="collapse show "
							aria-labelledby="headingOne" data-parent="#accordion">
							<div class="card-body  " style="font-size: 15px;">
								<div class=" member ">
									
									<p>Identity Card:</p>
									<br />
									<p>Full name:</p>
									<br />
									<p>Email:</p>
									<br />
									<p>Phone:</p>
								</div>
								<div class="value ">

									<p>${member.identityCard}</p>
									<br />
									<p>${member.fullName}</p>
									<br />
									<p>${member.email}</p>
									<br />
									<p>${member.phoneNumber}</p>
								</div>
							</div>
						</div>
					</div>

				</div>
				<h6 class="note">Please pick up the ticket 30 minutes before
					the show. After that time ticket will automaticcally cancel!</h6>
				<!-- END MEMBER -->

				<div class="bottom-content">
					<div class="format-bg-top"></div>

					<div class="minicart-wrapper">
						<ul>
							<li class="item first" xmlns="http://www.w3.org/1999/html">
								<div class="product-details">
									<table class="info-wrapper">
										<colgroup>
											<col width="40%">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<td id = "img"><img
													src="<%=request.getContextPath()%>/resources/img/${movie.largeImage}"></td>
												<td>
													<table class="info-wrapper">
														<tbody>
															<tr>
																<td id="movieName" class="label"></td>
															</tr>
															<tr>
																<td id="duration" class="label">phút</td>
															</tr>

														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</li>

							<li class="item" xmlns="http://www.w3.org/1999/html">
								<div class="product-details">
									<table class="info-wrapper">
										<tbody>
											<tr>
												<td class="label">Rạp</td>
												<td>Aeon Long Biên</td>
											</tr>
											<tr>
												<td class="label">Suất chiếu</td>

												<td id = "time">
												</td>
											</tr>
											<tr>
												<td class="label">Phòng chiếu</td>
												<td id = "cinemaRoomName">${cinemaRoomName}</td>
											</tr>
											<tr class="block-seats" style="display: none;">
												<td class="label">Ghế</td>
												<td class="data"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</li>

							<li class="item" xmlns="http://www.w3.org/1999/html">
								<div class="product-details">
									<table class="info-wrapper">
										<thead>
											<tr class="block-box">
												<td class="label">Tổng</td>
												<td class="price"><span class="price">0,00&nbsp;₫</span></td>

											</tr>
										</thead>


									</table>
								</div>
							</li>
						</ul>
					</div>
<a class="btn-left" href="${pageContext.request.contextPath}/" title="Previous">Previous</a>

					<div class="format-bg-bottom"></div>
				</div>
			</div>
		</div>

<jsp:include page="index/footer.jsp"></jsp:include>
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
		

		<script src="<%=request.getContextPath()%>/resources/js/ticket-info.js">
			
		</script>
</body>
</html>