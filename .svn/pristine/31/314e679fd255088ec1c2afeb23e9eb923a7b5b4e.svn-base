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
	
	$(document).ready(function() {
	    var rtChart = echarts.init(document.getElementById("revenue-trend-chart"));
	    
	    $.ajax({
	    	url: root + "/agency/financeManage/revenueTrend/data",
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
		    	url: root + "/agency/financeManage/revenueTrend/data",
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
		    	url: root + "/agency/financeManage/revenueTrend/data",
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
		    	url: root + "/agency/financeManage/revenueTrend/data",
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
	<h4>我的收入&nbsp;>&nbsp;收入趋势图</h4>
	<hr>
	<div class="container-fluid">
		<div class="">
			<button id="rtWeak" class="btn btn-sm btn-default">最近一周</button>
			<button id="rtMonth" class="btn btn-sm btn-default">最近一月</button>
			<button id="rtYear" class="btn btn-sm btn-default">最近一年</button>
		</div>
		<div id="revenue-trend-chart" style="width: 100%; height: 300px;">
		</div>
	</div>
</body>
</html>
