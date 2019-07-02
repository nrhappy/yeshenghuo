<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
 <script type="text/javascript">  
    var root = "<%=request.getContextPath()%>";  
    $(document).ready(function(){
	  
	   //o7W6yt9DUOBpjEYogs4by1hD_OQE
	   
	    $("#test").click(function() {
	    	 var openid = "o7W6yt9DUOBpjEYogs4by1hD_OQE";
	    	alert(openid);
			  $.ajax({
				  url : root + "/pay/orderInfo",
				  type : "post",
				  cache : false,
				  data : {
					  openid : openid
				  },
				  dataType : "json",
				  error : function() {
				  	alert("网络出错！");
				  },
				  success : function(data) {
					  alert("success");
					  alert(data.agent);
					 // var obj = eval("(" + data + ")");  
			            if(parseInt(data.agent)<5){  
			                alert("您的微信版本低于5.0无法使用微信支付");  
			                return;  
			            }  
			             WeixinJSBridge.invoke('getBrandWCPayRequest',{  
			                "appId" : data.appId,                  //公众号名称，由商户传入  
			                "timeStamp":data.timeStamp,          //时间戳，自 1970 年以来的秒数  
			                "nonceStr" : data.nonceStr,         //随机串  
			                "package" : data.packageValue,      //<span style="font-family:微软雅黑;">商品包信息</span>  
			                "signType" : data.signType,        //微信签名方式:  
			                "paySign" : data.paySign           //微信签名  
			                },function(res){      
			                    alert(res.err_msg);  
			                if(res.err_msg == "get_brand_wcpay_request:ok" ) {  
			                    window.location.href=data.sendUrl;  
			                }else{  
			                    alert("fail");  
			                    window.location.href="http://183.45.18.197:8016/wxweb/config/oauth!execute.action";     
			                                       //<span style="font-family:微软雅黑;">当失败后，继续跳转该支付页面让用户可以继续付款，贴别注意不能直接调转jsp，</span><span style="font-size:10.5pt">不然会报</span><span style="font-size:12.0pt"> system:access_denied。</span>  
			                }  
			            });   
				  }
			  });
		  });
     /*  $("#test").click(function(){ 
    	 alert(basePath);
        $.ajax({  
        	type : "post",
            url : basePath + "/pay/orderInfo",
            cache : false,
             data : {
            	openid : openid
			  }, 
			  dataType : "json",
			    error : function() {
				  	alert("网络出错！");
				  },
		        success : function(data) {
					  var obj = eval('(' + data + ')');  
			            if(parseInt(obj.agent)<5){  
			                alert("您的微信版本低于5.0无法使用微信支付");  
			                return;  
			            }  
			             WeixinJSBridge.invoke('getBrandWCPayRequest',{  
			                "appId" : obj.appId,                  //公众号名称，由商户传入  
			                "timeStamp":obj.timeStamp,          //时间戳，自 1970 年以来的秒数  
			                "nonceStr" : obj.nonceStr,         //随机串  
			                "package" : obj.packageValue,      //<span style="font-family:微软雅黑;">商品包信息</span>  
			                "signType" : obj.signType,        //微信签名方式:  
			                "paySign" : obj.paySign           //微信签名  
			                },function(res){      
			                    alert(res.err_msg);  
			                if(res.err_msg == "get_brand_wcpay_request:ok" ) {  
			                    window.location.href=obj.sendUrl;  
			                }else{  
			                    alert("fail");  
			                    window.location.href="http://183.45.18.197:8016/wxweb/config/oauth!execute.action";     
			                                       //<span style="font-family:微软雅黑;">当失败后，继续跳转该支付页面让用户可以继续付款，贴别注意不能直接调转jsp，</span><span style="font-size:10.5pt">不然会报</span><span style="font-size:12.0pt"> system:access_denied。</span>  
			                }  
			            });   
				  }
           
        });  
    });  */
   })
    </script> 
</head>
<body>
<form action="" method="post" > 
	<input id="openid" type="text" value=""> 
        <input type="button" value="确认支付" name="ajaxLoadId" id="test"/>  
    </form>  
</body>
</html>