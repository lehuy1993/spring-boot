<div class="col-md-2 col-sm-3 member">
    <div class="member-info text-center">
        <c:if test="${empty image}">
            <img src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" class="rounded-circle img-fluid">
        </c:if>
        <c:if test="${not empty image}">
            <img src="<%=request.getContextPath()%>/resources/img/${image}" class="rounded-circle img-fluid">
        </c:if>
        <p class="member-info__name"> <b>${fullName}</b> </p>
        <p class="member-info__score"><i class="fa fa-star"></i> Score: <fmt:formatNumber type = "number" value = "${score}" maxFractionDigits="3"/></p>
    </div>
    <div class="member-menu list-group">
        <a class="list-group-item" href="<%=request.getContextPath()%>/member/info">Account Information</a>
        <a class="list-group-item" href="<%=request.getContextPath()%>/member/history">History</a>
        <a class="list-group-item" href="<%=request.getContextPath()%>/member/booked-ticket">Booked ticket</a>
        <a class="list-group-item">Canceled ticket</a>
    </div>
</div>