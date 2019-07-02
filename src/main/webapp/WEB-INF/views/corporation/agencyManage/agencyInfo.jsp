<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link href="<%=request.getContextPath()%>/resource/css/bootstrap.css"
	rel="stylesheet">
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
<script>
	var root = "<%=request.getContextPath()%>";

	function openUpdateModal(id,name,addrress,tel,bank,bankPossessor,bankAccount,ratio,notes) {
		$("#id").val(id);
		$("#name").val(name);
		$("#addrress").val(addrress);
		$("#tel").val(tel);
		$("#bank").val(bank);
		$("#bankPossessor").val(bankPossessor);
		$("#bankAccount").val(bankAccount);
		$("#ratio").val(ratio);
		$("#notes").val(notes);
		
		$("#update-info-modal").modal("show");
		$(".modal-backdrop").remove();
	}

	function openAddModal() {
		$("#a-id").val("");
		$("#a-name").val("");
		$("#a-addrress").val("");
		$("#a-tel").val("");
		$("#a-bank").val("");
		$("#a-bankPossessor").val("");
		$("#a-bankAccount").val("");
		$("#a-ratio").val("");
		$("#a-notes").val("");
		
		$("#add-info-modal").modal("show");
		$(".modal-backdrop").remove();
	}

	function openCashOutModal(toId) {
		$("#toId").val(toId);
		$("#amount").val("");
		
		$("#cash-out-modal").modal("show");
		$(".modal-backdrop").remove();
	}

	function openBindModal(bindId) {
		$("#bindId").val(bindId);
		$("#businessId").val("");
		
		$.ajax({
			url : root + "/corporation/agencyManage/agencyInfo/businessList",
			type : "post",
			data : {
				
			},
			dataType : "json",
			error : function() {
				alert("error");
			},
			success : function(result) {
				if (result.code == 0) {
					var businessList = result.data.businessList;
					$.each(businessList, function(i, business) {
						$("#businessId").append($("<option value=\"" + business.id + "\">" + business.name + "</option>"));
					});
				} else {
					alert(result.message);
				}
			}
		});
		
		$("#bind-modal").modal("show");
		$(".modal-backdrop").remove();
	}

	function check() {
		if ($("#agencyName").val().length < 1) {

		}
	}

	function update() {
		if ($("#id").val().length < 1) {
			return alert("代理商ID不能为空");
		}
		if ($("#name").val().length < 1) {
			return alert("代理商名称不能为空");
		}
		if ($("#addrress").val().length < 1) {
			return alert("代理商地址不能为空");
		}
		if ($("#tel").val().length < 1) {
			return alert("代理商电话不能为空");
		}
		if ($("#bank").val().length < 1) {
			return alert("代理商开户行不能为空");
		}
		if ($("#bankPossessor").val().length < 1) {
			return alert("银行持卡人不能为空");
		}
		if ($("#bankAccount").val().length < 1) {
			return alert("代理商银行卡号不能为空");
		}
		if ($("#ratio").val().length < 1) {
			return alert("代理商收益比例不能为空");
		}
		
		$("#info-modal").modal("hide");
		$.ajax({
			url : root + "/corporation/agencyManage/agencyInfo/update",
			type : "post",
			data : {
				id: $("#id").val(),
				name: $("#name").val(),
				addrress: $("#addrress").val(),
				tel: $("#tel").val(),
				bank: $("#bank").val(),
				bankPossessor: $("#bankPossessor").val(),
				bankAccount: $("#bankAccount").val(),
				ratio: $("#ratio").val(),
				notes: $("#notes").val()
			},
			dataType : "json",
			error : function() {
				alert("error");
			},
			success : function(result) {
				if (result.code == 0) {
					location.reload();
				} else {
					alert(result.message);
				}
			}
		});
	}

	function add() {
		if ($("#a-name").val().length < 1) {
			return alert("代理商名称不能为空");
		}
		if ($("#a-addrress").val().length < 1) {
			return alert("代理商地址不能为空");
		}
		if ($("#a-tel").val().length < 1) {
			return alert("代理商电话不能为空");
		}
		if ($("#a-bank").val().length < 1) {
			return alert("代理商开户行不能为空");
		}
		if ($("#a-bankPossessor").val().length < 1) {
			return alert("银行持卡人不能为空");
		}
		if ($("#a-bankAccount").val().length < 1) {
			return alert("代理商银行卡号不能为空");
		}
		if ($("#a-mobile").val().length < 1) {
			return alert("代理商手机号不能为空，该注册手机号将用于代理后台登录！");
		}
		if ($("#a-ratio").val().length < 1) {
			return alert("代理商收益比例不能为空");
		}
		
		
		$("#info-modal").modal("hide");
		$.ajax({
			url : root + "/corporation/agencyManage/agencyInfo/add",
			type : "post",
			data : {
				id: $("#a-id").val(),
				name: $("#a-name").val(),
				addrress: $("#a-addrress").val(),
				tel: $("#a-tel").val(),
				bank: $("#a-bank").val(),
				bankPossessor: $("#a-bankPossessor").val(),
				bankAccount: $("#a-bankAccount").val(),
				ratio: $("#a-ratio").val(),
				mobile: $("#a-mobile").val(),
				notes: $("#a-notes").val()
			},
			dataType : "json",
			error : function() {
				alert("error");
			},
			success : function(result) {
				if (result.code == 0) {
					location.reload();
				} else {
					alert(result.message);
				}
			}
		});
	}

	function cashOut() {
		$("#cash-out-modal").modal("hide");
		$.ajax({
			url : root + "/corporation/agencyManage/agencyInfo/cashOut",
			type : "post",
			data : {
				id: $("#toId").val(),
				amount: $("#amount").val(),
			},
			dataType : "json",
			error : function() {
				alert("error");
			},
			success : function(result) {
				if (result.code == 0) {
					location.reload();
				} else {
					alert(result.message);
				}
			}
		});
	}

	function bind() {
		$("#bind-modal").modal("hide");
		$.ajax({
			url : root + "/corporation/agencyManage/agencyInfo/bind",
			type : "post",
			data : {
				bindId: $("#bindId").val(),
				businessId: $("#businessId").val(),
			},
			dataType : "json",
			error : function() {
				alert("error");
			},
			success : function(result) {
				if (result.code == 0) {
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
	<h4>代理商管理&nbsp;>&nbsp;代理商信息</h4>
	<hr>
	<div class="container-fluid">

		<div class="row">
			<div class="col-xs-1">
				<a class="btn btn-success" href="javascript:openAddModal();">代理添加</a>
			</div>
			<div class="col-xs-offset-8 col-xs-3">
				<form role="form" action="<%=request.getContextPath()%>/corporation/agencyManage/agencyInfo" method="get" onsubmit="return check()">
					<div class="form-group input-group">
						<input id="agencyName" name="agencyName" class="form-control pull-right" type="text" placeholder="请输入代理商名称"> 
						<span class="input-group-btn"><button class="btn btn-success" type="submit" onclick="searchCheck()">搜索</button></span>
					</div>
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-12">
				<table class="table table-bordered table-hover">
					<tr>
						<th>代理商ID</th>
						<th>代理商名称</th>
						<th>代理商地址</th>
						<th>代理商电话</th>
						<th>银行类型</th>
						<th>银行户主</th>
						<th>银行卡号</th>
						<th>余额（￥）</th>
						<th>分成比例（%）</th>
						<th>创建时间</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${agencyList}" var="agency" varStatus="status">
						<tr>
							<td>${agency.id}</td>
							<td>${agency.name}</td>
							<td>${agency.addrress}</td>
							<td>${agency.tel}</td>
							<td>${agency.bank}</td>
							<td>${agency.bankPossessor}</td>
							<td>${agency.bankAccount}</td>
							<td>${agency.balance}</td>
							<td>${agency.ratio}</td>
							<td><fmt:formatDate type="both" value="${agency.createTime}" /></td>
							<td>${agency.notes}</td>
							<td>
								<a class="text-danger" href="javascript:openUpdateModal('${agency.id}','${agency.name}','${agency.addrress}','${agency.tel}','${agency.bank}','${agency.bankPossessor}','${agency.bankAccount}','${agency.ratio}','${agency.notes}');">修改</a>
								&nbsp;
								<a class="text-warning" href="javascript:openCashOutModal('${agency.id}');">打款</a>
								&nbsp;
								<a class="text-primary" href="javascript:openBindModal('${agency.id}');">绑定</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

	</div>

	<div class="modal" id="update-info-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="#" method="post">
						<input id="id" name="id" type="hidden" class="form-control">
						<div class="form-group">
							<input id="name" name="name" type="text" class="form-control" placeholder="请输入代理商名称">
						</div>
						<div class="form-group">
							<input id="addrress" name="addrress" type="text" class="form-control" placeholder="请输入代理商地址">
						</div>
						<div class="form-group">
							<input id="tel" name="tel" type="text" class="form-control" placeholder="请输入代理商电话">
						</div>
						<div class="form-group">
							<input id="bank" name="bank" type="text" class="form-control" placeholder="请输入代理商开户行">
						</div>
						<div class="form-group">
							<input id="bankPossessor" name="bankPossessor" type="text" class="form-control" placeholder="请输入代理商开户人姓名">
						</div>
						<div class="form-group">
							<input id="bankAccount" name="bankAccount" type="text" class="form-control" placeholder="请输入代理商银行卡号">
						</div>
						<div class="form-group">
							<input id="ratio" name="ratio" type="text" class="form-control" placeholder="请输入代理商收益比率（50 = 50%）">
						</div>
						<div class="form-group">
							<input id="notes" name="notes" type="text" class="form-control" placeholder="请输入代理商备注">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success btn-sm" onclick="update()">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="add-info-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="#" method="post">
						<div class="form-group">
							<input id="a-name" name="name" type="text" class="form-control" placeholder="请输入代理商名称">
						</div>
						<div class="form-group">
							<input id="a-addrress" name="addrress" type="text" class="form-control" placeholder="请输入代理商地址">
						</div>
						<div class="form-group">
							<input id="a-tel" name="tel" type="text" class="form-control" placeholder="请输入代理商电话">
						</div>
						<div class="form-group">
							<input id="a-bank" name="bank" type="text" class="form-control" placeholder="请输入代理商开户行">
						</div>
						<div class="form-group">
							<input id="a-bankPossessor" name="bankPossessor" type="text" class="form-control" placeholder="请输入代理商开户人姓名">
						</div>
						<div class="form-group">
							<input id="a-bankAccount" name="bankAccount" type="text" class="form-control" placeholder="请输入代理商银行卡号">
						</div>
						<div class="form-group">
							<input id="a-ratio" name="ratio" type="text" class="form-control" placeholder="请输入代理商收益比率（50 = 50%）">
						</div>
						<div class="form-group">
							<input id="a-mobile" name="mobile" type="text" class="form-control" placeholder="请输入代理商手机号（用于后台登录，默认密码为123456）">
						</div>
						<div class="form-group">
							<input id="a-notes" name="notes" type="text" class="form-control" placeholder="请输入代理商备注">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success btn-sm" onclick="add()">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="cash-out-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">打款</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="#" method="post">
						<input id="toId" name="id" type="hidden" class="form-control">
						<div class="form-group">
							<label for="amount">打款金额</label>
							<input id="amount" name="amount" type="text" class="form-control" placeholder="请输入打款金额">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success btn-sm" onclick="cashOut()">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="bind-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">绑定</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="#" method="post">
						<input id="bindId" name="bindId" type="hidden" class="form-control">
						<div class="form-group">
							<label for="amount">商家列表</label>
							<select id="businessId" name="businessId" class="form-control">
							</select>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success btn-sm" onclick="bind()">确定</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
