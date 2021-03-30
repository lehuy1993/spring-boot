<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="index/header.jsp"></jsp:include>
<style>
.invalid-feedback {
	display: block;
}
</style>
<body style="background-color: rgba(0, 0, 0, .03);">

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-7">
				<div class="card shadow-lg border-0 rounded-lg mt-5">
					<div class="p-2 mt-4 text-center">
						<!-- Log errror -->
						<h3>REGISTER ACCOUNT</h3>

					</div>
					<div class="card-body ml-3 mr-3">
						<spring:url value="/register"
							var="registerActionUrl" />
						<form:form action="${registerActionUrl}" method="POST"
							modelAttribute="registerForm">

							<div class="form-group">
								<form:input class="form-control py-4" placeholder="Username"
									path="userName" />
								<form:errors path="userName" class="invalid-feedback" />
							</div>

							<div class="form-group">
								<form:password cssClass="form-control py-4"
									placeholder="Password" path="password" />
								<form:errors path="password" cssClass="invalid-feedback" />
							</div>
							<div class="form-group">
								<form:password cssClass="form-control py-4"
									placeholder="Confirm password" path="confirmPassword" />
								<form:errors path="confirmPassword" cssClass="invalid-feedback" />
							</div>
							<div class="form-group">
								<form:input class="form-control py-4" placeholder="FullName"
									path="fullName" />
								<form:errors path="fullName" class="invalid-feedback" />
							</div>

							<div class="form-group">
								<fmt:formatDate pattern="yyyy-MM-dd" path="dateOfBirth" />
								<form:input class="form-control py-4"
									placeholder="Date of birth" path="dateOfBirth"
									onfocus="(this.type='date')" onblur="(this.type='text')"
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
								<form:input class="form-control py-4"
									placeholder="Identity card" path="identityCard" />
								<form:errors path="identityCard" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<form:input class="form-control py-4" placeholder="Email"
									path="email" />
								<form:errors path="email" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<form:input class="form-control py-4" placeholder="Address"
									path="address" />
								<form:errors path="address" class="invalid-feedback" />
							</div>
							<div class="form-group">
								<form:input class="form-control py-4" placeholder="Phone number"
									path="phoneNumber" />
								<form:errors path="phoneNumber" class="invalid-feedback" />
							</div>
							
							<div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

								<button type="submit"
									class="btn btn-primary btn-xs btn-block mt-5">Register</button>


							</div>
						</form:form>
					</div>

				</div>
				<div class="mt-4 text-center">
					Have an account already? <a class="text-dark"
						style="text-decoration: underline;"
						href="${pageContext.request.contextPath}/registration">Login</a>
				</div>
			</div>

		</div>
	</div>


	<jsp:include page="index/footer.jsp"></jsp:include>
