<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>微上墙后台管理</title>
    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
    
	<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
	<script>
	  var root = "<%=request.getContextPath()%>"
	  var basePath = "<%=request.getScheme()%>"+"://"+"<%=request.getServerName()%>"+":"+<%=request.getServerPort()%>+root;
	  $(document).ready(function () {
		  selectFunction();
	  });
	  function selectFunction() {
		  $.ajax({
			url : root + "/business/customerManage/wechatManage/functionList",
			type : "get",
			cache : false,
			dataType : "json",
			error : function() {
				alert("网络出错！");
			},
			success : function(result) {
				var funcList = '<tr><td>' + result.functionName + '</td><td>' + result.functionDesc + '</td><td style="width:60%; table-layout:fixed; word-break: break-all; overflow:hidden;">' + result.functionUrl + '</td></tr>';
				$('#functionList').html(funcList);
			}
		});
	  }
	</script>
  </head>
    
  <body style="padding:15px; overflow:auto;">
    <h4>微信公众号&nbsp;>&nbsp;绑定公众号</h4>
    <hr>
    <div class="tab-pane" style="padding: 0px 20px 10px;">
	    <div style="float: left; font-size: 17px;">
	    	请复制功能的url地址到微信自定义菜单进行设置
	    </div>
   	</div>
    <div class="tab-pane" id="pushed-content"  style="padding:25px 15px;">
      <style>
		  .table tr th { text-align:center; background-color:#eee; }
		  .table tr td { text-align:center; }
		</style>
      <table class="table table-bordered">
        <thead>
          <th class="col-md-2">功能名称</th>
          <th class="col-md-2">介绍</th>
          <th>Url地址</th>
        </thead>
        <tbody id="functionList">
        </tbody>
      </table>
    </div>
  </body>
</html>
