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
	<script src="<%=request.getContextPath()%>/resource/js/business/manage.js"></script>
	<script>
	  var root = "<%=request.getContextPath()%>";
	  
	  $(document).ready(function() {	  
		  /************ 初始化 省份 下拉列表 ************/
		  $.ajax({
		    url : root + "/address/province",
		    type : "post",
		    cache : false,
		    dataType : "json",
		    error : function() {
		      alert("省份数据获取失败！");
		    },
		    success : function(result) {
		      var option = "";
		      if (result.code == 0) {
		        $.each(result.data.provinceList, function(i, province) {
		          option = "<option value=" + province.code + ">" + province.name + "</option>";
		          $("#province").append(option);
		        });
		      } else {
		        alert("省份数据获取失败！");
		      }
		    }
		  });
		  
		  /************ 初始化 城市 下拉列表 (根据省份) ************/
		  $("#province").change(function() {
		    $("#city").text("<option value=\"\" disabled selected>城市</option>");
		    var provinceCode = $("#province").val();
		    $.ajax({
		      url : root + "/address/city?provinceCode=" + provinceCode,
		      type : "get",
		      cache : false,
		      dataType : "json",
		      error : function() {
		        alert("地市市数据获取失败！");
		      },
		      success : function(result) {
		        var option = "";
		        if (result.code == 0) {
		          $.each(result.data.cityList, function(i, city) {
		            option = "<option value=" + city.code + ">" + city.name + "</option>";
		        	$("#city").append(option);
		          });
		          $("#city").trigger("change");
		        } else {
		          alert("地市市数据获取失败！");
		        }
		      }
		    });
		  });
		  
		  /************ 初始化 区/县 下拉列表 (根据城市) ************/
		  $("#city").change(function() {
		    $("#district").text("<option value=\"\" disabled selected>区/县</option>");
		    var cityCode = $("#city").val();
		    
		    $.ajax({
		      url : root + "/address/district?cityCode=" + cityCode,
		      type : "get",
		      cache : false,
		      dataType : "json",
		      error : function() {
		        alert("区县数据获取失败！");
		      },
		      success : function(result) {
		        if (result.code == 0) {
		          var option = "";
		          $.each(result.data.districtList, function(i, district) {
		            option = "<option value=" + district.code + ">" + district.name + "</option>";
		            $("#district").append(option);
		          });
		        } else {
		          alert("区县数据获取失败！");
		        }
		      }
		    });
		  });
		  
		  $("#logo-upload").uploadify({
			  'uploader'       : root + '/file/upload',
			  'swf'			 : root + '/resource/js/uploadify.swf',
			  'queueID'        : 'fileQueue',
			  'auto'           : true,
			  'multi'          : true,
			  'buttonCursor'   : 'hand',
			  'fileObjName'    : 'file',
			  'buttonText'     : '上传',
			  'height'         : '25',
			  'width'          : '30',
			  'progressData'   : 'percentage',
			  'fileTypeDesc'   : '支持格式:jpg/gif/jpeg/png/bmp.',
			  'fileTypeExts'	 : '*.jpg;*.gif;*.jpeg;*.png;*.bmp',
			  onUploadSuccess  : function(file, result_s, response) {
				  if (response == true) {
					  var result = JSON.parse(result_s);
					  	if (result.code == 0) {
					  		  var logo = result.data.fileUrl;
							  $.ajax({
								  url : root + "/business/accountManage/accountInfo/setLogo",
								  type : "post",
								  cache : false,
								  data : {
									  logo : logo
								  },
								  dataType : "json",
								  error : function() {
								  	alert("网络出错！");
								  },
								  success : function(result) {
									  if (result.code == 0) {
										  $("#logo").attr("src", logo);
									  } else {
										  alert("网络出错！");
									  }
								  }
							  });
					  		  
					  	}
					  }
				  }
			  });
		  
		  $("#name-edit-confirm").click(function() {
			  $.ajax({
				  url : root + "/business/accountManage/accountInfo/setName",
				  type : "post",
				  cache : false,
				  data : {
					  name : $("#name-edit").val()
				  },
				  dataType : "json",
				  error : function() {
				  	alert("网络出错！");
				  },
				  success : function(result) {
					  if (result.code == 0) {
						  $("#name").text($("#name-edit").val());
						  $("#business-name-set").modal("hide");
					  } else {
						  alert("网络出错！");
					  }
				  }
			  });
		  });
		  $("#tel-edit-confirm").click(function() {
			  $.ajax({
				  url : root + "/business/accountManage/accountInfo/setTel",
				  type : "post",
				  cache : false,
				  data : {
					  tel : $("#tel-edit").val()
				  },
				  dataType : "json",
				  error : function() {
				  	alert("网络出错！");
				  },
				  success : function(result) {
					  if (result.code == 0) {
						  $("#tel").text($("#tel-edit").val());
						  $("#business-tel-set").modal("hide");
					  } else {
						  alert("网络出错！");
					  }
				  }
			  });
		  });
		  $("#address-edit-confirm").click(function() {
			  $.ajax({
				  url : root + "/business/accountManage/accountInfo/setAddress",
				  type : "post",
				  cache : false,
				  data : {
					  provinceCode : $("#province").val(),
					  cityCode : $("#city").val(),
					  districtCode : $("#district").val()
				  },
				  dataType : "json",
				  error : function() {
					  alert("网络出错！");
				  },
				  success : function(result) {
					  if (result.code == 0) {
						  var province = $("#province").find("option:selected").text();
						  var city = $("#city").find("option:selected").text();
						  var district = $("#district").find("option:selected").text();
						  $("#address").text(province + city + district);
						  $("#business-address-set").modal("hide");
					  } else {
						  alert("网络出错！");
					  }
				  }
			  });
		  });
		  $("#summary-edit-confirm").click(function() {
			  $.ajax({
				  url : root + "/business/accountManage/accountInfo/setSummary",
				  type : "post",
				  cache : false,
				  data : {
					  summary : $("#summary-edit").val()
				  },
				  dataType : "json",
				  error : function() {
				  	alert("网络出错！");
				  },
				  success : function(result) {
					  if (result.code == 0) {
						  $("#summary").text($("#summary-edit").val());
						  $("#business-summary-set").modal("hide");
					  } else {
						  alert("网络出错！");
					  }
				  }
			  });
		  });
	  })
	</script>
  </head>
    
  <body style="padding:15px; overflow:auto;">
    <h4>账号管理&nbsp;>&nbsp;账号资料</h4>
    <div class="" id="function-set" style="padding:15px;">
      <style>
        .list-group { border:0px; }
        .list-group-item { border-left:0px; border-right:0px; padding:20px 0px; }
        .list-group-item:first-child { border-top:0px; }
        .list-group-item:last-child { border-bottom:0px; }
      </style>
      <ul class="list-group" style="margin-top:15px;">
        <li class="list-group-item">
          <span class="list-group-item-heading text-muted">商家logo&nbsp;&nbsp;<span class="text-danger">请上传大于150px*150px的jpg图片，png透明logo尺寸必须150px*150px</span></span>
          <div class="pull-right"><input style="display:inline-block;" type="file" id="logo-upload"></div>
          <br>
          <div style="margin-top:10px; width:120px; height:120px; overflow:hidden;">
 	         <img id="logo" style="width:120px; height:auto;" src="${currentBusiness.logo}">
 	      </div>
        </li>
        <li class="list-group-item">
          <span class="list-group-item-heading text-muted">公众号二维码</span>
          <!-- <a class="pull-right" href="javascript:;">上传</a> -->
          <br>
          <div style="margin-top:10px; width:120px; height:120px; overflow:hidden;">
         	 <img id="qrcode" style="margin-top:10px; width:120px; height:auto;" src="${currentBusiness.qrcode}">
 	      </div>
        </li>
        <li class="list-group-item">
          <span class="list-group-item-heading text-muted">商家名称&nbsp;&nbsp;<span id="name" class="text-info">${currentBusiness.name}</span></span>
          <a class="pull-right" href="javascript:$('#business-name-set').modal('show');$('.modal-backdrop').remove();">编辑</a>
        </li>
        <li class="list-group-item">
          <span class="list-group-item-heading text-muted">手机账号&nbsp;&nbsp;<span id="mobile" class="text-info">${currentUser.mobile}</span>&nbsp;&nbsp;<span class="text-danger">手机号暂不支持修改</span></span>
        </li>
        <li class="list-group-item">
          <span class="list-group-item-heading text-muted">商家电话&nbsp;&nbsp;<span id="tel" class="text-info">${currentBusiness.tel}</span></span>
          <a class="pull-right" href="javascript:$('#business-tel-set').modal('show');$('.modal-backdrop').remove();">编辑</a>
        </li>
        <li class="list-group-item">
          <span class="list-group-item-heading text-muted">商家地址&nbsp;&nbsp;<span id="address" class="text-info">${currentBusiness.addrress}</span></span>
          <a class="pull-right" href="javascript:$('#business-address-set').modal('show');$('.modal-backdrop').remove();">编辑</a>
        </li>
        <li class="list-group-item">
          <span class="list-group-item-heading text-muted">商家介绍&nbsp;&nbsp;</span>
          <a class="pull-right" href="javascript:$('#business-summary-set').modal('show');$('.modal-backdrop').remove();">编辑</a>
          <br>
          <span id="summary">${currentBusiness.summary}</span>
        </li>
      </ul>
    </div>
    
    <!-- 商家名称编辑 -->
    <div class="modal" id="business-name-set" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">设置商家名称</h4>
          </div>
          <div class="modal-body">
            <form role="form">
              <div class="form-group">
                <label>请设置商家名称</label>
                <input id="name-edit" class="form-control" type="text" value="${currentBusiness.name}">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-success btn-sm" id="name-edit-confirm">确定</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 商家电话编辑 -->
    <div class="modal" id="business-tel-set" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">商家电话</h4>
          </div>
          <div class="modal-body">
            <form role="form">
              <div class="form-group">
                <label>请设置商家电话</label>
                <input id="tel-edit" class="form-control" type="text" value="${currentBusiness.tel}">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-success btn-sm" id="tel-edit-confirm">确定</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 商家地址编辑 -->
    <div class="modal" id="business-address-set" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">商家地址</h4>
          </div>
          <div class="modal-body">
            <form role="form">
              <div class="form-group">
                <label>请设置商家地址</label>
                <div class="form-group">
                  <select id="province" name="provinceCode" class="form-control" required>
                    <option value="" disabled selected>省份</option>
                  </select>
                </div>
                <div class="form-group">
                  <select id="city" name="cityCode" class="form-control" required>
                    <option value="" disabled selected>城市</option>
                  </select>
                </div>
                <div class="form-group">
                  <select id="district" name="districtCode" class="form-control" required>
                    <option value="" disabled selected>区/县</option>
                  </select>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-success btn-sm" id="address-edit-confirm">确定</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 商家介绍编辑 -->
    <div class="modal" id="business-summary-set" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">设置商家介绍</h4>
          </div>
          <div class="modal-body">
            <form role="form">
              <div class="form-group">
                <label>请设置商家简介</label>
                <input id="summary-edit" class="form-control" type="text" value="${currentBusiness.summary}">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-success btn-sm" id="summary-edit-confirm">确定</button>
          </div>
        </div>
      </div>
    </div>
    
  </body>
</html>
