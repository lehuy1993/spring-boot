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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/booking.css">

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Cinema room <small>Display list</small>
		</h1>

	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">

				<!-- /.box -->
				<div class="box">
				<div class="box-header with-border">
	              <h3 class="box-title">Cinema Room ${cinemaroomId }</h3>
	              <div id="showMsg">
		              
	              </div>
	             
		        </div>
	            </div>
				<div  style="margin: auto; padding-top: 15px; width: 480px">
					<c:forEach var="seat" items="${seats}">
						
				 	<c:choose>
							<c:when test="${seat.seatType < 1  }">
								<div class=" seat-vipprime active seat "
								onclick="setTypeNorma(this)" zone="VIP" value="${seat.seatId }"
									price="120000">${seat.seatColumn}${seat.seatRow }</div>
							</c:when>

							<c:otherwise>
								<div class="seat seat-standard active"
									 zone="Thường"
								onclick="setTypeVip(this)"	value="${seat.seatId }" price="115000">${seat.seatColumn}${seat.seatRow }
								</div>
							</c:otherwise>
							
						</c:choose>
						 
					</c:forEach>

				</div>
				<div style="margin: auto; width: 50%" class="border-bottom">
					<h4 style="text-align: center; margin-right: 21px;" class="text-secondary ">SCREEN</h4>
				</div>
				<div style="margin: auto; width: 28%" class="ticketbox-notice  ">
					<div class="iconlist">
					<h6 class="icon zone-standard" title="Standard">Thường</h6>
					</div>
					<div class="iconlist">
						
						<h6 class="icon zone-vipprime" title="VIP">VIP</h6>

					</div>
				</div>

				
				<a href="${pageContext.request.contextPath}/admin/cinemaroom"> 
			    	 <button  type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
						 <i class="glyphicon glyphicon-remove"></i>
								 	Back
					 </button>
				 </a> 
				 <a > 
			    	 <button id="submit" type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
						 <i class="fa fa-save"></i>
								 	Save
					 </button>
				 </a> 
		
             
              
              
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
	src="<%=request.getContextPath()%>/resources/js/admin/setTypeSeat.js"></script>

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
	
</script>
</body>
</html>
