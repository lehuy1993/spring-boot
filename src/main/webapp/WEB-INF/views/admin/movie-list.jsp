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

<script src="<%=request.getContextPath()%>/resources/js/my_jquery.js"
	type="text/javascript"></script>

<spring:url value="/admin" var="myRUL" />

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="content">
		<div class="row">
			<div class="col-xs-12" style="background-color: white">

				<!-- /.box -->
				<div class="box-header text-center">
					<h3 class="box-title">Movie List</h3>
					<c:if test="${not empty msg }">
						<div id="msg" class="callout callout-success">
							<p>${msg }</p>
						</div>
					</c:if>
				</div>
				<div class="card-body">
					<div class="col-12 form-inline ">
						<a class="btn btn-primary btn-add" href="${myRUL}/add-movie"><i
							class="fa fa-plus-circle"></i> Add new</a>
					</div>
					<div class="col-12" style="text-align: right;">
						<div class="form-search">
							<label>Search: </label>
							<form action="${pageContext.request.contextPath}" method="GET">
								<div class="header__search">
									<div class="input-group">
										<input type="text" class="form-control" id="searchKey"
											name="searchKey" value="${searchKey}" /> <span
											class="input-group-btn">
											<button class="btn btn-custom" type="submit">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-12">
						<div class="table-responsive">
							<table class="table table-striped table-hover" id="movieTable">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Movie (EN)</th>
										<th scope="col">Movie (VN)</th>
										<th scope="col">Release Date</th>
										<th scope="col">Movie Production Company</th>
										<th scope="col">Duration</th>
										<th scope="col">Version</th>
										<th scope="col">Detail</th>
										<th scope="col">Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list}">
										<tr>
											<td colspan="9" class="text-center">Empty Data</td>
										</tr>
									</c:if>
									<c:if test="${not empty list}">
										<c:forEach items="${list}" var="item" varStatus="loop">
											<tr>
												<th scope="row">${(currentPage-1)*10 + loop.index + 1}
												</th>
												<td>${item.movieNameEnglish}</td>
												<td>${item.movieNameVN}</td>
												<td><fmt:formatDate pattern="dd/MM/yyyy"
														value="${item.fromDate}" /></td>
												<td>${item.movieProductionCompany}</td>
												<td>${item.duration}</td>
												<td>${item.version}</td>
												<td><a class="fa fa-pencil-square-o text-primary"
													href="${myRUL}/edit-movie/${item.movieId}"></a></td>
												<td><a
													class="fa fa-trash-o text-primary js-movie-delete"
													data-id="${item.movieId}"></a></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<c:if test="${totalPage > 1}">
						<c:url value="${pageContext.request.contextPath}"
							var="paginationURL">
							<c:if test="${not empty searchKey}">
								<c:param name="searchKey" value="${searchKey}"></c:param>
							</c:if>
							<c:param name="page"></c:param>
						</c:url>
						<div class="col-12" style="text-align: right;">
							<ul class="pagination">
								<c:if test="${currentPage != 1}">
									<li class="page-item"><a class="page-link"
										href="${paginationURL}1">Previous</a></li>
								</c:if>
								<c:forEach var="i"
									begin="${(currentPage-2)<=1?1:(currentPage-2)}"
									end="${(currentPage+2)>totalPage?totalPage:(currentPage+2)}">
									<c:choose>
										<c:when test="${currentPage == i}">
											<li class="page-item active"><span class="page-link">${i}</span>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${paginationURL}${i}">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${currentPage != totalPage}">
									<li class="page-item"><a class="page-link"
										href="${paginationURL}${totalPage}">Next</a></li>
								</c:if>
							</ul>
						</div>
					</c:if>
				</div>

			</div>
		</div>
	</div>
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
	src="<%=request.getContextPath()%>/resources/js/admin/jquery.dataTables.min.js"
	type="text/javascript"></script>
<%-- <script src="<%=request.getContextPath()%>/resources/js/admin/dataTables.bootstrap.min.js"></script>
--%>
<!-- AdminLTE App -->
<script
	src="<%=request.getContextPath()%>/resources/js/admin/adminlte.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
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
<body></body>
<html></html>