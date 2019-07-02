<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%> 
<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>夜程序代理后台管理</title>
    <%@ include file="/base/favicon.jsp" %>
    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resource/css/business/manage.css" rel="stylesheet">
    
	<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/business/manage.js"></script>
	<script>
	  var root = "<%=request.getContextPath()%>"
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
            <li><a style="padding:0px;" href="#"><img src="<%=request.getContextPath()%>/resource/img/bardefatulLogo.png" width="50" height="50"></a></li>
            <li><a href="<%=request.getContextPath()%>/agency/logout">退出登录&nbsp;<span class="glyphicon glyphicon-log-out"></span></a></li>
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
        <ul class="overview"><a class="item-head" target="main-frame" href="<%=request.getContextPath()%>/agency/overview"><span class="licon"></span>总览</a>
        </ul>
        <ul class="function"><a class="item-head" href="javascript:;"><span class="licon"></span>我的客户</a>
          <li><a target="main-frame" href="<%=request.getContextPath()%>/agency/businessManage/businessInfo">客户信息</a></li>
          <%-- <li><a target="main-frame" href="<%=request.getContextPath()%>/agency/businessManage/businessFinance">客户结算记录</a></li> --%>
        </ul>
        <ul class="function"><a class="item-head" href="javascript:;"><span class="licon"></span>我的收入</a>
          <li><a target="main-frame" href="<%=request.getContextPath()%>/agency/financeManage/revenueTrend">收入趋势图</a></li>
          <li><a target="main-frame" href="<%=request.getContextPath()%>/agency/financeManage/revenueDetail">收入明细</a></li>
          <li><a target="main-frame" href="<%=request.getContextPath()%>/agency/financeManage/agencyCashOut">提现记录</a></li>
        </ul>
        <ul class="account"><a class="item-head" href="javascript:;"><span class="licon"></span>系统管理</a>
          <li><a target="main-frame" href="<%=request.getContextPath()%>/passwordManage">密码管理</a></li>
        </ul>
      </div>
      <div style="z-index:9; position:absolute; top:55px; left:178px; right:0px; bottom:0px;">
        <iframe name="main-frame" src="<%=request.getContextPath()%>/agency/overview" style="width:100%; height:100%; border-width:0px; overflow-x:hidden;">
        </iframe>
      </div>
  </body>
</html>
