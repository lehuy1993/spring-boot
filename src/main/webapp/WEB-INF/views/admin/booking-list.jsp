<%@page import="java.util.Date"%>
<%@page import="fa.spring.model.ShowDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/showtime_showmovie.css">

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Ticket booking management <small>Booking list</small>
		</h1>
		
	</section>
	
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">

				<!-- /.box -->
				<div class="box">
				<!-- Show msg -->
				<c:if test="${not empty msg }">
					<div id="msg" class="callout callout-success">
		          <p> ${msg } </p>
		        </div>
				</c:if>
				
					<!-- /.box-header -->
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title"></h3>
						</div>
						<div class="box-body">
							<!--  Form search -->
							<form id = "search-form">
								<div class="input-group input-group-lg">
									<div class="input-group-btn">
										<button type="submit" id="search-form" class="btn btn-info ">Search
									</div>
									<!-- /input-group -->
									<input id="search" type="text"
										placeholder="Booking Id, Member Id" class="form-control">
								</div>
							</form>
							
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Booking ID</th>
										<th>Member ID</th>
										<th>Full name</th>
										<th>Identity cart</th>
										<th>Phone number</th>
										<th>Movie</th>
										<th>Time</th>
										<th>Seat</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${not empty invoices }">
								<c:set var="id" value="1"></c:set>
								<c:forEach var="invoice" items="${invoices }">
									<tr>
										<td>${id }</td>
										<td>${invoice.invoiceId }</td>
										<td>${invoice.account.accountID }</td>
										<td>${invoice.account.fullName }</td>
										<td>${invoice.account.identityCard }</td>
										<td>${invoice.account.phoneNumber }</td>
										<td>${invoice.movieName }</td>
										<td>${invoice.bookingDate }</td>
										<td>${invoice.seat }</td>
											 <c:choose>
							                	<c:when test="${invoice.status == 1 }">
							                		<td><a type='submit' class='btn btn-primary'>Successful booking</a></td>
							                	</c:when>
							                	<c:otherwise>
							                		<td><a href=/admin/bookinglist/${invoice.invoiceId } class='btn btn-warning'>Get ticket</a></td>
							                	</c:otherwise>
							                </c:choose>
											
									</tr>
									<c:set var="id" value="${id +1 }"/>
								</c:forEach>
								</c:if>
									

								</tbody>
								
							</table>
							<!--   DATA -->
							<!-- /.box-body -->
							<div class="box-body">
								 <div id="feedback">
								 </div>
			              
							</div>
						</div>
						<!-- /.box-body -->
					</div>


					<!-- /.box-body -->
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
<script
	src="<%=request.getContextPath()%>/resources/js/admin/searchBookingList.js"></script>

<script>
	$(function() {
		$('#example1').DataTable({
			'paging' : false,
			'lengthChange' : false,
			'searching' : true,
			'ordering' : true,
			'info' : false,
			'autoWidth' : false
		})
	})
	 $("#msg").fadeOut(3000);
</script>
</body>
</html>
