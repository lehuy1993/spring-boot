<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<jsp:include page="header.jsp"></jsp:include>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"/>

<script src="<%=request.getContextPath()%>/resources/js/my_jquery.js"></script>

<style>
.invalid-feedback{
color:red;
}
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Promotion 
				
				<c:choose>
					<c:when test="${promotion['new']}">
		            	<small>Add new</small>
		        	</c:when>
					<c:otherwise>
		          	<small>Edit</small>
		        </c:otherwise>
			</c:choose>
				
		</h1>

	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">

				<!-- /.box -->
				<div class="box">
					<!-- Show msg -->

					<!-- /.box-header -->
					<div class="box box-info">
						<div class="box-header with-border text-center">
						<c:choose>
								<c:when test="${promotion['new']}">
					            	
					        	</c:when>
								<c:otherwise>
					          	<img
								src="<%=request.getContextPath()%>/resources/img/${promotion.image}"
								width="250px" height="250px" alt="Card image">
					       		 </c:otherwise>
						</c:choose>
						
						</div>
						<div class="box-body">
							<div class="box box-primary">
								<!-- /.box-header -->
								<!-- form start -->
								<form:form action="${pageContext.request.contextPath}/admin/promotion/add"
								method="POST" enctype="multipart/form-data" modelAttribute="promotion">
									<div class="box-body">
										<div class="form-group">
											<label>Title</label>
											<form:input  placeholder="Title" class="form-control"  path="title"/>
											<form:errors path="title" class="invalid-feedback" />
										</div>
										<div class="form-group">
								<label for="startTime">Start Time : </label>
								<form:input class="form-control py-4" placeholder="Start Time" path="startTime" readonly="true"/>
								<form:errors path="startTime" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label for="endTime">End Time : </label>
								<form:input class="form-control py-4" placeholder="End Time" path="endTime" readonly="true"/>
								<form:errors path="endTime" class="invalid-feedback" />
							</div>
										<div class="form-group">
											<label>Discount Level</label>
											<form:input  placeholder="Discount Level" class="form-control"  path="discountLevel"/>
											<form:errors path="discountLevel" class="invalid-feedback" />
										</div>
										<div class="form-group">
											<label>Detail</label>
											<form:input  placeholder="Detail" class="form-control"  path="detail"/>
											<form:errors path="detail" class="invalid-feedback" />
										</div>
										<div class="form-group">
											<label for="exampleInputFile">File input</label>
											 <input type="file" accept="image/png, image/jpeg" value="" name="fileImage">

										</div>
										
									</div>
									<!-- /.box-body -->

									<div class="box-footer">
										<button type="submit" class="btn btn-primary">
										<i class=" fa-plus fa"></i>
										
										<c:choose>
											<c:when test="${promotion['new']}">
								            	Add
								        	</c:when>
											<c:otherwise>
								          	Update
								          	<form:hidden class="form-control py-4" path="promotionId" />
									        </c:otherwise>
										</c:choose>
										</button>
										<button onclick="goBack()" type="button" class="btn btn-primary " style="margin-left: 5px;">
								            <i class="glyphicon glyphicon-remove"></i>
									 			Back</a> 
									      </button>
									</div>
								</form:form>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	
<script type="text/javascript">
	
		$('#endTime').datepicker({
			format: "dd/mm/yyyy"
		});
		$('#startTime').datepicker({
			format: "dd/mm/yyyy"
		});
	
	</script>
<script type="text/javascript">
function goBack() {
  window.history.back();
}

</script>
</body>
</html>
