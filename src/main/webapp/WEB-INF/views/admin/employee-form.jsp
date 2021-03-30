<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="header.jsp"></jsp:include>
<style>
.invalid-feedback {
	color: red;
}
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Employee
			<c:choose>
					<c:when test="${employee['new']}">
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
							<c:when test="${not empty employee.image }">
								<img
									src="<%=request.getContextPath()%>/resources/img/${employee.image}"
									width="50px" height="50px" alt="Card image">
							</c:when>
							<c:otherwise>
								<img
									src="<%=request.getContextPath()%>/resources/img/img_avatar1.png"
									width="50px" height="50px" alt="Card image">
							</c:otherwise>
						</c:choose> 

						</div>
						<div class="box-body">
							<div class="box box-primary">
								<!-- /.box-header -->
								<!-- form start -->
								<form:form
									action="${pageContext.request.contextPath}/admin/employee/add"
									method="POST" enctype="multipart/form-data"
									modelAttribute="employee">
									<div class="box-body">
									 <div class="form-group">
									 <label>Acount</label>
										 <c:choose>
												<c:when test="${employee['new']}">
													<form:input class="form-control py-4" placeholder="Account"
														path="userName" />
													<form:errors path="userName" class="invalid-feedback" />
												</c:when>
												<c:otherwise>
													<p class="form-control py-4" >${employee.userName }</p>
												</c:otherwise>
										</c:choose> 
											
											
										</div> 
										
										<div class="form-group">
											<label>Password</label>
											<c:choose>
												<c:when test="${employee['new']}">
													<form:password value="${employee.password }"  placeholder="Password" class="form-control"  path="password"/>
													<form:errors path="password" class="invalid-feedback" />
												</c:when>
												<c:otherwise>
													<form:password value="${employee.password }"  placeholder="Password" class="form-control"  path="password"/>
												</c:otherwise>
											</c:choose> 
											
										</div>
										<div class="form-group">
											<label>Confirm Password</label>
											<form:password value="${employee.password }" placeholder="Confirm password" class="form-control"  path="confirmPassword"/>
											<form:errors path="confirmPassword" class="invalid-feedback" />
										</div>
										<div class="form-group">
											<label>Full Name</label>
											<form:input  placeholder="FullName" class="form-control"  path="fullName"/>
											<form:errors path="fullName" class="invalid-feedback" />
										</div>
										<div class="form-group">
											<label>Date of birth</label>
											<form:input class="form-control py-4" type="date"
												placeholder="Date of birth" path="dateOfBirth"
												id="date" />
											<form:errors path="dateOfBirth" class="invalid-feedback" />
										</div>
										<div class="form-group">
											<form:radiobutton path="gender" checked="checked" value="M" />
											Nam
											<form:radiobutton path="gender" value="F" />
											Nữ
											<form:errors path="gender" cssClass="error" />
										</div>
										<div class="form-group">
											<label>Identity card</label>
											<form:input class="form-control py-4"
											placeholder="Identity card" path="identityCard" />
											<form:errors path="identityCard" class="invalid-feedback" />
										</div>
										<div class="form-group">
											<label>Email</label>
											
											<c:choose>
												<c:when test="${employee['new']}">
													<form:input class="form-control py-4" placeholder="Email" type="email"
														path="email" />
													<form:errors path="email" class="invalid-feedback" />
												</c:when>
												<c:otherwise>
												
													<p class="form-control py-4" >${employee.email }</p>															
												</c:otherwise>
											</c:choose> 
										</div>
										<div class="form-group">
											<label>Address</label>
											<form:input class="form-control py-4" placeholder="Address"
											path="address" />
											<form:errors path="address" class="invalid-feedback" />
										</div>
											<div class="form-group">
											<label>Phone number</label>
											<form:input class="form-control py-4" placeholder="Phone number"
												path="phoneNumber" />
											<form:errors path="phoneNumber" class="invalid-feedback" />
										</div>
										<div class="form-group">
											<label for="exampleInputFile">Image</label>
											 <input type="file" accept="image/png, image/jpeg" value="" name="fileImage">

										</div>
										<c:if test="${!employee['new']}">
											<form:hidden class="form-control py-4" path="registerDate" />
											<form:hidden class="form-control py-4" path="image" />
											<form:hidden class="form-control py-4" path="userName" />
											<form:hidden class="form-control py-4" path="accountID" />
											<form:hidden class="form-control py-4" path="email" />
										</c:if>
									

									</div>
									<!-- /.box-body -->

									<div class="box-footer">
									<c:choose>
										<c:when test="${employee['new']}">
											<button type="submit" class="btn btn-primary">
																	<i class=" fa-plus fa"></i> Add
																</button>
										</c:when>
										<c:otherwise>
											<button type="submit" class="btn btn-primary">
																	<i class=" fa-plus fa"></i> Update
																</button>
										</c:otherwise>
									</c:choose> 
										
										<button onclick="goBack()" type="button"
											class="btn btn-primary " style="margin-left: 5px;">
											<i class="glyphicon glyphicon-remove"></i> Back</a>
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

<script>
	function goBack() {
		window.history.back();
	}
	
</script>
</body>
</html>
