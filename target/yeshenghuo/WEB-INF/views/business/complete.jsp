<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>酒吧信息完善</title>
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
			        if (result.code ==0) {
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
			  
			  
	  })
	</script>    
  </head>
    
  <body style="padding:20px; background-color:#eee;">
    <div class="nav">
      <div class="navbar-header">
        <a class="navbar-brand" style="padding:0px;"><img src="<%=request.getContextPath()%>/resource/img/index_logo.png"></a>
      </div>
    </div>
    
    <form role="form" method="post" action="<%=request.getContextPath()%>/business/complete" style="width:372px; height:300px; position:absolute; top:50%; left:50%; margin-top:-230px; margin-left:-186px;">
      <div class="form-group" style="text-align:center; padding-bottom:10px;">
        <h4>完善酒吧信息</h4>
      </div>
      <div class="form-group">
        <label for="mobile">酒吧名称</label>
        <input style="border-radius:3px;" class="form-control" id="name" name="name" type="tel" placeholder="请输入酒吧名称">
      </div>
      <label for="mobile">酒吧地址</label>
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
      <div class="form-group">
        <button style="border-radius:3px;" type="submit" class="btn btn-success btn-block">完善</button>
      </div>
    </form>
  </body>
</html>
