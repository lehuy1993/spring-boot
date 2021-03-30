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
<style>
    .movie__item .movie__view{
        position: absolute;
        background-color: #ff6347;
        color: #ffffff;
        left: 0;
        bottom: 0;
        right: 0;
        z-index: 3;
        font-weight: 600;
        font-size: 12px;
    }
</style>
<body>
	<%@ include file="includes/member-header.jsp"%>
	<div class="content">
        <h3 class="text-center pt-4 pb-3">MOVIE LIST</h3>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 bg-white">
                    <div class="row p-3">
                        <c:if test="${empty list}">
                        <div class="col-12 text-center">
                            <h4>No movies has found as required</h4>
                        </div>
                        </c:if>
                        <c:if test="${not empty list}">
                            <c:forEach items="${list}" var="item">
                                <div class="col-md-2 col-sm-4 col-6 pl-2 pr-2">
                                    <div class="movie__item position-relative">
                                        <img src="${item.smallImage}" alt="" class="w-100"/>
                                        <span class="movie__view text-center">
                                            View schedule
                                        </span>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
	</div>
</body>

</html>