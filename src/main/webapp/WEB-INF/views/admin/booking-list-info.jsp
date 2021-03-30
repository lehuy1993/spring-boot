<%@page import="java.time.LocalDate"%>
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

					<!-- /.box-header -->
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title"></h3>
						</div>
						<div class="box-body">
							<section class="invoice">
     
						      <div class="row">
						        <div class="col-xs-12 table-responsive">
						          <table class="table table-striped">
						            <thead>
						            <tr>
						              <th>MovieName</th>
						              <th>Date</th>
						              <th>Time </th>
						              <th>Seat</th>
						              <th>Score</th>
						              <th>Total</th>
						            </tr>
						            </thead>
						            <tbody>
						            <tr>
						              <td>${invoice.movieName }</td>
						              <td>${invoice.bookingDate }</td>
						              <td>${invoice.scheduleShowTime }</td>
						              <td>${invoice.seat}</td>
						              <td>${invoice.useScore}</td>
						              <td class="text-danger">${invoice.totalMoney}</td>
						            </tr>
						           
						            </tbody>
						          </table>
						        </div>
						        <!-- /.col -->
						      </div>
							
							      <div class="row">
							        
							        <div class="col-xs-6" style="float: right">
							          <p class="lead">
							          Date: 
							          	<fmt:formatDate value="<%= new Date() %>" pattern="dd/MM/yyyy"/>
							          </p>
							          <div class="table-responsive">
							            <table class="table">
							              <tbody>
								              <tr>
								                <th style="width:50%">Full Name:</th>
								                <td>${invoice.account.fullName }</td>
								              </tr>
								              <tr>
								                <th>Phone</th>
								                <td>${invoice.account.phoneNumber }</td>
								              </tr>
								              <tr>
								                <th>Email:</th>
								                 <td>${invoice.account.email }</td>
								              </tr>
								              
							            </tbody>
							            </table>
							          </div>
							        </div>
							        <!-- /.col -->
							      </div>
							      <!-- /.row -->
							
							      <!-- this row will not appear when printing -->
							      <div class="row no-print">
							        <div class="col-xs-12">
							          <button type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i>
							         <a style="color: white;" href="/admin/bookinglist/${invoice.invoiceId}/true">Confirm</a> 
							          </button>
							         <button onclick="goBack()" type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
								            <i class="glyphicon glyphicon-remove"></i>
								 	Back</a> 
								      </button>
									</div>
							      </div>
							    </section>
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
function goBack() {
  window.history.back();
}
</script>
<script>
	$(function() {
		$(' #example1').DataTable()
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
