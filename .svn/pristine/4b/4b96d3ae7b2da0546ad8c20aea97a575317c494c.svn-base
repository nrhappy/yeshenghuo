<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
<style>
.table tr th {
	text-align: center;
	background-color: #eee;
}

.table tr td {
	text-align: center;
}
</style>
<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/resource/js/echarts-all.js"></script>
<script>
	var root = "<%=request.getContextPath()%>";
</script>
</head>

<body style="padding: 15px; overflow: auto;">
	<h4>我的收入&nbsp;>&nbsp;收入明细</h4>
	<hr>
	<div class="container-fluid">
		<div class="row">
			<table class="table table-bordered">
				<tr>
					<th>订单号</th>
					<th>酒吧</th>
					<th>消费类型</th>
					<th>代理收入</th>
					<th>订单时间</th>
				</tr>
				<c:forEach items="${orderList}" var="order" varStatus="status">
					<tr>
						<td>${order.id}</td>
						<td>${order.businessName}</td>
						<td><c:if test="${order.goodsType == 0}">霸屏服务</c:if>
							<c:if test="${order.goodsType == 1}">打赏服务</c:if></td>
						<td>${order.agencyIncome}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${order.updateTime}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
