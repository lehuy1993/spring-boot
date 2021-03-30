<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<title>Booked Ticket</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"/>
<script src="<%=request.getContextPath()%>/resources/js/history.js"></script>
</head>

<body>
	<%@ include file="includes/member-header.jsp"%>
	<div class="content">
		<div class="row mr-0">
			<%@ include file="includes/member-navleft.jsp"%>
			<div class="col-md-10 col-sm-9">
				<div class="main-content container">
					<div class="card shadow">
						<div class="card-header">
							History of score Adding / Using
						</div>
						<div class="card-body">
							<div class="row mb-3">
								<div class="col-12">
									<form action="${pageContext.request.contextPath}/member/history" method="GET">
										<div class="form-group row">
											<label for="jsFromDate" class="col-sm-2 col-form-label">From date <span class="text-danger">*</span></label>
											<div class="col-sm-4">
												<input type="text" class="form-control" id="jsFromDate" name="fromDate" value="${fromDate}" readonly>
											</div>
										</div>
										<div class="form-group row">
											<label for="jsToDate" class="col-sm-2 col-form-label">To date <span class="text-danger">*</span></label>
											<div class="col-sm-4">
												<input type="text" class="form-control" id="jsToDate" name="toDate" value="${toDate}" readonly>
											</div>
										</div>
										<div class="form-check offset-sm-2 row">
											<input class="form-check-input" type="radio" name="scoreType" id="exampleRadios1" value="1" 
											${scoreType == '1'?'checked':''}>
											<label class="form-check-label" for="exampleRadios1">
												History of score adding
											</label>
										</div>
										<div class="form-check offset-sm-2 mb-3 row">
											<input class="form-check-input" type="radio" name="scoreType" id="exampleRadios2" value="2"
											${scoreType == '2'?'checked':''}>
											<label class="form-check-label" for="exampleRadios2">
												History of score using
											</label>
										</div>
										<div class="offset-sm-2 row">
											<button type="submit" class="btn btn-primary" id="viewScore"><i class="fa fa-check"></i> View Score</button>
										</div>
									</form>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">DATE CREATED</th>
												<th scope="col">MOVIE NAME</th>
												<th scope="col">ADDED SCORE</th>
												<th scope="col">USED SCORE</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty list}">
												<tr>
													<td colspan="5" class="text-center"> Empty Data</td>
												</tr>
											</c:if>
											<c:if test="${not empty list}">
												<c:forEach items="${list}" var="item" varStatus="loop">
													<tr>
														<th scope="row">
															${(currentPage-1)*10 + loop.index + 1}
														</th>
														 <td>
														 <fmt:parseDate  value="${item.bookingDate}"  type="date" pattern="yyyy-MM-dd" var="parsedDate" />
														<fmt:formatDate value="${parsedDate }" pattern="dd/MM/yyyy"/>
														
														</td>
														<td>
															${item.movieName}
														</td>
														<td>
															<c:if test="${scoreType ==1}">
																${item.addScore}
															</c:if>
														</td>
														<td>
															<c:if test="${scoreType !=1}">
																${item.useScore}
															</c:if>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
								<c:if test = "${totalPage > 1}">
									<div class="col-12">
										<ul class="pagination justify-content-end">
											<c:if test = "${currentPage != 1}">
												<li class="page-item">
													<a class="page-link" href="<%=request.getContextPath()%>/member/booked-ticket?page=1">Previous</a>
												</li>
											</c:if>
											<c:forEach var = "i" begin = "${(currentPage-2)<=1?1:(currentPage-2)}" end = "${(currentPage+2)>totalPage?totalPage:(currentPage+2)}">
												<c:choose>
													<c:when test = "${currentPage == i}">
														<li class="page-item active">
															<span class="page-link">${i}</span>
														</li>
													</c:when>
													<c:otherwise>
														<li class="page-item">
															<a class="page-link" href="<%=request.getContextPath()%>/member/booked-ticket?page=${i}">${i}</a>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test = "${currentPage != totalPage}">
												<li class="page-item">
													<a class="page-link" href="<%=request.getContextPath()%>/member/booked-ticket?page=${totalPage}">Next</a>
												</li>
											</c:if>
										</ul>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>