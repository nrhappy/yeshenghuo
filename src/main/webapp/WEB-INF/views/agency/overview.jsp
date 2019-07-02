<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>总览</title>
<%@ include file="/base/favicon.jsp"%>
<link href="<%=request.getContextPath()%>/resource/css/bootstrap.css"
	rel="stylesheet">

<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
</head>

<body style="padding: 15px; overflow: auto;">
	<h4>总览</h4>
	<hr>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12">
				<h5>代理营收</h5>
				<div class="panel panel-default" style="background-color:#fafafa; border:0px;">
					<div class="panel-body">
						<ul style="padding: 10px 10px; list-style-type:none;">
							<li class="clearfix">
								<span style="border-right:0px solid #ddd; width:200px; height:80px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<span style="font-size:20px;">￥&nbsp;${currentAgency.balance}</span>
									<br>
									<span style="font-size:12px;">营收总额&nbsp;<a style="color:#1ab700;" href="<%=request.getContextPath()%>/agency/financeManage/revenueDetail">详情</a></span>
								</span>
								<%-- <span style="border-right:1px solid #ddd; width:200px; height:80px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<span style="font-size:20px;">￥&nbsp;0.00</span>
									<br>
									<span style="font-size:12px;">现金收银&nbsp;<a style="color:#1ab700;" href="#">详情</a></span>
								</span>
								<span style="border-right:0px solid #ddd; width:200px; height:80px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<span style="font-size:20px;">￥&nbsp;${currentAgency.balance}</span>
									<br>
									<span style="font-size:12px;">微信支付&nbsp;<a style="color:#1ab700;" href="<%=request.getContextPath()%>/business/overview/wechatRevenue">详情</a></span>
								</span> --%>
							</li>
							<%-- <li class="clearfix" style="margin-top:20px;">
								<span style="width:115px; height:100px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<a href="<%=request.getContextPath()%>/business/functionManage/weishangqiangManage" style="text-decoration:none; color:#6a6a6a;">
										&nbsp;<span style="width:50px; height:50px; background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -460px -1px; display:inline-block;"></span>
										<br>
										<span class="small">微上墙</span>
									</a>
								</span>
								<span style="width:115px; height:100px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<a href="#" style="text-decoration:none; color:#6a6a6a;">
										&nbsp;<span style="width:50px; height:50px; background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -510px -1px; display:inline-block;"></span>
										<br>
										<span class="small">赛马游戏</span>
									</a>
								</span>
								<span style="width:115px; height:100px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<a href="#" style="text-decoration:none; color:#6a6a6a;">
										&nbsp;<span style="width:50px; height:50px; background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -410px -1px; display:inline-block;"></span>
										<br>
										<span class="small">现场交友</span>
									</a>
								</span>
								<span style="width:115px; height:100px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<a href="#" style="text-decoration:none; color:#6a6a6a;">
										&nbsp;<span style="width:50px; height:50px; background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -510px -154px; display:inline-block;"></span>
										<br>
										<span class="small">大活动抽奖</span>
									</a>
								</span>
							</li>
							<li class="clearfix">
								<span style="width:115px; height:100px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<a href="#" style="text-decoration:none; color:#6a6a6a;">
										&nbsp;<span style="width:50px; height:50px; background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -110px -152px; display:inline-block;"></span>
										<br>
										<span class="small">投票</span>
									</a>
								</span>
								<span style="width:115px; height:100px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<a href="#" style="text-decoration:none; color:#6a6a6a;">
										&nbsp;<span style="width:50px; height:50px; background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -458px -208px; display:inline-block;"></span>
										<br>
										<span class="small">摇一摇游戏</span>
									</a>
								</span>
								<span style="width:115px; height:100px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<a href="#" style="text-decoration:none; color:#6a6a6a;">
										&nbsp;<span style="width:50px; height:50px; background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -406px -155px; display:inline-block;"></span>
										<br>
										<span class="small">现场夺宝</span>
									</a>
								</span>
							</li> --%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>