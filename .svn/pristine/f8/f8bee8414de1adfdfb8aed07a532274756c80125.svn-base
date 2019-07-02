<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
<style>
.table tr th {
	text-align: center;
	background-color: #eee;
}

.table tr td {
	text-align: center;
}
</style>
<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/resource/js/echarts-all.js"></script>
<script>
	var root = "<%=request.getContextPath()%>";

	function openOwnScreenModifyModal(ownScreenId, ownScreenName, ownScreenDuration, ownScreenPrice) {
		$("#ownScreenId").val(ownScreenId);
		$("#ownScreenName").val(ownScreenName);
		$("#ownScreenDuration").val(ownScreenDuration);
		$("#ownScreenPrice").val(ownScreenPrice);
		
		$("#own-screen-modify-modal").modal("show");
		$(".modal-backdrop").remove();
	}

	function openDashangModifyModal(dashangId, dashangName, dashangImg, dashangDuration, dashangPrice) {
		$("#dashangId").val(dashangId);
		$("#dashangName").val(dashangName);
		$("#dashangImg").attr("src", root + dashangImg);
		$("#dashangDuration").val(dashangDuration);
		$("#dashangPrice").val(dashangPrice);
		
		$("#dashang-modify-modal").modal("show");
		$(".modal-backdrop").remove();
	}

	function ownScreenModify() {
		if ($("#ownScreenPrice").val().length < 1) {
			return alert("霸屏价格不能为空！");
		}
		
		$("#own-screen-modify-modal").modal("hide");
		$.ajax({
			url : root + "/corporation/functionManage/weishangqiangInfo/ownScreenModify",
			type : "post",
			data : {
				id : $("#ownScreenId").val(),
				name : $("#ownScreenName").val(),
				duration : $("#ownScreenDuration").val(),
				price : $("#ownScreenPrice").val()
			},
			dataType : "json",
			error : function() {
				alert("error");
			},
			success : function(result) {
				if (result.code == 0) {
					alert("修改成功！");
					location.reload();
				} else {
					alert(result.message);
				}
			}
		});
	}

	function dashangModify() {
		if ($("#dashangPrice").val().length < 1) {
			return alert("打赏价格不能为空！");
		}
		
		$("#dashang-modify-modal").modal("hide");
		$.ajax({
			url : root + "/corporation/functionManage/weishangqiangInfo/dashangModify",
			type : "post",
			data : {
				id : $("#dashangId").val(),
				name : $("#ownScreenName").val(),
				// img : $("#dashangImg").attr("src"),
				duration : $("#dashangDuration").val(),
				price : $("#dashangPrice").val()
			},
			dataType : "json",
			error : function() {
				alert("error");
			},
			success : function(result) {
				if (result.code == 0) {
					alert("修改成功！");
					location.reload();
				} else {
					alert(result.message);
				}
			}
		});
	}
</script>
</head>

<body style="padding: 15px; overflow: auto;">
	<h4>功能设置&nbsp;>&nbsp;微上墙</h4>
	<hr>
	<div class="container-fluid">

		<ul class="nav nav-tabs" style="margin-bottom: 20px;">
			<li class="active"><a data-toggle="tab" href="#own-screen-price-tab">霸屏价格</a></li>
			<li><a data-toggle="tab" href="#dashang-price-tab">打赏价格</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="own-screen-price-tab">
				<table class="table table-bordered table-hover">
					<tr>
						<th>霸屏编号</th>
						<th>霸屏名称</th>
						<th>霸屏时间（秒）</th>
						<th>价格（￥）</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${ownScreenList}" var="ownScreen" varStatus="status">
						<tr>
							<td>${ownScreen.id}</td>
							<td>${ownScreen.name}</td>
							<td>${ownScreen.duration}</td>
							<td>${ownScreen.price}</td>
							<td>
								<a href="javascript:openOwnScreenModifyModal('${ownScreen.id}','${ownScreen.name}','${ownScreen.duration}','${ownScreen.price}')" style="width:16px; height:16px; display:inline-block; background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -59px -88px;"></a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="tab-pane fade" id="dashang-price-tab">
				<table class="table table-bordered table-hover">
					<tr>
						<th>打赏编号</th>
						<th>打赏名称</th>
						<th>打赏图片</th>
						<th>打赏时间（秒）</th>
						<th>价格（￥）</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${dashangList}" var="dashang" varStatus="status">
						<tr>
							<td>${dashang.id}</td>
							<td>${dashang.name}</td>
							<td><img width="20" height="auto" src="<%=request.getContextPath()%>${dashang.img}"></td>
							<td>${dashang.duration}</td>
							<td>${dashang.price}</td>
							<td>
								<a href="javascript:openDashangModifyModal('${dashang.id}','${dashang.name}','${dashang.img}','${dashang.duration}','${dashang.price}')" style="width:16px; height:16px; display:inline-block; background:url(<%=request.getContextPath()%>/resource/img/icon_admin_all.png) -59px -88px;"></a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	<div class="modal" id="own-screen-modify-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">霸屏修改</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="#" method="post">
						<input id="ownScreenId" type="hidden" class="form-control">
						<div class="form-group">
							<label for="ownScreenName">霸屏名称</label>
							<input id="ownScreenName" type="text" class="form-control" placeholder="请输霸屏名称">
						</div>
						<div class="form-group">
							<label for="ownScreenDuration">霸屏时间</label>
							<input id="ownScreenDuration" type="text" class="form-control" placeholder="请输霸屏时间">
						</div>
						<div class="form-group">
							<label for="ownScreenPrice">霸屏价格</label>
							<input id="ownScreenPrice" type="text" class="form-control" placeholder="请输霸屏价格">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success btn-sm" onclick="ownScreenModify()">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="dashang-modify-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">打赏修改</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="#" method="post">
						<input id="dashangId" type="hidden" class="form-control">
						<div class="form-group">
							<label for="dashangName">打赏名称</label>
							<input id="dashangName" type="text" class="form-control" placeholder="请打赏屏名称" disabled>
						</div>
						<div class="form-group">
							<label for="dashangImg">打赏图片</label>
							<br>
							<img id="dashangImg" width="35" height="auto" src="#">
						</div>
						<div class="form-group">
							<label for="dashangDuration">打赏时间</label>
							<input id="dashangDuration" type="text" class="form-control" placeholder="请输打赏时间" disabled>
						</div>
						<div class="form-group">
							<label for="dashangPrice">打赏价格</label>
							<input id="dashangPrice" type="text" class="form-control" placeholder="请输打赏价格">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success btn-sm" onclick="dashangModify()">确定</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
