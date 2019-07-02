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

	function openCashOutSetModal() {
		$("#cash-out-set-modal").modal("show");
		$(".modal-backdrop").remove();
	}

	function cashOutSetConfirm() {
		$("#cash-out-set-modal").modal("hide");
		
		if ($("#bank").val().length < 1) {
			return alert("开户行不能为空！");
		}
		if ($("#bankPossessor").val().length < 1) {
			return alert("开户人姓名不能为空！");
		}
		if ($("#bankAccount").val().length < 1) {
			return alert("银行卡号不能为空！");
		}
		
		$.ajax({
			url : root + "/agency/financeManage/agencyCashOut/cashOutSet",
			type : "post",
			data : {
				id : $("#id").val(),
				bank : $("#bank").val(),
				bankPossessor : $("#bankPossessor").val(),
				bankAccount : $("#bankAccount").val()
			},
			dataType : "json",
			error : function() {
				alert("error");
			},
			success : function(result) {
				if (result.code == 0) {
					alert("修改成功");
					location.reload();
				} else {
					alert("修改失败");
				}
			}
		});
	}
</script>
</head>

<body style="padding: 15px; overflow: auto;">
	<h4>我的收入&nbsp;>&nbsp;提现记录</h4>
	<hr>
	<div class="container-fluid">
		
		<div class="row" style="margin-bottom:5px;">
			<div class="col-xs-12">
				<a class="btn btn-success" href="javascript:openCashOutSetModal();">提现设置</a>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-12">
				<table class="table table-bordered">
					<tr>
						<th>记录编号</th>
						<th>类型</th>
						<th>提现金额</th>
						<th>提现时间</th>
					</tr>
					<c:forEach items="${cashOutList}" var="cashOut" varStatus="status">
						<tr>
							<td>${cashOut.id}</td>
							<td><c:if test="${cashOut.type == 0}">商家</c:if><c:if test="${cashOut.type == 1}">代理</c:if></td>
							<td>${cashOut.amount}</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${cashOut.createTime}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

	</div>
	
	<div class="modal" id="cash-out-set-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">提现账户信息修改</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="#" method="post">
						<input id="id" name="id" type="hidden" value="${currentAgency.id}">
						<div class="form-group">
							<input id="bank" name="bank" type="text" class="form-control" placeholder="请输入开户行" value="${currentAgency.bank}">
						</div>
						<div class="form-group">
							<input id="bankPossessor" name="bankPossessor" type="text" class="form-control" placeholder="请输入开户人姓名" value="${currentAgency.bankPossessor}">
						</div>
						<div class="form-group">
							<input id="bankAccount" name="bankAccount" type="text" class="form-control" placeholder="请输入银行卡号" value="${currentAgency.bankAccount}">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-success btn-sm" onclick="cashOutSetConfirm()">保存</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
