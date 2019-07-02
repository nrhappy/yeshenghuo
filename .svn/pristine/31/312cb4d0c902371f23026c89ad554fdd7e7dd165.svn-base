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
			url : root + "/business/overview/wechatRevenue/cashOutSet",
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

	/* function openCashOutModal() {
		$("#cash-out-modal").modal("show");
		$(".modal-backdrop").remove();
	}
	
	$("#cash-out-modal").on("hidden.bs.modal", function () {
		$("#amount").val("");
	}); */

	/* function cashOutConfirm(cashOutId) {
		$("#cash-out-modal").modal("hide");
		$.ajax({
			url : root + "/business/overview/wechatRevenue/cashOut",
			type : "post",
			data : {
				amount : $("#amount").val()
			},
			dataType : "json",
			error : function() {
				alert("error");
			},
			success : function(result) {
				if (result.code == 0) {
					alert("申请成功，请耐心等候夜程序给您打款！");
					location.reload();
				} else {
					alert(result.message);
				}
			}
		});
	} */
	
	$(document).ready(function() {
	    var rtChart = echarts.init(document.getElementById("revenue-trend-chart"));
	    
	    $.ajax({
	    	url: root + "/business/overview/wechatRevenue/revenueCount",
	    	type: "post",
	    	data: {
	    		nears: "7"
	    	},
	    	dataType: "json",
	    	error: function() {
	    		alert("error");
	    	},
	    	success: function(result) {
	    		if (result.code == 0) {
	    			var data = result.data;

	    		    rtChart.setOption({
	    	            tooltip : {},
	    	            xAxis : [
	    	                {
	    	                    type : 'category',
	    	                    boundaryGap : false,
	    	                    data : data.revenueDateCountList
	    	                }
	    	            ],
	    	            yAxis : [
	    	                {
	    	                    type : 'value',
	    	                    axisLabel : {
	    	                        formatter: '{value}'
	    	                    }
	    	                }
	    	            ],
	    	            series : [
	    	                {
	    	                    name : '收入金额',
	    	                    type : 'line',
	    	                    data : data.revenueAmountList
	    	                }
	    	            ]
	    	        });
	    		} else {
	    			alert(result.message);
	    		}
	    	}
	    });
	    
	    $("#rtWeak").click(function() {
	    	var rtChart = echarts.init(document.getElementById("revenue-trend-chart"));
	    	$.ajax({
		    	url: root + "/business/overview/wechatRevenue/revenueCount",
		    	type: "post",
		    	data: {
		    		nears: "7"
		    	},
		    	dataType: "json",
		    	error: function() {
		    		alert("error");
		    	},
		    	success: function(result) {
		    		if (result.code == 0) {
		    			var data = result.data;

		    		    rtChart.setOption({
		    	            tooltip : {},
		    	            xAxis : [
		    	                {
		    	                    type : 'category',
		    	                    boundaryGap : false,
		    	                    data : data.revenueDateCountList
		    	                }
		    	            ],
		    	            yAxis : [
		    	                {
		    	                    type : 'value',
		    	                    axisLabel : {
		    	                        formatter: '{value}'
		    	                    }
		    	                }
		    	            ],
		    	            series : [
		    	                {
		    	                    name : '收入金额',
		    	                    type : 'line',
		    	                    data : data.revenueAmountList
		    	                }
		    	            ]
		    	        });
		    		} else {
		    			alert(result.message);
		    		}
		    	}
		    });
	    });
	    
	    $("#rtMonth").click(function() {
	    	var rtChart = echarts.init(document.getElementById("revenue-trend-chart"));
	    	$.ajax({
		    	url: root + "/business/overview/wechatRevenue/revenueCount",
		    	type: "post",
		    	data: {
		    		nears: "30"
		    	},
		    	dataType: "json",
		    	error: function() {
		    		alert("error");
		    	},
		    	success: function(result) {
		    		if (result.code == 0) {
		    			var data = result.data;

		    		    rtChart.setOption({
		    	            tooltip : {},
		    	            xAxis : [
		    	                {
		    	                    type : 'category',
		    	                    boundaryGap : false,
		    	                    data : data.revenueDateCountList
		    	                }
		    	            ],
		    	            yAxis : [
		    	                {
		    	                    type : 'value',
		    	                    axisLabel : {
		    	                        formatter: '{value}'
		    	                    }
		    	                }
		    	            ],
		    	            series : [
		    	                {
		    	                    name : '收入金额',
		    	                    type : 'line',
		    	                    data : data.revenueAmountList
		    	                }
		    	            ]
		    	        });
		    		} else {
		    			alert(result.message);
		    		}
		    	}
		    });
	    });
	    
	    $("#rtYear").click(function() {
	    	var rtChart = echarts.init(document.getElementById("revenue-trend-chart"));
	    	$.ajax({
		    	url: root + "/business/overview/wechatRevenue/revenueCount",
		    	type: "post",
		    	data: {
		    		nears: "365"
		    	},
		    	dataType: "json",
		    	error: function() {
		    		alert("error");
		    	},
		    	success: function(result) {
		    		if (result.code == 0) {
		    			var data = result.data;

		    		    rtChart.setOption({
		    	            tooltip : {},
		    	            xAxis : [
		    	                {
		    	                    type : 'category',
		    	                    boundaryGap : false,
		    	                    data : data.revenueDateCountList
		    	                }
		    	            ],
		    	            yAxis : [
		    	                {
		    	                    type : 'value',
		    	                    axisLabel : {
		    	                        formatter: '{value}'
		    	                    }
		    	                }
		    	            ],
		    	            series : [
		    	                {
		    	                    name : '收入金额',
		    	                    type : 'line',
		    	                    data : data.revenueAmountList
		    	                }
		    	            ]
		    	        });
		    		} else {
		    			alert(result.message);
		    		}
		    	}
		    });
	    });
	});
</script>
</head>

<body style="padding: 15px; overflow: auto;">
	<h4>总览&nbsp;>&nbsp;微信支付</h4>
	<hr>
	<div class="container-fluid">

		<ul class="nav nav-tabs" style="margin-bottom: 20px;">
			<li class="active"><a data-toggle="tab"
				href="#revenue-trend-tab">收入趋势</a></li>
			<li><a data-toggle="tab"
				href="#revenue-detail-tab">收入明细</a></li>
			<li><a data-toggle="tab"
				href="#cash-out-tab">提现记录</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="revenue-trend-tab">
				<div class="">
					<button id="rtWeak" class="btn btn-sm btn-default">最近一周</button>
					<button id="rtMonth" class="btn btn-sm btn-default">最近一月</button>
					<button id="rtYear" class="btn btn-sm btn-default">最近一年</button>
				</div>
				<div id="revenue-trend-chart" style="width: 100%; height: 300px;">
				</div>
			</div>
			<div class="tab-pane fade" id="revenue-detail-tab">
				<table class="table table-bordered">
					<tr>
						<th>订单号</th>
						<th>消费类型</th>
						<th>企业收入</th>
						<th>订单时间</th>
					</tr>
					<c:forEach items="${orderList}" var="order" varStatus="status">
						<tr>
							<td>${order.id}</td>
							<td><c:if test="${order.goodsType == 0}">霸屏服务</c:if>
								<c:if test="${order.goodsType == 1}">打赏服务</c:if></td>
							<td>${order.corporationIncome}</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${order.updateTime}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="tab-pane fade" id="cash-out-tab">
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
									<th>提现金额</th>
									<th>提现时间</th>
								</tr>
								<c:forEach items="${cashOutList}" var="cashOut" varStatus="status">
									<tr>
										<td>${cashOut.id}</td>
										<td>${cashOut.amount}</td>
										<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${cashOut.createTime}" /></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
			
				</div>
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
						<input id="id" name="id" type="hidden" value="${currentBusiness.id}">
						<div class="form-group">
							<input id="bank" name="bank" type="text" class="form-control" placeholder="请输入开户行" value="${currentBusiness.bank}">
						</div>
						<div class="form-group">
							<input id="bankPossessor" name="bankPossessor" type="text" class="form-control" placeholder="请输入开户人姓名" value="${currentBusiness.bankPossessor}">
						</div>
						<div class="form-group">
							<input id="bankAccount" name="bankAccount" type="text" class="form-control" placeholder="请输入银行卡号" value="${currentBusiness.bankAccount}">
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
	
	<%-- <div class="modal" id="cash-out-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">申请提现</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="#" method="post">
						<div class="form-group">
							<label for="">提现金额</label>
							<input class="form-control" id="amount" name="amount" type="text" placeholder="请输入提现金额，不得超过当前余额">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">取消</button>
					<c:choose>
						<c:when test="${oCashOut != null}">
							<span class="text-danger">您已经申请了一笔￥${oCashOut.amount}的提现，暂时无法申请提现！</span>
							<button type="submit" class="btn btn-success btn-sm disabled" onclick="cashOutConfirm($('#amount').val())">确定</button>
						</c:when>
						<c:otherwise>
							<button type="submit" class="btn btn-success btn-sm" onclick="cashOutConfirm($('#amount').val())">确定</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div> --%>
	
</body>
</html>
