$(document).ready(function() {
   	  $("body").scrollTop(999999999);
   	  
   	var ownScreenImgUpload;
   	  
   	  $.ajax({
   		  url: root + "/customer/weishangqiang/ownScreenList?weishangqiangId=" + weishangqiangId,
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
  	   
  	   ownScreenImgUpload = WebUploader.create({
  	       auto: true,
  	       method : 'POST',
  	       server : root + '/file/upload',
  	       pick : '#own-screen-img-upload',  
  	       accept: {  
  	           title : 'Images',  
  	           extensions : 'gif,jpg,jpeg,bmp,png',  
  	           mimeTypes : 'image/jpg,image/jpeg,image/png'
  	       }
  	   });
  	   
   	   
  	   ownScreenImgUpload.on('uploadSuccess', function(file, result) {
		  	if (result.code == 0) {
   			$("#own-screen-img").attr("src", result.data.fileUrl);
   			$("#own-screen-img").show();
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
   	           mimeTypes : 'image/jpg,image/jpeg,image/png'  
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
    					content : "<img style=\"width:30%; height:auto;\" src=\"" + result.data.fileUrl + "\">"
    				},
    				dataType : "json",
    				error : function() {
    					pushErrMsg("发送信息失败1！");
    				},
    				success : function(result) {
    					if (result.code == 0) {
    						$("#content").val("");
    						$("#send").attr("disabled", "disabled");
    					} else {
    						pushErrMsg("发送信息失败2！");
    					}
    				}
    			});
		  	}
   		});
   	  
   		setInterval(function() {
   			$.ajax({
   				url : root + "/customer/weishangqiang/content",
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
   							
    						if (result.data.currentWeishangqiangContentResultList.length != 0) {
    							$.each(result.data.currentWeishangqiangContentResultList, function(i, weishangqiangContentResult) {
    								if (weishangqiangContentResult.type == "0") {
	    								var blessingBox = $("#blessing-box");
	    								var media = $("<div class=\"media\" style=\"display:none;\"></div>");
	    								var profile = $("<a class=\"pull-left\" href=\"#\"><img class=\"media-object img-circle\" class=\"media-object img-circle\" style=\"border:1px solid #6787da; margin-top:5px;\" src=\"" + weishangqiangContentResult.wechatUser.profile + "\" width=\"40\" height=\"40\" data-src=\"holder.js/40x40\"></a>");
	    								var mediaBody = $("<div class=\"media-body\"><p class=\"media-heading\"><div style=\"border-radius:5px; border:1px solid #99cc66; background-color:#b0e765; padding:13px; float:left;\">" + weishangqiangContentResult.content + "</div></p><p style=\"display:block; width:100%; float:left; margin-top:10px; margin-bottom:0px;\" class=\"text-muted small\">" + weishangqiangContentResult.createTime + "</p></div>");
	    								media.append(profile);
	    								media.append(mediaBody);
	    								blessingBox.append(media);
	    								media.fadeIn(800);
    								} else if (weishangqiangContentResult.type == "1") {
	    								var blessingBox = $("#blessing-box");
	    								var media = $("<div class=\"media\" style=\"display:none;\"></div>");
	    								var profile = $("<a class=\"pull-left\" href=\"#\"><img class=\"media-object img-circle\" class=\"media-object img-circle\" style=\"border:1px solid #6787da; margin-top:5px;\" src=\"" + weishangqiangContentResult.wechatUser.profile + "\" width=\"40\" height=\"40\" data-src=\"holder.js/40x40\"></a>");
	    								var mediaBody = $("<div class=\"media-body\"><p class=\"media-heading\"><div style=\"border-radius:5px; border:1px solid #99cc66; background-color:#b0e765; padding:13px; float:left;\"><span style=\"color:#FFA200\">重金霸屏：" + weishangqiangContentResult.content + "<span><br><img width=\"30%\" height=\"auto\" src=\"" + weishangqiangContentResult.imgUrl + "\"></div></p><p style=\"display:block; width:100%; float:left; margin-top:10px; margin-bottom:0px;\" class=\"text-muted small\">" + weishangqiangContentResult.createTime + "</p></div>");
	    								media.append(profile);
	    								media.append(mediaBody);
	    								blessingBox.append(media);
	    								media.fadeIn(800);
    								} else if (weishangqiangContentResult.type == "2") {
	    								var blessingBox = $("#blessing-box");
	    								var media = $("<div class=\"media\" style=\"display:none;\"></div>");
	    								var profile = $("<a class=\"pull-left\" href=\"#\"><img class=\"media-object img-circle\" class=\"media-object img-circle\" style=\"border:1px solid #6787da; margin-top:5px;\" src=\"" + weishangqiangContentResult.wechatUser.profile + "\" width=\"40\" height=\"40\" data-src=\"holder.js/40x40\"></a>");
	    								var mediaBody = $("<div class=\"media-body\"><p class=\"media-heading\"><div style=\"border-radius:5px; border:1px solid #99cc66; background-color:#b0e765; padding:13px; float:left;\"><span style=\"color:#FFA200\"><img width=\"14\" height=\"auto\" src=\"" + root + weishangqiangContentResult.dashang.img + "\"> 打赏给 \"" + weishangqiangContentResult.dashangTar.name + "\" " + weishangqiangContentResult.dashang.name + " ：" + weishangqiangContentResult.content + "<span></div></p><p style=\"display:block; width:100%; float:left; margin-top:10px; margin-bottom:0px;\" class=\"text-muted small\">" + weishangqiangContentResult.createTime + "</p></div>");
	    								media.append(profile);
	    								media.append(mediaBody);
	    								blessingBox.append(media);
	    								media.fadeIn(800);
    								}
    								$("body").scrollTop(999999999);
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
   		
   		$(document).keyup(function(){
   			if ($("#content").val().length < 1) {
   				$("#send").attr("disabled", "disabled");
   			} else {
   				$("#send").removeAttr("disabled");
   			}
   		});
   		
   		$("#send").click(function() {
   			if (pause != "1") {
   				return alert("该功能当前不可用！");
   			}
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
   		
   		$('#bapin-buy-model').on('show.bs.modal', function () {
   			/*ownScreenImgUpload = WebUploader.create({
   	  	       auto: true,
   	  	       method : 'POST',
   	  	       server : root + '/file/upload',
   	  	       pick : '#own-screen-img-upload',  
   	  	       accept: {  
   	  	           title : 'Images',  
   	  	           extensions : 'gif,jpg,jpeg,bmp,png',  
   	  	           mimeTypes : 'image/jpg,image/jpeg,image/png'
   	  	       }
   	  	   });
   	  	   
   	   	   
   	  	   ownScreenImgUpload.on('uploadSuccess', function(file, result) {
   			  	if (result.code == 0) {
   	   			$("#own-screen-img").attr("src", result.data.fileUrl);
   	   			$("#own-screen-img").show();
   			  	}
   	  		});*/
   		})
   		
   		$('#bapin-buy-model').on('hidden.bs.modal', function () {
   			$("#bapin-buy-total").text("0");
   			$("#own-screen-img").attr("src", "");
   			$("#own-screen-img").hide();
   			content : $("#own-screen-content").val("");
   			ownScreenSelected = null;
  		});
   		
   		$('#dashang-buy-btn').click(function() {
   			/*alert($('#dashang-tar').val());
   			alert($('#dashang-content').val().length);
   			alert($('input:radio[name="dashang"]:checked').val());
   			return;*/
   			if ($('#dashang-tar').val() == null) {
   				return alert("请选择打赏节目！");
   			}
   			if ($('#dashang-content').val().length < 1) {
   				return alert("请选择打赏评语！");
   			}
   			if (!$('input:radio[name="dashang"]:checked').is(':checked')) {
   				return alert("请选择打赏商品！");
   			}
   			
   			if (pause != "1") {
   				return alert("该功能当前不可用！");
   			}
   			
   			if (wechatUserRole == 1 && wechatUserOwnScreenCount != 0) {
    			$.ajax({
    				url : root + "/customer/weishangqiang/ownScreenUsed",
    				type : "post",
    				cache : false,
    				data : {
    					wechatUserId : wechatUserId,
    					businessId : businessId
    				},
    				dataType : "json",
    				error : function() {
    					pushErrMsg("发送信息失败1！");
    				},
    				success : function(result) {
    					var countNum = parseInt(wechatUserOwnScreenCount);
    					countNum = countNum - 1;
    					wechatUserOwnScreenCount = countNum.toString();
    					if (result.code == 0) {
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
    					} else {
    						
    					}
    				}
    			});
			} else {
   				$.ajax({
   					url : root + "/customer/weishangqiang/createOrder",
   					type : "post",
   					cache : false,
   					data : {
   						wechatUserId : wechatUserId,
   						ownScreenId : $('input:radio[name="dashang"]:checked').val(),
   						businessId : businessId,
   						weishangqiangId : weishangqiangId,
   						goodsType : 1
   					},
   					dataType : "json",
   					error : function() {
   						
   					},
   					success : function(result) {
   						if (result.code == 0) {
   							var params = result.data;
   							orderNo = params.orderNo;
   							wcPay(params.appId, params.timeStamp, params.nonceStr, params.prepay_id, params.paySign, 1);
   						}
   					}
   				});
			}
			$('#dashang-buy-model').modal("hide");
   		});
   		
   		$('#bapin-buy-btn').click(function() {
   			/*alert(typeof(ownScreenSelected));
   			alert($("#own-screen-content").val().length);
   			alert($("#own-screen-img").attr("src").length);
   			return;*/
   			
   			if (typeof(ownScreenSelected) == "undefined") {
   				return alert("请选择霸屏类型！");
   			}
   			if ($("#own-screen-content").val().length < 1) {
   				return alert("请输入霸屏内容！");
   			}
   			if ($("#own-screen-img").attr("src").length < 1) {
   				return alert("请选择霸屏图片！");
   			}
   			
   			if (pause != "1") {
   				return alert("该功能当前不可用！");
   			}
   			if (ownScreenSelected != null) {
   				if (wechatUserRole == 1 && wechatUserOwnScreenCount != 0) {
   	    			$.ajax({
   	    				url : root + "/customer/weishangqiang/ownScreenUsed",
   	    				type : "post",
   	    				cache : false,
   	    				data : {
   	    					wechatUserId : wechatUserId,
   	    					businessId : businessId
   	    				},
   	    				dataType : "json",
   	    				error : function() {
   	    					pushErrMsg("发送信息失败1！");
   	    				},
   	    				success : function(result) {
   	    					var countNum = parseInt(wechatUserOwnScreenCount);
   	    					countNum = countNum - 1;
   	    					wechatUserOwnScreenCount = countNum.toString();
   	    					if (result.code == 0) {
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
   	    						
   	    					}
   	    				}
   	    			});
   				} else {
    				$.ajax({
    					url : root + "/customer/weishangqiang/createOrder",
    					type : "post",
    					cache : false,
    					data : {
    						wechatUserId : wechatUserId,
    						ownScreenId : ownScreenSelected.id,
    						businessId : businessId,
    						weishangqiangId : weishangqiangId,
    						goodsType : 0
    					},
    					dataType : "json",
    					error : function() {
    						
    					},
    					success : function(result) {
    						if (result.code == 0) {
    							var params = result.data;
    							orderNo = params.orderNo;
    							wcPay(params.appId, params.timeStamp, params.nonceStr, params.prepay_id, params.paySign, 0);
    						}
    					}
    				});
   				}
   			}
   		});
});