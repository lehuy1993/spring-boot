<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/403.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member.css">
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"/>


<style>
	label.form-check-label{
		font-weight: initial;
	}
</style>
<style>
.invalid-feedback {
	color: red;
}
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<section class="content">
		<div class="row">
			<div class="col-xs-12" style="background-color: white">
	
				<!-- /.box -->
	            <div class="box-header text-center">
	              <h3 class="box-title">Add New Movie</h3>
				</div>
				
	            <!-- /.box-header -->
				<div class="card-body">
					<div class="col-12">	
						<c:if test = "${not empty failureMsg}">
							<h4 class="text-danger">${failureMsg}</h4>	
						</c:if>
						<spring:url value="/admin" var="uploadUrl" />
						<form:form action="${uploadUrl}/add-movie" method="POST" modelAttribute="movieForm"  enctype="multipart/form-data">
							<div class="form-group">
								<label for="movieNameEnglish" class="font-weight-bolder">Movie name (ENG): <span class="text-danger">*</span> </label>
								<form:input class="form-control " placeholder="Movie name (ENG)"
									path="movieNameEnglish" />
								<form:errors path="movieNameEnglish" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label for="movieNameVN" class="font-weight-bolder">Movie name (VN): <span class="text-danger">*</span></label>
								<form:input class="form-control " placeholder="Movie name (VN)"
									path="movieNameVN" />
								<form:errors path="movieNameVN" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label for="fromDate" class="font-weight-bolder">Form Date: <span class="text-danger">*</span> </label>
								<form:input class="form-control " placeholder="Form Date" path="fromDate" readonly="true"/>
								<form:errors path="fromDate" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label for="toDate" class="font-weight-bolder">To Date: <span class="text-danger">*</span> </label>
								<form:input class="form-control " placeholder="To Date" path="toDate" readonly="true"/>
								<form:errors path="toDate" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label for="actor" class="font-weight-bolder">Actor: <span class="text-danger">*</span>  </label>
								<form:input class="form-control " placeholder="Actor"
									path="actor" />
								<form:errors path="actor" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label for="movieProductionCompany" class="font-weight-bolder">Movie Production Company: <span class="text-danger">*</span></label>
								<form:input class="form-control " placeholder="Movie Production Company"
									path="movieProductionCompany" />
								<form:errors path="movieProductionCompany" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label for="director" class="font-weight-bolder">Director: <span class="text-danger">*</span></label>
								<form:input class="form-control " placeholder="Director"
									path="director" />
								<form:errors path="director" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label for="duration" class="font-weight-bolder">Duration: <span class="text-danger">*</span></label>
								<form:input class="form-control " placeholder="Duration"
									path="duration" />
								<form:errors path="duration" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label for="version" class="font-weight-bolder">Version: <span class="text-danger">*</span></label>
								<form:input class="form-control " placeholder="Version"
									path="version" />
								<form:errors path="version" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label class="font-weight-bolder" style="display: block;">Type: <span class="text-danger">*</span></label>
								<div class="row">
									<c:forEach items="${types}" var="type" varStatus="loop">
										<div class="col-6 col-md-4">
											<form:checkbox class="form-check-input" path="types"  value="${type.typeId}"/>
											<label class="form-check-label" for="inlineRadio1">${type.typeName}</label>																
										</div>
									</c:forEach>
								</div>
								<form:errors path="types" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label class="font-weight-bolder">Cinema Room: <span class="text-danger">*</span></label>
								<form:select class="form-control" id="cinemaRoomId" name="cinemaRoomId" path="cinemaRoomId">
									<form:option value="0">Please Select Cinema Room</form:option>
									<c:forEach items="${cinemaRoomList}" var="cinemaRoom">
										<form:option value="${cinemaRoom.cinemaRoomId}">${cinemaRoom.cinemaRoomName}</form:option>
									</c:forEach>
								</form:select>
								<form:errors path="cinemaRoomId" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label class="font-weight-bolder"  style="display: block;">Schedules: <span class="text-danger">*</span></label>
								<div id="schedule" class="row">
							<%-- 		
									 <c:forEach items="${schedules}" var="schedule" varStatus="loop">
										<div class="col-6 col-md-3">
											<form:checkbox class="form-check-input" path="schedules" value="${schedule}"/>
											<label class="form-check-label" for="inlineRadio1">${schedule.scheduleTime}</label>																
										</div>
									</c:forEach>  --%>  
								</div>
								<form:errors path="schedules" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label for="content" class="font-weight-bolder">Content: <span class="text-danger">*</span></label>
								<form:textarea class="form-control" placeholder="Content"
									path="content" />
								<form:errors path="content" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label class="font-weight-bold">Image : </label> 
								<input class=" form-control py-1 form-control-file"
									accept="image/png, image/jpeg" value="" name="fileImage"
									id="fileImage" type="file"> 
								<form:errors name="fileImage" class="invalid-feedback" />
							</div>
							<div id="thumbnail" class="mt-2 mb-2 text-center">
							</div>
							<div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-check"></i> Add
								</button>
								<a class="btn btn-primary" href="${uploadUrl}/movie">
									<i class="fa fa-times"></i> Back
								</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>				
		</div>
	</section>
	<script type="text/javascript">
	$(document).ready(function() {	
		$('#toDate').datepicker({
			format: "dd/mm/yyyy"
		});
		$('#fromDate').datepicker({
			format: "dd/mm/yyyy"
		});
	})
	</script>
</div>
	<!-- /.content-wrapper -->
	<footer class="main-footer">
		<strong>Copyright &copy; 2020 <a href="#">MovieCinema</a>.
		</strong> All rights reserved.
	</footer>


</div>
<!-- ./wrapper -->

<!-- Bootstrap 3.3.7 -->
<!-- DataTables -->
<script
	src="<%=request.getContextPath()%>/resources/js/admin/jquery.dataTables.min.js"></script>
<%-- <script src="<%=request.getContextPath()%>/resources/js/admin/dataTables.bootstrap.min.js"></script>
 --%>
<!-- AdminLTE App -->
<script
	src="<%=request.getContextPath()%>/resources/js/admin/adminlte.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/my_jquery.js"></script>

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
