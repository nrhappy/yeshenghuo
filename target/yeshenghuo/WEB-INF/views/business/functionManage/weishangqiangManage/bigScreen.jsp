<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>微上墙</title>
    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
    
    <script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
	<script src="http://img.wemew.cn/wemew/admin/js/onWallVideo.js?r=102"></script>
    <script src="<%=request.getContextPath()%>/resource/js/base.js"></script>
    <script>
      var root  = "<%=request.getContextPath()%>";
      
      var businessId = "${currentBusiness.id}";
      var wechatUserId = 1000000000;
      var weishangqiangId = "${currentWeishangqiang.id}";
      var lastTime = "${timestamp}";
      
	    setInterval(function() {
	        if(document.getElementById("loading").ended == true ) {
	        	var loadingBox = document.getElementById("loading-box");
	      	  loadingBox.parentNode.removeChild(loadingBox);
	        }
	    }, 500);
      

      
      $(document).ready(function() {    	    
    		$(function(){
    			setInterval(function() {
    				$.ajax({
    					url : root + "/business/functionManage/weishangqiangManage/bigScreen/content",
    					type : "post",
    					async : false,
    					cache : false,
    					data : {
    						businessId : businessId,
    						lastTime : lastTime
    					},
    					dataType : "json",
    					error : function() {
    						pushErrMsg("获取服务器数据失败！");
    					},
    					success : function(result) {
    						if (result.code == 0) {
    							if (result.data.currentWeishangqiang.pause == 0) {
	    							if (result.data.currentWeishangqiangContentResultList.length != 0) {
	    								$.each(result.data.currentWeishangqiangContentResultList, function(i, weishangqiangContentResult) {
	    									var blessingBox = $("#blessing-box");
	    									var media = $("<div class=\"media\" style=\"padding:20px; background-color:#000; border-radius:10px; opacity:0.8;\"></div>");
	    									var profile = $("<a class=\"pull-left\" href=\"#\"><img style=\"margin-left:20px; margin-right:20px;\" class=\"media-object img-circle\" src=\"" + weishangqiangContentResult.wechatUser.profile + "\" width=\"84\" height=\"84\" data-src=\"holder.js/84x84\"></a>");
	    									var mediaBody = $("<div class=\"media-body\"><h4 class=\"media-heading\"><a href=\"#\" style=\"color:#fff; font-size:38px;\">" + weishangqiangContentResult.wechatUser.nickname + "</a><span class=\"small pull-right\" style=\"font-size:38px;\">" + weishangqiangContentResult.createTime + "</span></h4><p style=\"color:#8bd7ff; font-size:38px; font-weight:bold;\">" + weishangqiangContentResult.content + "</p></div>");
	    									media.append(profile);
	    									media.append(mediaBody);
	    									blessingBox.prepend(media);
	    									media.fadeIn(800);
	    								});
	    								lastTime = result.timestamp;
	    							}
    							}
    						} else {
    							pushErrMsg("获取服务器数据失败！");
    						}
    					}
    				});
    	        }, 3000);   
    	    });  		
    	})
    	
    	function ownScreenAction(content) {
    	  var countdown = 10 + 1;
    	  $('#ownScreen-box').fadeIn();
    	  var s = setInterval(function() {
    		  countdown = countdown - 1;
    		  if (countdown < 0) {
    			clearInterval(s);
	    		$('#ownScreen-box').fadeOut();
	    		$('#content').text("");
    		  } else {
     			$('#content').hide();
    			$('#content').text(countdown);
    			$('#content').fadeIn();
    		  }
          }, 1000);
        }
    </script>
  </head>
  
  <body>
    <button onclick="ownScreenAction();">霸屏测试</button>
    <div id="ownScreen-box" style="width:100%; height:100%; position:fixed; left:0; top:0; background:#000; z-index:9999; text-align:center; display:none">
      <div id="ownScreen-bg" style="position: fixed; width: 100%; height: auto; top: 0px; left: 0px; right: 0px; margin: 0px; visibility: visible;">
        <div id="ownScreen-title" style="font-size:148px; margin-top:150px; color:#ccc;">霸屏测试中...</div>
        <div id="content" style="font-size:176px; margin-top:20px; color:#ccc;">
      
        </div>
      </div>
    </div>
    <div id="loading-box" style="width:100%; height:100%; position:fixed; left:0; top:0; background:#000; z-index:9999; text-align:center; visibility:hidden">
      <video id="loading" src="<%=request.getContextPath()%>/resource/video/loading.mp4" style="position: fixed; width: 100%; height: auto; top: 0px; left: 0px; right: 0px; margin: 0px; visibility: visible;" autoplay>
      </video>
    </div>
    
    <img style="position: fixed; left: -0px; height: 100%; width: 100%; z-index: -1;" alt="" src="<%=request.getContextPath()%>${currentWeishangqiang.bgUrl}">
    <div style="margin-left:5%; margin-right:5%" class="container-fluid">
      <div class="row">
      	<div class="col-xs-4"></div>
        <h3 style="font-size:48px; color:#fff; margin:30px 0;" class="col-xs-4">欢迎光临&nbsp;${currentWeishangqiang.title}</h3>
      </div>
      <div class="row">
        <div class="col-xs-9" id="blessing-box">
          <c:choose>
          <c:when test="true">
          <c:forEach items="${currentWeishangqiangContentResultList}" var="weishangqiangContentResult" varStatus="status">
          <div class="media" style="padding:20px; background-color:#000; border-radius:10px; opacity:0.8;">
            <a class="pull-left" href="#">
              <img style="margin-left:20px; margin-right:20px;" class="media-object img-circle" src="${weishangqiangContentResult.wechatUser.profile}" width="84" height="84" data-src="holder.js/84x84">
            </a>
            <div class="media-body">
              <h4 class="media-heading">
                <a href="#" style="color:#fff; font-size:38px;">${weishangqiangContentResult.wechatUser.nickname}</a>
                <span class="small pull-right" style="font-size:38px;">${weishangqiangContentResult.createTime}</span>
              </h4>
              <p style="color:#8bd7ff; font-size:38px; font-weight:bold;">${weishangqiangContentResult.content}</p>
            </div>
          </div>
          </c:forEach>
          </c:when>
          <c:otherwise>
          </c:otherwise>
          </c:choose>
        </div>
        <div class="col-xs-3" style="text-align:center; position:fixed; right:50px; top:115px;" id="qrcode-box">
          <img alt="" src="<%=request.getContextPath()%>/${currentWeishangqiang.qrcode}" width="80%" height="auto">
          <h3 style="color:#fff;">扫描二维码上大屏幕</h3>
        </div>
      </div>
    </div>
    
  </body>
</html>