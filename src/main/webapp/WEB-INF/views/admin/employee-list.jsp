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
			Employee <small>Display list</small>
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
							<p>${msg }</p>
						</div>
					</c:if>

					<!-- /.box-header -->
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title"></h3>
							<a href="${pageContext.request.contextPath}/admin/employee/add">
							<button type="button" class="btn  btn-success btn-lg w-25"><i class=" fa fa-plus"></i>
							
								  Add
							
							</button>
							</a>
						</div>
						<div class="box-body">
							<!--  Form search -->
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Username</th>
										<th>Full name</th>
										<th>Date of birth </th>
										<th>Gender </th>
										<th>Email </th>
										<th>Identity card </th>
										<th>Phone number </th>
										<th>Address </th>
										<th>Register date </th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${not empty employees }">
								<c:set var="id" value="1"></c:set>
								<c:forEach var="employee" items="${employees }">
									<tr>
										<td>${id }</td>
										<td>${employee.userName }</td>
										<td>${employee.fullName }</td>
										<td><fmt:formatDate value="${employee.dateOfBirth }" pattern="dd/MM/yyyy"/></td>
										<td>${employee.gender }</td>
										<td>${employee.identityCard }</td>
										<td>${employee.phoneNumber }</td>
										<td>${employee.address }</td>
										<td><fmt:formatDate value="${employee.registerDate }" pattern="dd/MM/yyyy"/></td>
										
       									<c:url var="updateLink" value="/admin/employee/update">
											<c:param name="employeeId" value="${employee.accountID}" />
										</c:url>
										
										<td>
											<a href="${updateLink}">
												<i class="fa fa-edit">Edit</i>
											</a>
										</td>
										<c:url var="deleteLink" value="/admin/employee/delete">
											<c:param name="employeeId" value="${employee.accountID}" />
										</c:url>
										<td><a href="${deleteLink}"
										onclick="if (!(confirm('Are you sure you want to delete  ?'))) return false"><i
											class="fa fa-trash-o" aria-hidden="true"></i> Delete</a></td>
										</tr>
								</c:forEach>
								</c:if>
									

								</tbody>
								
							</table>
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
	<strong>Copyright &copy; 2021 <a href="#">MovieCinema</a>.
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
