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
	<script src="<%=request.getContextPath()%>/resource/webuploader-0.1.5/webuploader.custom.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/base.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/customer/weishangqiang.js"></script>
    <script>
      var root  = "<%=request.getContextPath()%>";
      
      var businessId = "${currentBusiness.id}";
      var wechatUserId = "${currentWechatUser.id}";
      var wechatOpenId = "${currentWechatUser.openId}";
      var weishangqiangId = "${currentWeishangqiang.id}";
      var lastTime = "${timestamp}";
      var pause = "${currentWeishangqiang.pause}";
      var wechatUserRole = "${businessWechatUser.role}";
      var wechatUserOwnScreenCount = "${businessWechatUser.ownScreenCount}";
      var orderNo;
      var ownScreenList;
      var ownScreenSelected;
      
      

    	function payOrder(orderNo, wechatUserId) {
    	    $.ajax({
				url : root + "/customer/weishangqiang/payOrder",
				type : "post",
				cache : false,
				data : {
					orderNo : orderNo,
					wechatUserId : wechatUserId
				},
				dataType : "json",
				error : function() {
					return false;
				},
				success : function(result) {
					if (result.code == 0) {
						return true;
					} else {
						return false;
					}
		 		}
    	    });
        }
      
		function wcPay(appId, timeStamp, nonceStr, prepay_id, paySign, type) {
			WeixinJSBridge.invoke('getBrandWCPayRequest', {
				"appId" : appId,
				"timeStamp" : timeStamp,
				"nonceStr" : nonceStr,
				"package" : prepay_id,
				"signType" : "MD5",
				"paySign" : paySign
			}, function(res) {
				if (res.err_msg == "get_brand_wcpay_request:ok") {
					payOrder(orderNo, wechatUserId);
					if (type == 0) {
						$.ajax({
    	    				url : root + "/customer/weishangqiang/sendOwnScreen",
    	    				type : "post",
    	    				cache : false,
    	    				data : {
    	    					wechatUserId : wechatUserId,
    	    					weishangqiangId : weishangqiangId,
    	    					ownScreenId : ownScreenSelected.id,
    	    					imgUrl : $("#own-screen-img").attr("src"),
    	    					content : $("#own-screen-content").val()
    	    				},
    	    				dataType : "json",
    	    				error : function() {
    	    					pushErrMsg("发送信息失败1！");
    	    				},
    	    				success : function(result) {
    	    					if (result.code == 0) {
    	    						$("#bapin-buy-model").modal("hide");
    	    					} else {
    	    						pushErrMsg("发送信息失败2！");
    	    					}
    	    				}
    	    			});
					} else {
						$.ajax({
		    				url : root + "/customer/weishangqiang/sendDashang",
		    				type : "post",
		    				cache : false,
		    				data : {
		    					wechatUserId : wechatUserId,
		    					weishangqiangId : weishangqiangId,
		    					dashangId : $('input:radio[name="dashang"]:checked').val(),
		    					dashengTarId : $("#dashang-tar").val(),
		    					content : $("#dashang-content").val()
		    				},
		    				dataType : "json",
		    				error : function() {
		    					pushErrMsg("发送信息失败1！");
		    				},
		    				success : function(result) {
		    					if (result.code == 0) {
		    						$("#dashang-buy-model").modal("hide");
		    						$("#dashang-buy-total").text("0");
		    					} else {
		    						pushErrMsg("发送信息失败2！");
		    					}
		    				}
		    			});
					}
				} else {
					
				}
			});
		}
    	
    	function selectOwnScreen(ownScreenId) {    	  
    	  $.each(ownScreenList, function(index, ownScreen) {
    		  if (ownScreenId == ownScreen.id) {
    			  ownScreenSelected = ownScreen;
    			  $("#bapin-buy-total").text(ownScreen.price);
    		  }
    	  });
      	}
    	
    	function selectDashang(dashangId, dashangPrice) {
    		$("#dashang-buy-total").text(dashangPrice);
      	}
    </script>
  </head>
  
  <body>
    <div style="background-color:#fff; height:75px; overflow:hidden; margin-bottom:20px; position:fixed; top:0px; left:0px; z-index:999;">
      <img src="<%=request.getContextPath() %>/resource/img/mmexport.jpeg" width="100%" height="auto">
      <h5 style="position:fixed; top:20px; left:15px; color:#fff;">发送内容，现场上墙互动</h5>
    </div>
    <div class="container-fluid" style="background-color:#fff; margin-bottom:55px;">
      <div class="row">
        <div class="col-xs-12" id="blessing-box" style="padding-top:85px;">
          <c:choose>
          <c:when test="true">
          <c:forEach items="${currentWeishangqiangContentResultList}" var="weishangqiangContentResult" varStatus="status">
          <c:choose>
          <c:when test="${weishangqiangContentResult.type == '0'}">
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
          </c:when>
          <c:when test="${weishangqiangContentResult.type == '1'}">
          <div class="media">
            <a class="pull-left" href="#">
              <img class="media-object img-circle" style="border:1px solid #6787da; margin-top:5px;" src="${weishangqiangContentResult.wechatUser.profile}" width="40" height="40" data-src="holder.js/40x40">
            </a>
            <div class="media-body">
              <p class="media-heading">
                <div style="border-radius:5px; border:1px solid #99cc66; background-color:#b0e765; padding:13px; float:left;">
                <span style="color:#FFA200">重金霸屏：${weishangqiangContentResult.content}</span>
	            <br><img width="30%" height="auto" src="${weishangqiangContentResult.imgUrl}">
                </div>
              </p>
              <p style="display:block; width:100%; float:left; margin-top:10px; margin-bottom:0px;" class="text-muted small">${weishangqiangContentResult.createTime}</p>
            </div>
          </div>
          </c:when>
          <c:when test="${weishangqiangContentResult.type == '2'}">
          
          
	          <%-- <div class="media" style="padding:20px; background-color:#000; border-radius:10px; opacity:0.8;">
	            <a class="pull-left" href="#">
	              <img style="margin-left:20px; margin-right:20px;" class="media-object img-circle" src="${weishangqiangContentResult.wechatUser.profile}" width="104" height="104" data-src="holder.js/104x104">
	            </a>
	            <div class="media-body">
	              <h4 class="media-heading">
	                <a href="#" style="color:#fff; font-size:38px;">${weishangqiangContentResult.wechatUser.nickname}</a>
	                <span class="small pull-right" style="font-size:38px;">${weishangqiangContentResult.createTime}</span>
	              </h4>
	              <p style="color:#8bd7ff; font-size:38px; font-weight:bold;">
	              <span style="color:#FFA200"><span>
	              </p>
	            </div>
	          </div> --%>
          
          <div class="media">
            <a class="pull-left" href="#">
              <img class="media-object img-circle" style="border:1px solid #6787da; margin-top:5px;" src="${weishangqiangContentResult.wechatUser.profile}" width="40" height="40" data-src="holder.js/40x40">
            </a>
            <div class="media-body">
              <p class="media-heading">
                <div style="border-radius:5px; border:1px solid #99cc66; background-color:#b0e765; padding:13px; float:left;">
                <span style="color:#FFA200"><img width="14" height="auto" src="<%=request.getContextPath()%>${weishangqiangContentResult.dashang.img}"> 打赏给 "${weishangqiangContentResult.dashangTar.name}" ${weishangqiangContentResult.dashang.name} ：${weishangqiangContentResult.content}</span>
                </div>
              </p>
              <p style="display:block; width:100%; float:left; margin-top:10px; margin-bottom:0px;" class="text-muted small">${weishangqiangContentResult.createTime}</p>
            </div>
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
    
    <div class="modal fade in" id="bapin-buy-model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
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
                <div class="container" style="margin-bottom:10px;">
                  <div class="row">
                    <div class="col-xs-12"><span class="text-danger">&nbsp;&nbsp;* 请依次填写霸屏内容，选择霸屏图片</span></div>
                  </div>
                </div>
                <div class="container">  
                  <div class="row" style="padding:5px;">
                    <div class="col-xs-7">
                      <textarea id="own-screen-content" style="height:80px; font-size:12px;" class="form-control" rows="" cols="" placeholder="请不要发布广告涉黄等内容，霸屏不支持退款"></textarea>
                    </div>
                    <div class="col-xs-5">
                      <div id="own-screen-img-upload" style="height:80px; border-radius:4px; border:1px solid #ccc; padding:0px; over-flow:hidden; z-index:999;" class="">
                        <span style="font-size:55px; margin:3px 4px;" class="glyphicon glyphicon-picture text-muted"></span>
                        <img id="own-screen-img" style="width:100%; height:105%; border-radius:4px; padding:0px; margin:0px; position:absolute; top:0px; left:0px; right:0px; bottom:0px; display:none;" src="">
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
                <c:choose>
                  <c:when test="${businessWechatUser.role == 1 and businessWechatUser.ownScreenCount != 0}"><button id="bapin-buy-btn" type="button" class="btn btn-success btn-sm">免费霸屏</button></c:when>
                  <c:otherwise><button id="bapin-buy-btn" type="button" class="btn btn-success btn-sm">购买霸屏</button></c:otherwise>
                </c:choose>
                
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
              
              <div class="form-group" >
                <div class="container">
                  <div class="">
                    <select id="dashang-tar" class="form-control">
                    <option value="0" disabled selected>请输入打赏节目</option>
                    <c:forEach items="${dashangTarList}" var="dashangTar" varStatus="status">
                      <option value="${dashangTar.id}">${dashangTar.name}</option>
                    </c:forEach>
                    </select>
                  </div>
                </div>
              </div>
              <div class="form-group" >
                <div class="container">
                  <div class="">
                    <input id="dashang-content" name="dashang-content" class="form-control" placeholder="请输入打赏评语，30字以内">
                  </div>
                </div>
              </div>
              <div class="form-group" >
                <div class="container">  
                  <div class="">
					<ul class="list-group">
                      <c:forEach items="${dashangList}" var="dashang" varStatus="status">
                      <li class="list-group-item">
                        <img class="" width="25" height="auto" src="<%=request.getContextPath()%>${dashang.img}">&nbsp;&nbsp;
                        <span class="text-muted">${dashang.name}</span>
                        <input name="dashang" class="pull-right" type="radio" value="${dashang.id}" onclick="selectDashang('${dashang.id}', '${dashang.price}');">
                        <span style="margin-right:15px; margin-top:2px;" class="pull-right text-muted">${dashang.duration}秒</span>
                        <span style="margin-right:20px; margin-top:2px;" class="pull-right text-muted">￥${dashang.price}</span>
                      </li>
                      </c:forEach>
					</ul>
                  </div>
                </div>
              </div>
              
              <div class="form-group" style="text-align:right;">
                <label>需微信支付：￥<span id="dashang-buy-total">0</span></label>
              </div>
              <div class="form-group" style="text-align:center;">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                <c:choose>
                  <c:when test="${businessWechatUser.role == 1 and businessWechatUser.ownScreenCount != 0}"><button id="dashang-buy-btn" type="button" class="btn btn-success btn-sm" onclick="">免费打赏</button></c:when>
                  <c:otherwise><button id="dashang-buy-btn" type="button" class="btn btn-success btn-sm" onclick="">购买打赏</button></c:otherwise>
                </c:choose>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
  </body>
</html>