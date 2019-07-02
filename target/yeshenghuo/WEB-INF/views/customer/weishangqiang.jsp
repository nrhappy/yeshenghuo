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
    <link href="<%=request.getContextPath()%>/resource/webuploader-0.1.5/webuploader.css" rel="stylesheet">
    <style>
      .selected { background-color: #000; border-color: #000; }
    </style>
    
    
    <script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/resource/webuploader-0.1.5/webuploader.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/base.js"></script>
    <script>
      var root  = "<%=request.getContextPath()%>";
      
      var businessId = "${currentBusiness.id}";
      var wechatUserId = "${currentWechatUser.id}";
      var wechatOpenId = "${currentWechatUser.openId}";
      var weishangqiangId = "${currentWeishangqiang.id}";
      var lastTime = "${timestamp}";
      var ownScreenList;
      var ownScreenSelected;
      
      $(document).ready(function() {
    	  $.ajax({
    		  url: root + "/customer/weishangqiang/ownScreenList",
    		  type: "get",
    		  cache: false,
    		  dataType: "json",
    		  error: function() {
    			  alert("霸屏列表获取失败！");
    		  },
    		  success: function(result) {
    			  if (result.code == 0) {
    				ownScreenList = result.data.ownScreenList;
    				$.each(ownScreenList, function(index, ownScreen) {
    					var element = "<div class=\"col-xs-6\"><a id=\"" + ownScreen.id + "\" class=\"btn btn-default btn-sm btn-block\" href=\"#\" onclick=\"selectOwnScreen(" + ownScreen.id + ")\">" + ownScreen.name + "</a></div>";
    					$("#goods-list").append(element);
    				});				
    			  } else {
    				  pushErrMsg("发送信息失败2！");
    			  }
    		  }
    	  });
    	  
    	   var sendImg = WebUploader.create({
    	       auto: true,
    	       method : 'POST',
    	       server : root + '/file/upload',
    	       pick : '#sendImg',  
    	       accept: {  
    	           title : 'Images',  
    	           extensions : 'gif,jpg,jpeg,bmp,png',  
    	           mimeTypes : 'image/*'  
    	       }
    	   });
    	   
    	   sendImg.on('uploadSuccess', function(file, result) {
			  	if (result.code == 0) {
			  		
	    			$.ajax({
	    				url : root + "/customer/weishangqiang/send",
	    				type : "post",
	    				cache : false,
	    				data : {
	    					wechatUserId : wechatUserId,
	    					weishangqiangId : weishangqiangId,
	    					content : "<img style=\"max-width:250px; height:auto;\" src=\"" + result.data.fileUrl + "\">"
	    				},
	    				dataType : "json",
	    				error : function() {
	    					pushErrMsg("发送信息失败1！");
	    				},
	    				success : function(result) {
	    					if (result.code == 0) {
	    						$("#content").val("");
	    						$("#send").attr("disabled", "disabled");
	    						$("body").scrollTop(-100);
	    					} else {
	    						pushErrMsg("发送信息失败2！");
	    					}
	    				}
	    			});
			  	}
    		});
    	   
    	   var ownScreenImgUpload = WebUploader.create({
    	       auto: true,
    	       method : 'POST',
    	       server : root + '/file/upload',
    	       pick : '#own-screen-img-upload',  
    	       accept: {  
    	           title : 'Images',  
    	           extensions : 'gif,jpg,jpeg,bmp,png',  
    	           mimeTypes : 'image/*'  
    	       }
    	   });
    	   

    	   
    	   ownScreenImgUpload.on('uploadSuccess', function(file, result) {
			  	if (result.code == 0) {
			  		
	    			$.ajax({
	    				url : root + "",
	    				type : "post",
	    				cache : false,
	    				data : {
	    					content : result.data.fileUrl
	    				},
	    				dataType : "json",
	    				error : function() {
	    					pushErrMsg("发送信息失败1！");
	    				},
	    				success : function(result) {
	    					if (result.code == 0) {
	    						
	    					} else {
	    						pushErrMsg("发送信息失败！");
	    					}
	    				}
	    			});
			  	}
    		});
    	  
    		$(function(){
    			setInterval(function() {
    				$.ajax({
    					url : root + "/customer/weishangqiang/content",
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
    							if (result.data.currentWeishangqiang.pause != 1) {
	    							if (result.data.currentWeishangqiangContentResultList.length != 0) {
	    								$.each(result.data.currentWeishangqiangContentResultList, function(i, weishangqiangContentResult) {
	    									var blessingBox = $("#blessing-box");
	    									var media = $("<div class=\"media\" style=\"display:none;\"></div>");
	    									var profile = $("<a class=\"pull-left\" href=\"#\"><img class=\"media-object img-circle\" class=\"media-object img-circle\" style=\"border:1px solid #6787da; margin-top:5px;\" src=\"" + weishangqiangContentResult.wechatUser.profile + "\" width=\"40\" height=\"40\" data-src=\"holder.js/40x40\"></a>");
	    									var mediaBody = $("<div class=\"media-body\"><p class=\"media-heading\"><div style=\"border-radius:5px; border:1px solid #99cc66; background-color:#b0e765; padding:13px; float:left;\">" + weishangqiangContentResult.content + "</div></p><p style=\"display:block; width:100%; float:left; margin-top:10px; margin-bottom:0px;\" class=\"text-muted small\">" + weishangqiangContentResult.createTime + "</p></div>");
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
    		
    		$(document).keyup(function(){
    			if ($("#content").val().length < 1) {
    				$("#send").attr("disabled", "disabled");
    			} else {
    				$("#send").removeAttr("disabled");
    			}
    		});
    		
    		$("#send").click(function() {
    			$.ajax({
    				url : root + "/customer/weishangqiang/send",
    				type : "post",
    				cache : false,
    				data : {
    					wechatUserId : wechatUserId,
    					weishangqiangId : weishangqiangId,
    					content : $("#content").val()
    				},
    				dataType : "json",
    				error : function() {
    					pushErrMsg("发送信息失败1！");
    				},
    				success : function(result) {
    					if (result.code == 0) {
    						$("#content").val("");
    						$("#send").attr("disabled", "disabled");
    						$("body").scrollTop(-100);
    					} else {
    						pushErrMsg("发送信息失败2！");
    					}
    				}
    			});
    		});
    		
    		$("#send-img-btn").click(function() {
    			$("#send-img").uploadifyUpload();
    		});
    		
    		$("div#goods-list a").click(function() {
    			alert($(this).text());
    		});
    		
    		$('#bapin-buy-model').on('hidden.bs.modal', function () {
    			$("#bapin-buy-total").text("0");
    			ownScreenSelected = null;
    		})
    		
    	})
    	
    	function selectOwnScreen(ownScreenId) {    	  
    	  $.each(ownScreenList, function(index, ownScreen) {
    		  if (ownScreenId == ownScreen.id) {
    			  ownScreenSelected = ownScreen;
    			  $("#bapin-buy-total").text(ownScreen.price);
    		  }
    	  });
      	}
      
        function payOwnScreen() {
        	
        }
      
      
    </script>
  </head>
  
  <body>
    <div style="background-color:#fff; height:75px; overflow:hidden; margin-bottom:20px;">
      <img src="<%=request.getContextPath()%>/resource/img/mmexport.jpeg" width="100%" height="auto">
      <h5 style="position:absolute; top:20px; left:15px; color:#fff;">发送内容，现场上墙互动</h5>
    </div>
    <div class="container-fluid" style="background-color:#fff;">
      <div class="row">
        <div class="col-xs-12" id="blessing-box">
          <c:choose>
          <c:when test="true">
          <c:forEach items="${currentWeishangqiangContentResultList}" var="weishangqiangContentResult" varStatus="status">
          <div class="media">
            <a class="pull-left" href="#">
              <img class="media-object img-circle" style="border:1px solid #6787da; margin-top:5px;" src="${weishangqiangContentResult.wechatUser.profile}" width="40" height="40" data-src="holder.js/40x40">
            </a>
            <div class="media-body">
              <p class="media-heading">
                <div style="border-radius:5px; border:1px solid #99cc66; background-color:#b0e765; padding:13px; float:left;">${weishangqiangContentResult.content}</div>
              </p>
              <p style="display:block; width:100%; float:left; margin-top:10px; margin-bottom:0px;" class="text-muted small">${weishangqiangContentResult.createTime}</p>
            </div>
          </div>
          </c:forEach>
          </c:when>
          <c:otherwise>
          </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
    
    <a href="javascript:$('#bapin-buy-model').modal('show');" style="position:fixed; bottom:120px; right:10px; border-radius:50%; background-color:#fc3; border:2px solid #efefef; line-height:18px; font-size:18px; padding:12px; color:#fff; text-decoration:none;">霸</a>
    <a href="javascript:$('#dashang-buy-model').modal('show');" style="position:fixed; bottom:60px; right:10px; border-radius:50%; background-color:#f99; border:2px solid #efefef; line-height:18px; font-size:18px; padding:12px; color:#fff; text-decoration:none;">赏</a>
    
    <div class="navbar-fixed-bottom">
      <div class="row" style="padding:5px; margin:0px; background-color:#eee; border-top:1px solid #ddd;">
        <span class="" style="display:inline; float:left;">
          <div id="sendImg"><span class="glyphicon glyphicon-folder-open"></span></div>
        </span>
        <input class="form-control" id="content" type="text" placeholder="输入内容..." style="float:left; display:inline; width:70%; border-radius:3px; border-style:none; border:1px solid #ccc; outline:none;">
        <button class="btn btn-success" style="float:right; border-radius:3px; margin-left:5px;" id="send" type="button" disabled>发送</button>
      </div> 
    </div>
    
    <div class="modal fade" id="bapin-buy-model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <form role="form" method="post" action="">
              <div class="form-group" style="text-align:center;">
                <label style="color:#3c3;">霸屏</label>
              </div>
              <div class="form-group" >
                <div class="container">
                  <style>
                    .col-xs-6 { margin-bottom: 10px; }
                  </style>    
                  <div id="goods-list" class="row" style="padding:10px;">               
                  </div>
                </div>
              </div>
              <div class="form-group" >
                <div class="container">  
                  <div class="row" style="padding:5px;">
                    <div class="col-xs-7">
                      <textarea style="height:80px; font-size:12px;" class="form-control" rows="" cols="" placeholder="请不要发布广告涉黄等内容，霸屏不支持退款"></textarea>
                    </div>
                    <div class="col-xs-5">
                      <div id="own-screen-img-upload" style="height:80px; border-radius:4px; border:1px solid #ccc;" class="">
                        <span style="font-size:55px; margin:3px 4px;" class="glyphicon glyphicon-picture text-muted"></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group" style="text-align:right;">
                <label style="margin-right:20px;">需微信支付：￥<span id="bapin-buy-total">0</span></label>
              </div>
              <div class="form-group" style="text-align:center;">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success btn-sm" onclick="">购买霸屏</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <div class="modal fade" id="dashang-buy-model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <form role="form" method="post" action="">
              <div class="form-group" style="text-align:left;">
                <label style="color:#3c3;">为喜欢的表演者霸屏打赏</label>
              </div>
              <div class="form-group">
                item
              </div>
              <div class="form-group" style="text-align:right;">
                <label>需微信支付：￥<span id="dashang-buy-total">0</span></label>
              </div>
              <div class="form-group" style="text-align:center;">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success btn-sm" onclick="">购买打赏</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
  </body>
</html>