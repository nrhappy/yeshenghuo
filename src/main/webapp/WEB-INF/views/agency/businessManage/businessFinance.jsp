<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link href="<%=request.getContextPath()%>/resource/css/bootstrap.css"
	rel="stylesheet">
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
<script>
	  var root = "<%=request.getContextPath()%>";
</script>
</head>

<body style="padding: 15px; overflow: auto;">
	<h4>商家管理&nbsp;>&nbsp;商家财务信息</h4>
	<hr>
	<div class="container-fluid">

		<div class="row">
			<table class="table table-bordered">
				<tr>
					<th>订单ID</th>
					<th>商家ID</th>
					<th>商品类型</th>
					<th>商品ID</th>
					<th>商品描述</th>
					<th>商家收益</th>
					<th>下单时间</th>
					<th>支付时间</th>
					<!-- <th>备注</th> -->
					<!-- <th>操作</th> -->
				</tr>
				<c:forEach items="${orderList}" var="order" varStatus="status">
					<tr>
						<td>${order.id}</td>
						<td>${order.businessId}</td>
						<td><c:if test="${order.goodsType == 0}">霸屏</c:if> <c:if test="${order.goodsType == 1}">打赏</c:if></td>
						<td>${order.goodsId}</td>
						<td>${order.goodsSummary}</td>
						<td>${order.businessIncome}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${order.createTime}" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${order.updateTime}" /></td>
						<%-- <td>${order.notes}</td> --%>
						<%-- <td><a style="width:16px; height:16px; display:inline-block; margin:0px; background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -59px -88px;" href="javascript:openNotesSetModal('${agency.id}');"></a></td> --%>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

	<div class="modal" id="notes-set-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">编辑备注</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="#" method="post">
						<input id="agencyId" name="agencyId" type="hidden">
						<div class="form-group">
							<label for="">备注</label> <input id="notes" name="notes" type="text" class="form-control">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success btn-sm" onclick="updateNotes($('#agencyId').val(), $('#notes').val())">确定</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
