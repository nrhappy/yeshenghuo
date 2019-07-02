<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>微上墙</title>
    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resource/css/liMarquee.css" rel="stylesheet">
    
    <script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/jquery.liMarquee.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
	<script src="http://img.wemew.cn/wemew/admin/js/onWallVideo.js?r=102"></script>
    <script src="<%=request.getContextPath()%>/resource/js/base.js"></script>
    <script>
      var root  = "<%=request.getContextPath()%>";
      
      var businessId = "${currentBusiness.id}";
      var wechatUserId = 1000000000;
      var weishangqiangId = "${currentWeishangqiang.id}";
      var lastTime = "${timestamp}";
      var $marquee;
        /* setInterval(function() {
	        if(document.getElementById("loading").ended == true ) {
	        	var loadingBox = document.getElementById("loading-box");
	      	  loadingBox.parentNode.removeChild(loadingBox);
	        }
	    }, 500); */
	    
	    
	  function keyDown(e) {
        if (e.which == 37 || e.which == 39) {
        	$("#main").append($("#main").children("div").get(0));
        }
        if (e.which == 38 || e.which == 40) {
        	$("#right").append($("#right").children("div").get(0));
        }
      }
	  document.onkeydown = keyDown;
	  
	  window.onload = function () {
		  $marquee = $('.marquee').liMarquee({
			  direction: 'up',
			  scrollamount: 50,
			  drag: false,
			  runshort: false,
			  hoverstop: false
		  });
	  }

      $(document).ready(function() {    
          var oAudio = $("#oAudio");
          
    		$(function(){
    			setInterval(function() {
    				$.ajax({
    					url : root + "/business/functionManage/weishangqiangManage/bigScreen/content",
    					type : "post",
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
    							if (true) {
    								pause = result.data.currentWeishangqiang.pause;
    								if ($("#ws_bg").attr("src") != result.data.currentWeishangqiang.bgUrl) {
    									$("#ws_bg").attr("src", result.data.currentWeishangqiang.bgUrl);
    								}
    								if ($("#title").text() != result.data.currentWeishangqiang.title) {
    									$("#title").text(result.data.currentWeishangqiang.title);
    								}
    								
	    							if (result.data.currentWeishangqiangContentResultList.length != 0) {
	    								$.each(result.data.currentWeishangqiangContentResultList, function(i, weishangqiangContentResult) {
	    									if (weishangqiangContentResult.type == "0") {
		    									var blessingBox = $("#left");
		    									var media = $("<div class=\"media\" style=\"padding:20px; background-color:#000; border-radius:10px; opacity:0.7;\"></div>");
		    									var profile = $("<a class=\"pull-left\" href=\"#\"><img style=\"margin-left:20px; margin-right:20px;\" class=\"media-object img-circle\" src=\"" + weishangqiangContentResult.wechatUser.profile + "\" width=\"104\" height=\"104\" data-src=\"holder.js/104x104\"></a>");
		    									var mediaBody = $("<div class=\"media-body\"><h4 class=\"media-heading\"><a href=\"#\" style=\"color:#fff; font-size:38px;\">" + weishangqiangContentResult.wechatUser.nickname + "</a><span class=\"small pull-right\" style=\"font-size:38px;\">" + weishangqiangContentResult.createTime + "</span></h4><p style=\"color:#8bd7ff; font-size:38px; font-weight:bold;\">" + weishangqiangContentResult.content + "</p></div>");
		    									media.append(profile);
		    									media.append(mediaBody);
		    									media.fadeIn(800);
		    									$(".str_move").append(media);
		    									
		    									var img = new RegExp("<img");
		    									if(img.test(weishangqiangContentResult.content)){
		    										$("#carousel-box").append($("<div class=\"item\"><a href=\"#\">" + weishangqiangContentResult.content.replace("30%", "100%") + "</a></div>"));
		    									}
		    									
		    									/* alert(weishangqiangContentResult.content);
		    									alert("style".indexOf(weishangqiangContentResult.content.toString()));
		    									if ("<img".indexOf(weishangqiangContentResult.content) != -1) {
		    										$("#carousel-box").append($("<div class=\"item active\"><a href=\"#\">" + weishangqiangContentResult.content.replace("30%", "100%") + "</a></div>"));
		    									} */
	    									} else if (weishangqiangContentResult.type == "1") {
		    									var blessingBox = $("#left");
		    									var media = $("<div class=\"media\" style=\"padding:20px; background-color:#000; border-radius:10px; opacity:0.7;\"></div>");
		    									var profile = $("<a class=\"pull-left\" href=\"#\"><img style=\"margin-left:20px; margin-right:20px;\" class=\"media-object img-circle\" src=\"" + weishangqiangContentResult.wechatUser.profile + "\" width=\"104\" height=\"104\" data-src=\"holder.js/104x104\"></a>");
		    									var mediaBody = $("<div class=\"media-body\"><h4 class=\"media-heading\"><a href=\"#\" style=\"color:#fff; font-size:38px;\">" + weishangqiangContentResult.wechatUser.nickname + "</a><span class=\"small pull-right\" style=\"font-size:38px;\">" + weishangqiangContentResult.createTime + "</span></h4><p style=\"color:#8bd7ff; font-size:38px; font-weight:bold;\"><span style=\"color:#FFA200\">重金霸屏：" + weishangqiangContentResult.content + "<span><br><img width=\"30%\" height=\"auto\" src=\"" + weishangqiangContentResult.imgUrl + "\"></p></div>");
		    									media.append(profile);
		    									media.append(mediaBody);
		    									media.slideDown(800);
		    									$(".str_move").append(media);
		    									
		    									$("#carousel-box").append($("<div class=\"item\"><a href=\"#\"><img width=\"100%\" height=\"auto\" src=\"" + weishangqiangContentResult.imgUrl + "\"></a></div>"));
		    									
	    										ownScreenAction(weishangqiangContentResult.imgUrl, weishangqiangContentResult.wechatUser.profile, weishangqiangContentResult.wechatUser.nickname, weishangqiangContentResult.content, weishangqiangContentResult.ownScreen.duration);
	    									} else if (weishangqiangContentResult.type == "2") {
		    									var blessingBox = $("#left");
		    									var media = $("<div class=\"media\" style=\"padding:20px; background-color:#000; border-radius:10px; opacity:0.7;\"></div>");
		    									var profile = $("<a class=\"pull-left\" href=\"#\"><img style=\"margin-left:20px; margin-right:20px;\" class=\"media-object img-circle\" src=\"" + weishangqiangContentResult.wechatUser.profile + "\" width=\"104\" height=\"104\" data-src=\"holder.js/104x104\"></a>");
		    									var mediaBody = $("<div class=\"media-body\"><h4 class=\"media-heading\"><a href=\"#\" style=\"color:#fff; font-size:38px;\">" + weishangqiangContentResult.wechatUser.nickname + "</a><span class=\"small pull-right\" style=\"font-size:38px;\">" + weishangqiangContentResult.createTime + "</span></h4><p style=\"color:#8bd7ff; font-size:38px; font-weight:bold;\"><span style=\"color:#FFA200\"><img width=\"40\" height=\"auto\" src=\"" + root + weishangqiangContentResult.dashang.img + "\"> 打赏给 \"" + weishangqiangContentResult.dashangTar.name + "\" " + weishangqiangContentResult.dashang.name + " ：" + weishangqiangContentResult.content + "<span></p></div>");
		    									media.append(profile);
		    									media.append(mediaBody);
		    									media.slideDown(800);
		    									$(".str_move").append(media);

		    									dashangAction(weishangqiangContentResult.dashang.video, weishangqiangContentResult.wechatUser.profile, weishangqiangContentResult.wechatUser.nickname, weishangqiangContentResult.dashangTar.name, weishangqiangContentResult.dashang.name, weishangqiangContentResult.content, weishangqiangContentResult.dashang.duration);
	    									}
	    								});
	    								lastTime = result.timestamp;
	    							}
    							}
    							$marquee.liMarquee('update');
    						} else {
    							pushErrMsg("获取服务器数据失败！");
    						}
    					}
    				});
    	        }, 3000);   
    	    });
    	})
    	
    	function ownScreenAction(imgUrl, profile, nickname, content, count) {
    	  setWeishangqiangOff();
    	  var countdown = parseInt(count) + 1;
     	  var img_temp = new Image();
     	  img_temp.src = imgUrl;
     	  img_temp.onload = function(){
     		  var realWidth = img_temp.width;
     		  var realHeight = img_temp.height;
     		  var scale = realWidth/realHeight;
     		  // alert("realWidth:" + realWidth + " realHeight:" + realHeight + " division:" + realHeight/realWidth);
     		  if (scale > 1.2) {
       			 $("#oImg").attr("src", imgUrl).attr("width", "auto").attr("height", "100%");
     		  } else {
      			 $("#oImg").attr("src", imgUrl).attr("width", "100%").attr("height", "auto");
     		  }
     	  }
    	  $("#profile").attr("src", profile);
    	  $("#nickname").text(nickname);
    	  $("#content").text(content);
    	  
    	  $('#ownScreen-box').fadeIn();
    	  // $('body').html('<audio autoplay="autoplay"><source src="' + root + '/resource/audio/bp.mp3"' + 'type="audio/mp3"/><source src="system.mp3" type="audio/mpeg"/></audio>');
    	  oAudio.play();
    	  var s = setInterval(function() {
    		  countdown = countdown - 1;
    		  if (countdown % 4 == 0) {
    			  var num = Math.floor((Math.random() * 10) + 1) % 3;
    			  if (num == 0) {
    				  $("#oImg").fadeOut("fast");
    				  $("#oImg").slideDown(1000);
    			  } 
    			  if (num == 1) {
    				  $("#oImg").slideUp("fast");
    				  $("#oImg").fadeIn(1000);
    			  }
    			  if (num == 2) {
    				  $("#oImg").fadeOut("fast");
    				  $("#oImg").fadeIn(1000);
    			  }
    		  }
    		  if (countdown < 0) {
    			setWeishangqiangOn()
    			clearInterval(s);
	    		$('#ownScreen-box').fadeOut();

	    		$("#oImg").attr("src", "#");
	      	    $("#profile").attr("src", "#");
	      	    $("#nickname").text(" ");
	      	    $("#content").text(" ");
	      	    $('#countdown').text(" ");
    		  } else {
    			if (countdown.toString() != $('#content').text().toString()) {
    				$('#countdown').hide();
    				$('#countdown').text(countdown);
    				$('#countdown').fadeIn();
    			}
    		  }
          }, 1000);
        }
  	
  	function dashangAction(videoUrl, profile, nickname, tar, dashangName, content, count) {
  	  setWeishangqiangOff();
  	  var ds_countdown = parseInt(count) + 1;
   	  var img_temp = new Image();
   	  $("#dashang-video").attr("src", root + videoUrl).attr("width", "auto").attr("height", "100%")
  	  $("#ds-profile").attr("src", profile);
  	  $("#ds-nickname").text(nickname);
  	  $("#ds-content").text(content);
  	  $("#ds-tar").text(tar)
  	  $("#dashangName").text(dashangName);
  	  
  	  $('#dashang-box').fadeIn();
  	  var s = setInterval(function() {
  		  ds_countdown = ds_countdown - 1;
  		  if (ds_countdown < 0) {
  			setWeishangqiangOn();
  			clearInterval(s);
	    		$('#dashang-box').fadeOut();

	    		$("#dashang-video").attr("src", "#");
	      	    $("#ds-profile").attr("src", "#");
	      	    $("#ds-nickname").text(" ");
	      	    $("#ds-content").text(" ");
	      	    $("#ds-tar").text(" ");
	      	    $("#dashangName").text(" ");
	      	    $('#dashang-countdown').text(" ");
  		  } else {
  			if (ds_countdown.toString() != $('#dashang-countdown').text().toString()) {
  				$('#dashang-countdown').hide();
  				$('#dashang-countdown').text(ds_countdown);
  				$('#dashang-countdown').fadeIn();
  			}
  		  }
        }, 1000);
      }
	
		function setWeishangqiangOn() {
	  	    $.ajax({
					url : root + "/customer/weishangqiang/setWeishangqiangOn",
					type : "post",
					cache : false,
					data : {
						weishangqiangId : weishangqiangId
					},
					dataType : "json",
					error : function() {
						
					},
					success : function(result) {
						if (result.code == 0) {
							
						} else {
							
						}
			 		}
	  	    });
	 	}
		
	  	function setWeishangqiangOff() {
		  	    $.ajax({
						url : root + "/customer/weishangqiang/setWeishangqiangOff",
						type : "post",
						cache : false,
						data : {
							weishangqiangId : weishangqiangId
						},
						dataType : "json",
						error : function() {
							
						},
						success : function(result) {
							if (result.code == 0) {
								
							} else {
								
							}
				 		}
		  	    });
	   	}
    </script>
  </head>
  
  <body>
    <div id="ownScreen-box" style="width:100%; height:100%; position:fixed; left:0; top:0; background:#000; z-index:999; display:none;">
      <div class="container-fluid" style="height:100%;">
        <div class="row" style="height:100%;">
          <div class="col-xs-6" style="height:100%; overflow:hidden;">
            <img id="oImg" src="#" style="margin:0px">
          </div>
          <div class="col-xs-6" style="height:100%; padding:100px 0;">
            <div style="padding: 0px 80px; height:25%;">
	          <div class="media">
	            <div class="pull-left">
	              <img id="profile" class="media-object img-circle" src="#" width="104" height="104" data-src="holder.js/104x104">
	            </div>
	            <div class="media-body">
	              <h4 class="media-heading">
	                <span id="nickname" style="color:#fff; font-size:84px;">&nbsp;</span>
	              </h4>
	            </div>
	          </div>
            </div>
            <div style="padding: 30px 80px; height:50%;">
              <p id="content" style="font-size:84px; font-weight:bold; color:#ffa200;">&nbsp;</p>
            </div>
            <div style="padding: 80px; height:25%; text-align:left; font-weight:bold; font-size:64px;">
              <div style="height:85px;">
                <span style="float:left; color:#FFF; text-align:center; height:85px; display:inline-block; padding:10px;">重金霸屏</span>
                <span style="float:left; color:#FFa200; text-align:center; width:95px; height:85px; display:inline-block; padding:10px;">
                  <span id="countdown">&nbsp;</span>
                </span>
                <span style="float:left; color:#FFF; text-align:center; height:85px; display:inline-block; padding:10px;">秒</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div id="dashang-box" style="width:100%; height:100%; position:fixed; left:0; top:0; background:#000; z-index:999; display:none;">
      <div class="container-fluid" style="height:100%;">
        <div class="row" style="height:100%;">
          <div class="col-xs-7" style="height:100%;">
          	<video id="dashang-video" loop="loop" src="#" style="position:absolute; width: auto; height: 100%; top: 0; left: -15%; visibility: visible;" autoplay>
      		</video>
          </div>
          <div class="col-xs-5" style="height:100%; padding:100px 0; opacity:0.9;">
            <div style="padding: 0px 80px; height:25%;">
	          <div class="media">
	            <div class="pull-left">
	              <img id="ds-profile" class="media-object img-circle" src="#" width="104" height="104" data-src="holder.js/104x104">
	            </div>
	            <div class="media-body">
	              <h4 class="media-heading">
	                <span id="ds-nickname" style="color:#fff; font-size:84px;">&nbsp;</span>
	              </h4>
	            </div>
	          </div>
            </div>
            <div style="padding: 30px 80px; height:50%;">
              <p id="" style="font-size:64px; font-weight:bold; color:#ffa200;">打赏给【<span id="ds-tar">&nbsp;</span>】</p>
              <p id="dashangName" style="font-size:64px; font-weight:bold; color:#ffa200;">&nbsp;</p>
              <p id="ds-content" style="font-size:64px; font-weight:bold; color:#ffa200;">&nbsp;</p>
            </div>
            <div style="padding: 80px; height:25%; text-align:left; font-weight:bold; font-size:64px;">
              <div style="height:85px;">
                <span style="float:left; color:#FFF; text-align:center; height:85px; display:inline-block; padding:10px;">倒计时</span>
                <span style="float:left; color:#FFa200; text-align:center; width:95px; height:85px; display:inline-block; padding:10px;">
                  <span id="dashang-countdown">&nbsp;</span>
                </span>
                <span style="float:left; color:#FFF; text-align:center; height:85px; display:inline-block; padding:10px;">秒</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <%-- <div id="loading-box" style="width:100%; height:100%; position:fixed; left:0; top:0; background:#000; z-index:9999; text-align:center; visibility:hidden">
      <video id="loading" src="<%=request.getContextPath()%>/resource/video/loading.mp4" style="position: fixed; width: 100%; height: auto; top: 0px; left: 0px; right: 0px; margin: 0px; visibility: visible;" autoplay>
      </video>
    </div> --%>
    
    <img id="ws_bg" style="position: fixed; left: -0px; height: 100%; width: 100%; z-index: -1;" alt="" src="${currentWeishangqiang.bgUrl}">
    <div style="margin-left:5%; margin-right:5%;" class="container-fluid">
      <div class="row">
      	<div class="col-xs-4" style="margin:0 0;"><img width="100" height="auto" src="${currentBusiness.logo}" onclick="$marquee.liMarquee('update');"></div>
        <h3 style="font-size:48px; color:#fff; margin:30px 0;" class="col-xs-4">欢迎光临&nbsp;<span id="title">${currentWeishangqiang.title}</span></h3>
      </div>
      <div id="main" class="row" style="position:fixed; height:85%; width:90%;">
        
        <div id="left" class="col-xs-9 marquee" style="height:95%; /* overflow-x:scroll; */">
        <!-- <marquee direction="up" contenteditable="true" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" scrollamount="3"> -->
          <c:choose>
          <c:when test="true">
          <c:forEach items="${currentWeishangqiangContentResultList}" var="weishangqiangContentResult" varStatus="status">
          <c:choose>
          <c:when test="${weishangqiangContentResult.type == '0'}">
	          <div class="media" style="padding:20px; background-color:#000; border-radius:10px; opacity:0.7;">
	            <a class="pull-left" href="#">
	              <img style="margin-left:20px; margin-right:20px;" class="media-object img-circle" src="${weishangqiangContentResult.wechatUser.profile}" width="104" height="104" data-src="holder.js/104x104">
	            </a>
	            <div class="media-body">
	              <h4 class="media-heading">
	                <a href="#" style="color:#fff; font-size:38px;">${weishangqiangContentResult.wechatUser.nickname}</a>
	                <span class="small pull-right" style="font-size:38px;">${weishangqiangContentResult.createTime}</span>
	              </h4>
	              <p style="color:#8bd7ff; font-size:38px; font-weight:bold;">${weishangqiangContentResult.content}</p>
	            </div>
	          </div>
          </c:when>
          <c:when test="${weishangqiangContentResult.type == '1'}">
	          <div class="media" style="padding:20px; background-color:#000; border-radius:10px; opacity:0.8;">
	            <a class="pull-left" href="#">
	              <img style="margin-left:20px; margin-right:20px;" class="media-object img-circle" src="${weishangqiangContentResult.wechatUser.profile}" width="104" height="104" data-src="holder.js/104x104">
	            </a>
	            <div class="media-body">
	              <h4 class="media-heading">
	                <a href="#" style="color:#fff; font-size:38px;">${weishangqiangContentResult.wechatUser.nickname}</a>
	                <span class="small pull-right" style="font-size:38px;">${weishangqiangContentResult.createTime}</span>
	              </h4>
	              <p style="color:#8bd7ff; font-size:38px; font-weight:bold;">
	              <span style="color:#FFA200">重金霸屏：${weishangqiangContentResult.content}</span>
	              <br><img width="30%" height="auto" src="${weishangqiangContentResult.imgUrl}">
	              </p>
	            </div>
	          </div>
          </c:when>
          <c:when test="${weishangqiangContentResult.type == '2'}">
	          <div class="media" style="padding:20px; background-color:#000; border-radius:10px; opacity:0.8;">
	            <a class="pull-left" href="#">
	              <img style="margin-left:20px; margin-right:20px;" class="media-object img-circle" src="${weishangqiangContentResult.wechatUser.profile}" width="104" height="104" data-src="holder.js/104x104">
	            </a>
	            <div class="media-body">
	              <h4 class="media-heading">
	                <a href="#" style="color:#fff; font-size:38px;">${weishangqiangContentResult.wechatUser.nickname}</a>
	                <span class="small pull-right" style="font-size:38px;">${weishangqiangContentResult.createTime}</span>
	              </h4>
	              <p style="color:#8bd7ff; font-size:38px; font-weight:bold;">
	              <span style="color:#FFA200"><img width="40" height="auto" src="<%=request.getContextPath()%>${weishangqiangContentResult.dashang.img}"> 打赏给 "${weishangqiangContentResult.dashangTar.name}" ${weishangqiangContentResult.dashang.name} ：${weishangqiangContentResult.content}<span>
	              </p>
	            </div>
	          </div>
          </c:when>
          </c:choose>
          </c:forEach>
          </c:when>
          <c:otherwise>
          </c:otherwise>
          </c:choose>
        <!-- </marquee> -->
        </div>
        
        <div id="right" class="col-xs-3" style="height:90%;">
          <div id="right-top" style="margin:10px auto; height:60%; width:85%; text-align:center;">
	        <div id="own-screen-carousel" class="carousel slide" style="width:100%; height:100%; display:inline-block; overflow:hidden;" data-ride="carousel">
	          <div id="carousel-box" class="carousel-inner">
		      <div class="item active">
		        <a href="#"><img width="440px" height="auto" src="<%=request.getContextPath()%>/resource/img/lunbo_default.png"></a>
		      </div>  
	          <c:choose>
	          <c:when test="true">
	          <c:forEach items="${currentWeishangqiangContentResultList}" var="weishangqiangContentResult" varStatus="status">
	          <c:choose>
	          <c:when test="${weishangqiangContentResult.type == '0'}">
	          <c:if test="${fn:contains(weishangqiangContentResult.content, '<img')}">
		        <div class="item">
		          <a href="#">${fn:replace(weishangqiangContentResult.content, "30%", "100%")}</a>
		        </div>
		      </c:if> 
	          </c:when>
	          <c:when test="${weishangqiangContentResult.type == '1'}">
		        <div class="item">
		          <a href="#"><img width="100%" height="auto" src="${weishangqiangContentResult.imgUrl}"></a>
		        </div>  
	          </c:when>
	          </c:choose>
	          </c:forEach>
	          </c:when>
	          <c:otherwise>
	          </c:otherwise>
	          </c:choose>
	          </div>
	        </div>
          </div>
          <div id="right-bottom" style="margin:10px; text-align:center; height:25%;">
            <img alt="" src="<%=request.getContextPath()%>${currentWeishangqiang.qrcode}" width="80%" height="auto" style="margin:0 auto;">
            <h3 style="color:#fff;">扫描二维码上大屏幕</h3>
          </div>
        </div>
        
      </div>
    </div>
    <audio id="oAudio">
      <source src="<%=request.getContextPath()%>/resource/audio/bp.mp3" type="audio/mpeg">
    </audio>
  </body>
</html>