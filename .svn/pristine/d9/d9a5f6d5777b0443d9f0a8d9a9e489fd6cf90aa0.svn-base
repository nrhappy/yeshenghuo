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
<script>
	var root = "<%=request.getContextPath()%>";
	
	function openBusinessRevenueModal(businessId) {
		$("#tableBox").html("");
		$.ajax({
			url: root + "/agency/businessManage/businessFinance",
			type: "post",
			data: {
				businessId: businessId
			},
			dataTyep: "json",
			error: function() {},
			success: function(result) {
				if (result.code == 0) {
					var orderList = result.data.orderList;
					if(orderList.length < 1) {
						$("#tableBox").append("暂无收入记录");
					} else {
						var table = $("<table class=\"table table-bordered\"></table>");
						var tr = $("<tr></tr>");
						tr.append($("<th>商品类型</th>"));
						tr.append($("<th>商品描述</th>"));
						tr.append($("<th>商家收益</th>"));
						tr.append($("<th>购买时间</th>"));
						table.append(tr);
						$.each(orderList, function(index, order){
							var goodsType = "";
							if (order.goodsType == 0) goodsType = "霸屏";
							if (order.goodsType == 1) goodsType = "打赏";
							tr = $("<tr></tr>");
							tr.append($("<td>" + goodsType + "</td>"));
							tr.append($("<td>" + order.goodsSummary + "</td>"));
							tr.append($("<td>" + order.businessIncome + "</td>"));
							tr.append($("<td>" + getLocalTime(order.updateTime) + "</td>"));
							table.append(tr);
						});
						$("#tableBox").append(table);
					}
				}
			}
		});
		$("#business-revenue-modal").modal("show");
		$(".modal-backdrop").remove();
	}
	
	function openCashOutListModal(businessId) {
		$("#cashOutListBox").html("");
		$.ajax({
			url: root + "/agency/businessManage/businessInfo/cashOutList",
			type: "post",
			data: {
				businessId: businessId
			},
			dataTyep: "json",
			error: function() {},
			success: function(result) {
				if (result.code == 0) {
					var cashOutList = result.data.cashOutList;
					if(cashOutList.length < 1) {
						$("#cashOutListBox").append("暂无收入记录");
					} else {
						var table = $("<table class=\"table table-bordered\"></table>");
						var tr = $("<tr></tr>");
						tr.append($("<th>记录编号</th>"));
						tr.append($("<th>提现金额</th>"));
						tr.append($("<th>提现时间</th>"));
						table.append(tr);
						$.each(cashOutList, function(index, cashOut){
							tr = $("<tr></tr>");
							tr.append($("<td>" + cashOut.id + "</td>"));
							tr.append($("<td>" + cashOut.amount + "</td>"));
							tr.append($("<td>" + getLocalTime(cashOut.updateTime) + "</td>"));
							table.append(tr);
						});
						$("#cashOutListBox").append(table);
					}
				}
			}
		});
		$("#cash-out-modal").modal("show");
		$(".modal-backdrop").remove();
	}

	function updateNotes(businessId, notes) {
		$.ajax({
			url : root + "/agency/businessManage/businessInfo/updateNotes",
			type : "post",
			data : {
				businessId : businessId,
				notes : notes
			},
			dataType : "json",
			error : function() {
				alert("error");
			},
			success : function(result) {
				if (result.code == 0) {
					location.reload();
				} else {
					alert(result.message);
				}
			}
		});
	}
	
	function getLocalTime(nS) {  
	    var date = new Date(nS);
	    var year = date.getFullYear();
	    var month = date.getMonth() + 1;
	    var day = date.getDate();
	    var hours = date.getHours();
	    var minutes = date.getMinutes();
	    var seconds = date.getMinutes();
	    return year + "/" + month + "/"+day + " " + hours + ":" + minutes + ":" + seconds;
	} 
</script>
</head>

<body style="padding: 15px; overflow: auto;">
	<h4>商家管理&nbsp;>&nbsp;商家信息</h4>
	<hr>
	<div class="container-fluid">

		<div class="row">
			<form role="form" action="<%=request.getContextPath()%>/agency/businessManage/businessInfo" method="get">
				<div class="form-group input-group">
					<input id="businessName" name="businessName" class="form-control pull-right" style="width:22%;" type="text" placeholder="请输入商家名称">
					<span class="input-group-btn">
						<button class="btn btn-success" type="submit">搜索</button>
					</span>
				</div>
			</form>
		</div>

		<div class="row">
			<table class="table table-bordered">
				<tr>
					<th>商家ID</th>
					<th>商家名称</th>
					<th>商家地址</th>
					<th>商家电话</th>
					<th>商家简介</th>
					<th>余额</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${businessList}" var="business" varStatus="status">
					<tr>
						<td>${business.id}</td>
						<td>${business.name}</td>
						<td>${business.addrress}</td>
						<td>${business.tel}</td>
						<td>${business.summary}</td>
						<td>${business.balance}</td>
						<td>
							<a href="javascript:openBusinessRevenueModal('${business.id}');">收入明细</a>
							&nbsp;
							<a href="javascript:openCashOutListModal('${business.id}');">提现记录</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

	<div class="modal" id="business-revenue-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">收入明细</h4>
				</div>
				<div id="tableBox" class="modal-body">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal" id="cash-out-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">提现记录</h4>
				</div>
				<div id="cashOutListBox" class="modal-body">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
