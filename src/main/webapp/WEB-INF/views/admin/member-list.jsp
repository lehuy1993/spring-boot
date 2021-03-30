<%@page import="java.util.Date"%>
<%@page import="fa.spring.model.ShowDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/showtime_showmovie.css">

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">


	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12" style="background-color: white">

				<!-- /.box -->
            <div class="box-header">
              <h3 class="box-title">List member</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Member Id</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Address</th>
                  <th>Phone</th>
                   <th>RegisterDate</th>
                  <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="member" items="${members}">
		                <tr>
		                  <td>
		                  ${member.accountID }
		           			</td>
		                  <td>${member.fullName }</td>
		                  <td>${member.email }</td>
		                  <td>${member.address }</td>
		                 <td>${member.phoneNumber }</td>
		                 <td><fmt:formatDate pattern = "dd/MM/yyyy" value = "${member.registerDate }" /> </td>
		                <c:choose>
		                	<c:when test="${member.status == 0}">
		                		<td style="color: blue;">Active</td>
		                	</c:when>
		                	<c:when test="${member.status == 1}">
		                		<td style="color: red;">Block</td>
		                	</c:when>
		                </c:choose>
		                </tr>
                </c:forEach>
                
               
              </table>
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

<script>
$(".tab-content .tab-pane").first().addClass(" active");
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
