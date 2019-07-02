<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>夜程序注册</title>
    <%@ include file="/base/favicon.jsp" %>
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
        <a class="navbar-brand" style="padding:0px;"><img width="40" height="auto" src="<%=request.getContextPath()%>/resource/img/index_logo.png"></a>
      </div>
    </div>
    
    <form role="form" method="post" action="<%=request.getContextPath()%>/business/register" style="width:372px; height:300px; position:absolute; top:50%; left:50%; margin-top:-230px; margin-left:-186px;">
      <div class="form-group" style="text-align:center; padding-bottom:10px;">
        <h4>注册夜程序</h4>
      </div>
      <div class="form-group">
        <label for="mobile">手机号</label>
        <input class="form-control" id="mobile" name="mobile" type="tel" placeholder="请输入手机号">
      </div>
      <div class="form-group">
        <label for="imageCaptcha">图片验证码</label>
        <input class="form-control" id="imageCaptcha" name="imageCaptcha" type="text" placeholder="请输入图片验证码">
        <img style="position:absolute; top:166px; right:-85px;" src="<%=request.getContextPath()%>/imageCaptcha" onclick="this.src='<%=request.getContextPath()%>/imageCaptcha?d='+new Date().getTime()">
      </div>
      <div class="form-group">
        <label for="mobile">登录密码</label>
        <input class="form-control" id="password" name="password" type="password" placeholder="请输入登录密码">
      </div>
      <div class="form-group">
        <label for="mobile">重复登录密码</label>
        <input class="form-control" id="repassword" name="repassword" type="password" placeholder="请重复输入登录密码">
      </div>
      <div class="form-group">
        <button type="submit" class="btn btn-success btn-block">注册</button>
      </div>
      <div class="text-center"><a href="<%=request.getContextPath()%>/business/login">登录微喵</a></div>
    </form>
  </body>
</html>
