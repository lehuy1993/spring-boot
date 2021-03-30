<%@page import="java.util.Date"%>
<%@page import="fa.spring.model.ShowDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/showtime_showmovie.css">

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">


	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12" style="background-color: white">

				<!-- /.box -->
				<!-- Nav tabs -->
					<ul class="nav nav-tabs">
					<c:forEach var="showDate" items="${showDates}">
								  <li class=" text-center " style="width: 60px;" >
								  <a href="#${showDate.dateName.toLowerCase()}" data-toggle="tab">
								  <span
										class="">
											${showDate.showDate.getDate()}</span> ${showDate.dateName}
								  </a>
								  
								  </li>
						</c:forEach>
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content">
					<c:forEach var="showDate" items="${showDates}">
					  <div class="tab-pane " id="${showDate.dateName.toLowerCase()}">
						 <c:forEach var="showMovie" items="${showDate.movies}">
							<div class="  w-100 pt-5 pb-3 border-bottom d-inline-flex">
								<img style="width: 15%;" class=" img-thumbnail"
									src="<%=request.getContextPath()%>/resources/img/${showMovie.largeImage}">
								<div class="ml-5">
									<h4 class="card-title mb-1 name">
									<a class="text-decoration-none  "
									href="#">
									${showMovie.movieNameVN} </a>
									</h4>
									<p class=" small text-muted  mb-2">
										${showMovie.movieNameEnglish}</p>
											<c:if test="${not empty showMovie.schedules}">
												<!--  SHOW TIME -->
										<div>
											<c:forEach var="showTime" items="${showMovie.schedules}">
												<c:url var="bookingUrl"
													value="/employee/booking/tickets/${showMovie.movieId}">
													<c:param name="time" value="${showTime.scheduleId}" />
													<c:param name="date" value="${showDate.showDateId}" />
												</c:url>
												<c:set var="time" value="${showTime.scheduleTime }"></c:set>
												<c:set var="time2"
													value='<%=new Date().getHours() + ":00"%>'></c:set>
												<c:choose>
													<c:when test="${time <= time2 }">
													
													    <a href="#"
															class="btn btn-sm btn-showtime btn-outline-dark disabled"> <span
															class="time">${showTime.scheduleTime}</span>
														</a>
													  </c:when>
													<c:when test="${time > time2 }">
													    <a href="${bookingUrl }"
															class="btn btn-sm btn-showtime btn-outline-dark "> <span
															class="time">${showTime.scheduleTime}</span>
														</a>
													  </c:when>
													
												</c:choose>

											</c:forEach>

										</div>
										<!--  END SHOW TIME -->
												</c:if>
	
											</div>
										</div>
									</c:forEach>		  
							  </div>
						</c:forEach>
							  
					 				  					
					</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<footer class="main-footer">
	<strong>Copyright &copy; 2020 <a href="#">MovieCinema</a>.
	</strong> All rights reserved.
</footer>


</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script
	src="<%=request.getContextPath()%>/resources/js/admin/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<!-- DataTables -->
<script
	src="<%=request.getContextPath()%>/resources/js/admin/jquery.dataTables.min.js"></script>
<%-- <script src="<%=request.getContextPath()%>/resources/js/admin/dataTables.bootstrap.min.js"></script>
 --%>
<!-- AdminLTE App -->
<script
	src="<%=request.getContextPath()%>/resources/js/admin/adminlte.min.js"></script>

<script>
$(".tab-content .tab-pane").first().addClass(" active");
	$(function() {
		$('#example1').DataTable()
		$('#example2').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : false,
			'ordering' : true,
			'info' : true,
			'autoWidth' : false
		})
	})
</script>
</body>
</html>
