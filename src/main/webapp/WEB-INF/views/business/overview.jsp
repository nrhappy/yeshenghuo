<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>总览</title>
<%@ include file="/base/favicon.jsp"%>
<link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
<script>
	  var root = "<%=request.getContextPath()%>"
	  
	  $(document).ready(function() {
		  $("#checkAuthcodeBtn").click(function() {
			  $("#authcodeModal").modal("hide");
				$.ajax({
					url : root + "/business/checkAuthcode",
					type : "post",
					data : {
						authcode : $("#authcode").val()
					},
					dataType : "json",
					error : function() {
						alert("error");
					},
					success : function(result) {
						if (result.code == 0) {
							window.location.href = root + "/business/overview/wechatRevenue";
						} else {
							alert("授权码错误！");
						}
					}
				});
				$("#authcode").val("");
		  });
	  });
</script>  
</head>

<body style="padding: 15px; overflow: auto;">
	<h4>总览</h4>
	<hr>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12">
				<h5>互动 酒吧管理</h5>
				<div class="panel panel-default" style="background-color:#fafafa; border:0px;">
					<div class="panel-body">
						<ul style="padding: 10px 10px; list-style-type:none;">
							<li class="clearfix">
								<span style="border-right:0px solid #ddd; width:200px; height:80px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<span style="font-size:20px;">￥&nbsp;${currentBusiness.balance}</span>
									<br>
									<span style="font-size:12px;">营收总额&nbsp;<a style="color:#1ab700;" href="javascript:$('#authcodeModal').modal('show');$('.modal-backdrop').remove();">详情</a></span>
								</span>
								<%-- <span style="border-right:1px solid #ddd; width:200px; height:80px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<span style="font-size:20px;">￥&nbsp;0.00</span>
									<br>
									<span style="font-size:12px;">现金收银&nbsp;<a style="color:#1ab700;" href="#">详情</a></span>
								</span>
								<span style="border-right:0px solid #ddd; width:200px; height:80px; display:inline-block; text-align:center; padding:10px;" class="pull-left">
									<span style="font-size:20px;">￥&nbsp;${currentBusiness.balance}</span>
									<br>
									<span style="font-size:12px;">微信支付&nbsp;<a style="color:#1ab700;" href="#">详情</a></span>
								</span> --%>
							</li>
							<li class="clearfix" style="margin-top:20px;">
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
							</li>
							<li class="clearfix">
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
    <!-- 验证授权码 -->
    <div class="modal" id="authcodeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">验证授权码</h4>
          </div>
          <div class="modal-body">
            <form role="form">
              <div class="form-group">
                <label for="authcode">授权码</label>
                <input id="authcode" class="form-control" type="password" placeholder="请输入授权码">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">关闭</button>
            <button id="checkAuthcodeBtn" type="button" class="btn btn-success btn-sm">确定</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal -->
    </div>

</body>
</html>