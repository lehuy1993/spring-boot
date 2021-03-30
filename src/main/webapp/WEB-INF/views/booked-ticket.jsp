<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
							Booked Ticket
						</div>
						<div class="card-body">
							<div class="row mb-3">
								<div class="col-md-6 form-inline ">
									<label>
										Show 
									</label>
									<select name="size" class="custom-select form-control ml-1 mr-1">
										<option value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option>
									</select> 
									<span>
										entries
									</span>
								</div>
								<div class="col-md-6 form-inline form-search">
									<label>Search: </label>
									<input type="search" class="form-control" placeholder="">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">MOVIE NAME</th>
												<th scope="col">BOOKING DATE</th>
												<th scope="col">TOTAL AMOUNT</th>
												<th scope="col">STATUS</th>
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
															${item.movieName}
														</td>
														 <td>
														 <fmt:parseDate  value="${item.bookingDate}"  type="date" pattern="yyyy-MM-dd" var="parsedDate" />
														<fmt:formatDate value="${parsedDate }" pattern="dd/MM/yyyy"/>
														
														</td>
														<td>
															${item.totalMoney}
														</td>
														<td class="text-primary font-weight-bold">
															${item.status}
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