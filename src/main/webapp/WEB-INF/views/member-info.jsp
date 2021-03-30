<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="index/header.jsp"></jsp:include>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<style>
.invalid-feedback {
	display: block;
}
</style>
</head>
<body style="background-color: rgba(0, 0, 0, .03);">

	<div class="container p-0">
		<div class="row ">
			<div class="col-lg-12">
				<div class="card shadow-lg  rounded-lg mt-5">
					<div class="p-2 mt-4 text-center border-bottom mb-2">
						<!-- Log errror -->
						<h4>Account Information</h4>

					</div>
					<div class="card m-auto " style="width: 50px; height: 50px;">
						<c:choose>
							<c:when test="${not empty member.image }">
								<img
									src="<%=request.getContextPath()%>/resources/img/${member.image}"
									width="50px" height="50px" alt="Card image">
							</c:when>
							<c:otherwise>
								<img
									src="<%=request.getContextPath()%>/resources/img/img_avatar1.png"
									width="50px" height="50px" alt="Card image">
							</c:otherwise>
						</c:choose>
					


					</div>
					<div class="card-body ml-3 mr-3">
						<spring:url value="/member/info"
							var="uploadUrl" />
						<form:form action="${uploadUrl}" enctype="multipart/form-data"
							method="POST" modelAttribute="member">
							<div class="form-group">
								<label class="font-weight-bold">Account: <span
									class="text-danger">*</span></label>
								<form:input disabled="true" cssClass="form-control"
									placeholder="Account" path="accountID" />

							</div>
							<%-- <div class="form-group">
								<label class="font-weight-bold">Password: <span
									class="text-danger">*</span></label>
								<form:password cssClass="form-control py-4"
									placeholder="Password" value="${member.password }"
									path="password" />
								<form:errors path="password" cssClass="invalid-feedback" />
							</div>
							<div class="form-group">
								<label class="font-weight-bold">Confirm password: <span
									class="text-danger">*</span></label>
								<form:password cssClass="form-control py-4"
									placeholder="Confirm password" value="${member.password }"
									path="confirmPassword" />
								<form:errors path="confirmPassword" cssClass="invalid-feedback" />
							</div> --%>
							<div class="form-group">
								<label class="font-weight-bold">Full name: <span
									class="text-danger">*</span></label>
								<form:input class="form-control py-4" placeholder="FullName"
									path="fullName" />
								<form:errors path="fullName" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label class="font-weight-bold">Date of birth: <span
									class="text-danger">*</span></label>
								<form:input class="form-control py-4" placeholder="FullName"
									path="dateOfBirth" />

								<form:errors path="dateOfBirth" class="invalid-feedback" />


							</div>


							<div class="form-group">
								<label class="font-weight-bold">Gender: <span
									class="text-danger">*</span></label>
								<form:radiobutton path="gender" value="M" />
								Nam
								<form:radiobutton path="gender" value="F" />
								Nữ
								<form:errors path="gender" cssClass="error" />
							</div>

							<div class="form-group">
								<label class="font-weight-bold">Identity card: <span
									class="text-danger">*</span></label>
								<form:input class="form-control py-4"
									placeholder="Identity card" path="identityCard" />
								<form:errors path="identityCard" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label class="font-weight-bold">Email: <span
									class="text-danger">*</span></label>
								<form:input class="form-control py-4" placeholder="Email"
									path="email" />
								<form:errors path="email" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label class="font-weight-bold">Address: <span
									class="text-danger">*</span></label>
								<form:input class="form-control py-4" placeholder="Address"
									path="address" />
								<form:errors path="address" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label class="font-weight-bold">Phone number: <span
									class="text-danger">*</span></label>
								<form:input class="form-control py-4" placeholder="Phone number"
									path="phoneNumber" />
								<form:errors path="phoneNumber" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<label class="font-weight-bold">Image: <span
									class="text-danger">*</span></label> <input
									class=" form-control py-1 form-control-file"
									accept="image/png, image/jpeg" value="" name="fileImage"
									id="fileImage" type="file"> <img id="thumbnail"
									alt="Logo">

								<%-- src="<%=request.getContextPath()%>/resources/img/1.png" --%>
							</div>
							<div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

								<form:hidden class="form-control py-4" path="accountID" />
								<form:hidden class="form-control py-4" path="registerDate" />
								<form:hidden class="form-control py-4" path="userName" />
								<form:hidden class="form-control py-4" path="image" />
								<form:hidden class="form-control py-4" path="password" />


								<button type="reset" class="btn btn-warning">
									<i class="fa fa-history"></i> Reset
								</button>
								<button type="submit" class="btn btn-success">
									<i class="fa fa-plus"></i> Update
								</button>


							</div>
						</form:form>
					</div>

				</div>

			</div>

		</div>
	</div>


	<jsp:include page="index/footer.jsp"></jsp:include>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#fileImage').change(function() {
				showImagethumbnail(this);

			});
		});
		function showImagethumbnail(fileInput) {
			file = fileInput.files[0];
			reader = new FileReader();
			reader.onload = function(e) {
				$('#thumbnail').attr('src', e.target.result);
			}
			reader.readAsDataURL(file);
		}
	</script>
