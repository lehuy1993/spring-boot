<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="index/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/showtime_showmovie.css">

</head>
<body>

	<div class="row justify-content-center"  style="background-color: rgba(0, 0, 0, .04);padding-bottom: 30px;">
		<div class="col-lg-10">
			<div class="mt-5">
				<h3 class="font-weight-bold text-center mb-4">SHOWTIMES</h3>

				<ul class="nav nav-tabs mb-3 border-0" id="myTab" role="tablist">

					<c:forEach var="showDate" items="${showDates}">
						<li class="nav-item rounded-circle  bg-white text-center mr-5"
							style="width: 60px;"><a
							class=" text-dark text-decoration-none"
							id="${showDate.dateName}-tab" data-toggle="pill"
							href='#${showDate.dateName}' role="tab" aria-controls="a"
							aria-selected="true"> <span class="d-block font-weight-bold">${showDate.showDate.getDate()}</span>
								${showDate.dateName}
						</a></li>

					</c:forEach>



				</ul>
				<div class="tab-content" id="pills-tabContent">
					<c:forEach var="showDate" items="${showDates}">
						<div class=" pl-3 bg-white shadow-sm tab-pane fade "
							id="${showDate.dateName}" role="tabpanel"
							aria-labelledby="${showDate.dateName}-tab">

							<!-- Show movie -->
							<c:forEach var="showMovie" items="${showDate.movies}">
								<div class=" w-100 pt-5 pb-3 border-bottom d-inline-flex">
									<img style="width: 15%;" class=" img-thumbnail"
										src="<%=request.getContextPath()%>/resources/img/${showMovie.largeImage}">
									<div class="ml-5">
										<h4 class="card-title mb-1 name">
											<a class="text-decoration-none  " href="#">
												${showMovie.movieNameVN } </a>
										</h4>
										<p class=" small text-muted  mb-2">
											${showMovie.movieNameEnglish }</p>

										<!--  SHOW TIME -->
										<div>
											<c:forEach var="showTime" items="${showMovie.schedules}">
												<c:url var="bookingUrl"
													value="/member/booking/tickets/${showMovie.movieId}">
													<c:param name="time" value="${showTime.scheduleId}" />
													<c:param name="date" value="${showDate.showDateId}" />
												</c:url>
												<c:set var="time" value="${showTime.scheduleTime }"></c:set>
												<c:set var="time2"
													value='<%=LocalDateTime.now().getHour() + ":00"%>'></c:set>
												<c:choose>
													<c:when test="${time <= time2 }">
													<%-- <a href="${bookingUrl }"
															class="btn btn-sm btn-showtime btn-outline-dark "> <span
															class="time">${showTime.scheduleTime}</span>
														</a> --%>
													    <a href="#"
															class="btn btn-sm btn-showtime btn-outline-dark disabled"> <span
															class="time">${showTime.scheduleTime}</span>
														</a> 
													  </c:when>
													<c:when test="${time >= time2 }">
												
													    <a href="${bookingUrl }"
															class="btn btn-sm btn-showtime btn-outline-dark "> <span
															class="time">${showTime.scheduleTime}</span>
														</a>
													  </c:when>
													
												</c:choose>

											</c:forEach>

										</div>
										<!--  END SHOW TIME -->

									</div>
								</div>

							</c:forEach>
							<!-- END SHOW MOVIE -->

						</div>
					</c:forEach>
				</div>
			</div>

		</div>

	</div>

	<jsp:include page="index/footer.jsp"></jsp:include>
	<script type="text/javascript">
		$("#pills-tabContent .tab-pane").first().addClass("show active");

		var data = $('span.time');
		var curentHour = new Date().getHours() + ':00';

		$(data).each(function() {
			$(this).attr('spec');
			console.log($(this).html())
			if ($(this).html() < curentHour) {

			}

		});
	</script>