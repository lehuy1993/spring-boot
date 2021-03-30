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
					<h1>Booking Online</h1>
				</div>
				<div class="w-480 m-auto pt-5">
					<c:forEach var="seat" items="${seats}">
						
				 	<c:choose>
							<c:when test="${seat.seatType < 1  }">
								<div class=" seat-vipprime ${seat.seatStatus == 0 ? 'seat-disable' : 'active seat' } "
									onclick="selectedseats(this)" zone="VIP" loc="${seat.scheduleSeatId }"
									price="120000">${seat.seatColumn}${seat.seatRow }</div>
							</c:when>

							<c:otherwise>
								<div class="seat seat-standard ${seat.seatStatus == 0 ? 'seat-disable' : 'active' }"
									onclick="selectedseats(this)" zone="Thường"
									loc="${seat.scheduleSeatId }" price="115000">${seat.seatColumn}${seat.seatRow }
								</div>
							</c:otherwise>
							
						</c:choose>
						 
					</c:forEach>

				</div>
				<div class="m-auto col-5 border-bottom">
					<h4 class="text-secondary ">SCREEN</h4>
				</div>
				<div class="ticketbox-notice  col-5 m-auto">
					<div class="iconlist">
						<h6 class="icon checked">Checked</h6>
						<h6 class="icon occupied">Đã chọn</h6>
					</div>
					<div class="iconlist">
						<h6 class="icon zone-standard" title="Standard">Thường</h6>
						<h6 class="icon zone-vipprime" title="VIP">VIP</h6>

					</div>
				</div>

				<!-- Member -->
				<div id="accordion">
					<div class="card mt-5">
						<div class="card-header" id="headingOne">

							<button class="btn btn-link text-de" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">
								<h4 class="text-secondary ">Member infomartion</h4>
							</button>

						</div>

						<!-- create ticket -->
						<spring:url
							value="${pageContext.request.contextPath}/booking/tickets/info"
							var="ticketInfo" />
						<input type="hidden" name="movieName" value="${movie.movieNameVN}" />
						<div id="collapseOne" class="collapse "
							aria-labelledby="headingOne" data-parent="#accordion">
							<div class="card-body " style="font-size: 15px;">
								<div class=" member ">
									<p>Identity Card:</p>
									<br />
									<p>Full name:</p>
									<br />
									<p>Email:</p>
									<br />
									<p>Phone:</p>
									<br />
								</div>
								<div class="value ">

									<p>${member.identityCard}</p>
									<br />
									<p>${member.fullName}</p>
									<br />
									<p>${member.email}</p>
									<br />
									<p>${member.phoneNumber}</p>
									<br />
								</div>
							</div>
						</div>
					</div>

				</div>
				<h6 class="note">Please pick up the ticket 30 minutes before
					the show. After that time ticket will automaticcally cancel!</h6>
				<!-- END MEMBER -->
				<spring:url
					value="${pageContext.request.contextPath}/member/booking/tickets/info"
					var="bookingUrl" />
				<form:form action="${bookingUrl}" method="POST"
					modelAttribute="invoice">

					<input type="hidden" name="movieName" value="${movie.movieNameVN }" />
					<input type="hidden" name="scheduleShowTime" value="${time }" />
					<div class="bottom-content">
						<div class="format-bg-top"></div>

						<div class="minicart-wrapper">
							<ul>
								<li class="item first">
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
																	<td id="movieName" class="label">${movie.movieNameVN }</td>
																</tr>
																<tr>
																	<td id="duration" class="label">${movie.duration }phút</td>
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
													<td >Aeon Long Biên</td>
												</tr>
												<tr>
													<td class="label">Suất chiếu</td>
													<td id="time">${time}, ${date}</td>

												</tr>
												<tr>
													<td class="label">Phòng chiếu</td>
													<td id="cinemaRoomName">${cinemaRoomName}</td>
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
						<a class="btn-left" href="javascript: void(0);" title="Previous">Previous</a>
<div class="ticket-process-right btn-right">
				<button type="button" title="Proceed to Checkout" class="button btn-proceed-checkout btn-checkout" name="process" onclick="process(this);">
					<span><span admicro-data-event="101364" admicro-data-auto="1" admicro-data-order="true">Proceed to checkout</span></span>
				</button>
			</div>
						
				</form:form>
				<!-- END FORM -->
				<div class="format-bg-bottom"></div>
			</div>
		</div>
	</div>

<jsp:include page="index/footer.jsp"></jsp:include>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/booking.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/member.js"></script>
		
	
</body>
</html>