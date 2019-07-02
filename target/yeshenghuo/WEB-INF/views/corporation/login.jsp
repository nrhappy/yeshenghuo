<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>企业端登录</title>
    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
    
	<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
	<script>
	  var root = "<%=request.getContextPath()%>";
	  var message = "${message}";
	  
	  if (message.length > 0) {
		  alert(message);
	  }
	</script>    
  </head>
    
  <body style="padding:20px; background-color:#eee;">
    <div class="nav">
      <div class="navbar-header">
        <a class="navbar-brand" style="padding:0px;"><img src="<%=request.getContextPath()%>/resource/img/index_logo.png"></a>
      </div>
    </div>
    
    <form role="form" method="post" action="#" style="width:372px; height:300px; position:absolute; top:50%; left:50%; margin-top:-180px; margin-left:-186px;">
      <div class="form-group" style="text-align:center; padding-bottom:10px;">
      <h4>企业端登录</h4>
      </div>
      <div class="form-group">
      <label for="mobile">用户名</label>
      <input style="border-radius:3px;" class="form-control" name="mobile" type="text" placeholder="请输入手机号 / 邮箱">
      </div>
      <div class="form-group">
      <label for="password">密码</label>
      <input style="border-radius:3px;" class="form-control" name="password" type="password" placeholder="请输入密码">
      </div>
      <div class="form-group">
        <button style="border-radius:3px;" type="submit" class="btn btn-success btn-block">登录</button>
      </div>
      <div class="text-center"><a href="javascript:;">忘记密码</a> | <a href="<%=request.getContextPath()%>/business/register">注册微喵</a></div>
    </form>
  </body>
</html>
