<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%> 
<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>首页_夜程序后台管理</title>
    <%@ include file="/base/favicon.jsp" %>
    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resource/css/business/manage.css" rel="stylesheet">
    
	<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/business/manage.js"></script>
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
							$("#main-frame").attr("src", root + "/business/overview/wechatRevenue");
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
    
  <body style="overflow:hidden;">
    <div class="nav navbar-inverse" role="navigation">
      <div class="navbar-header">
        <button class="navbar-toggle" data-toggle="collapse" data-target="#bs-example">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
      
      <div class="collapse navbar-collapse" id="bs-example">          
        <ul style="padding:2px;" class="nav navbar-nav navbar-right">
          <li><a style="padding:0px;" href="#"><img src="<%=request.getContextPath()%>${currentBusiness.logo}" width="50" height="50"></a></li>
          <li><a href="#">${currentBusiness.name}</a></li>
          <li><a href="<%=request.getContextPath()%>/business/logout"><span class="glyphicon glyphicon-log-out"></span></a></li>
        </ul>          
      </div>
    </div>
    
    <!-- <div style="position:relative; min-height:100%; left:0px; bottom:0px;" class="container"> -->
      <div class="left-side-bar" style="z-index:9; position:absolute; top:0px; left:0px; background-color:#eee; width:178px;">
        <span style="background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all_bk1.png) 0 0; width:115px; height:36px; display:inline-block; margin:20px 30px;"></span>
        <style>
		  .overview a .licon {
		    background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) 0px -35px;
		  }
		  .overview:hover a .licon {
		    background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -22px -35px;
		  }
		  .react a .licon {
		    background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) 0px -57px;
		  }
		  .react:hover a .licon {
		    background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -22px -57px;
		  }
		  .function a .licon {
		    background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) 0px -57px;
		  }
		  .function:hover a .licon {
		    background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -22px -57px;
		  }
		  .weixin a .licon {
		    background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) 0px -79px;
		  }
		  .weixin:hover a .licon {
		    background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -22px -79px;
		  }
		  .account a .licon {
		    background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) 0px -101px;
		  }
		  .account:hover a .licon {
		    background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -22px -101px;
		  }
		  .left-side-bar ul li a:hover {
		    color:#ff4b69;
		  }
		</style>
        <ul class="overview"><a class="item-head" target="main-frame" href="<%=request.getContextPath()%>/business/overview"><span class="licon"></span>总览</a>
        </ul>
        <ul class="react"><a class="item-head" target="main-frame" href="javascript:$('#authcodeModal').modal('show');"><span class="licon"></span>互动收入</a>
        </ul>
        <ul class="function"><a class="item-head" href="javascript:;"><span class="licon"></span>功能</a>
          <li><a target="main-frame" href="<%=request.getContextPath()%>/business/functionManage/weishangqiangManage">微上墙</a></li>
          <li><a href="javascript:;">赛马游戏</a></li>
          <li><a href="javascript:;">现场交友</a></li>
        </ul>
        <ul class="weixin"><a class="item-head" target="main-frame" href="javascript:;"><span class="licon"></span>微信公众号</a>
          <li><a target="main-frame" href="<%=request.getContextPath()%>/business/customerManage/wechatManage">用户</a></li>
          <li><a target="main-frame" href="<%=request.getContextPath()%>/business/customerManage/wechatManage/bandWechat">绑订公众号</a></li>
        </ul>
        <ul class="account"><a class="item-head" href="javascript:;"><span class="licon"></span>账号管理</a>
          <li><a target="main-frame" href="<%=request.getContextPath()%>/business/accountManage/accountInfo">账号资料</a></li>
          <!-- <li><a href="javascript:;">黑名单</a></li> -->
          <li><a target="main-frame" href="<%=request.getContextPath()%>/passwordManage">密码管理</a></li>
          <li><a target="main-frame" href="<%=request.getContextPath()%>/business/accountManage/authcode">授权码管理</a></li>
        </ul>
      </div>
      <div style="z-index:9; position:absolute; top:55px; left:178px; right:0px; bottom:0px;">
        <iframe id="main-frame" name="main-frame" src="<%=request.getContextPath()%>/business/overview" style="width:100%; height:100%; border-width:0px; overflow-x:hidden;">
        </iframe>
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
