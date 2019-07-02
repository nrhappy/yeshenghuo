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

	function openCashOutModal(cashOutBeforeId) {
		$("#cashOutBeforeId").val(cashOutBeforeId);
		$("#cash-out-modal").modal("show");
		$(".modal-backdrop").remove();
	}

	function cashOutConfirm(cashOutId) {
		$("#cash-out-modal").modal("hide");
		$.ajax({
			url : root + "/corporation/financeManage/cashOutManage/cashOut",
			type : "post",
			data : {
				cashOutId : cashOutId
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
	
	$(document).ready(function() {
	    var rtChart = echarts.init(document.getElementById("revenue-trend-chart"));
	    
	    $.ajax({
	    	url: root + "/corporation/financeManage/revenue/revenueCount",
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
		    	url: root + "/corporation/financeManage/revenue/revenueCount",
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
		    	url: root + "/corporation/financeManage/revenue/revenueCount",
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
		    	url: root + "/corporation/financeManage/revenue/revenueCount",
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
	<h4>账务管理&nbsp;>&nbsp;营收情况</h4>
	<hr>
	<div class="container-fluid">

		<ul class="nav nav-tabs" style="margin-bottom: 20px;">
			<li class="active"><a data-toggle="tab"
				href="#revenue-trend-tab">收入趋势</a></li>
			<li><a data-toggle="tab"
				href="#revenue-detail-tab">收入明细</a></li>
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
				<table class="table table-bordered table-hover">
					<tr>
						<th>订单号</th>
						<th>酒吧</th>
						<th>消费者</th>
						<th>消费类型</th>
						<th>企业收入（￥）</th>
						<th>购买时间</th>
					</tr>
					<c:forEach items="${orderList}" var="order" varStatus="status">
						<tr>
							<td>${order.id}</td>
							<td>${order.businessName}</td>
							<td>${order.wechatName}</td>
							<td><c:if test="${order.goodsType == 0}">霸屏服务</c:if>
								<c:if test="${order.goodsType == 1}">打赏服务</c:if></td>
							<td>${order.corporationIncome}</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${order.updateTime}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
