<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>微上墙后台管理</title>
    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resource/css/business/manage.css" rel="stylesheet">
    
	<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/jquery.uploadify.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
	<script>
	  var root = "<%=request.getContextPath()%>";
	  var message = "${message}";
	  
	  if (message.length > 0) {
		  alert(message);
	  }
	</script>
  </head>
    
  <body style="padding:15px; overflow:auto;">
    <h4>账号管理&nbsp;>&nbsp;授权码管理</h4>
    
    <form role="form" method="post" action="<%=request.getContextPath()%>/business/accountManage/authcode/update" style="width:300px; height:300px; position:absolute; top:50%; left:50%; margin-top:-150px; margin-left:-150px;">
      <div class="form-group">
        <label for="mobile">原授权码</label>
        <input style="border-radius:3px;" class="form-control" name="authcode" type="password" placeholder="请输入原授权码">
      </div>
      <div class="form-group">
        <label for="password">新授权码</label>
        <input style="border-radius:3px;" class="form-control" name="newAuthcode" type="password" placeholder="请输入新授权码">
      </div>
      <div class="form-group">
        <label for="password">重复授权码</label>
        <input style="border-radius:3px;" class="form-control" name="reNewAuthcode" type="password" placeholder="请重复输入新授权码">
      </div>
      <div class="form-group">
        <button style="border-radius:3px;" type="submit" class="btn btn-success btn-block">确认修改</button>
      </div>
    </form>
    
  </body>
</html>
