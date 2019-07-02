$(document).ready(function() {
	/******** 初始化 body 标签变量 ********/
	var body = $("body");
	
	
	
	/******** 初始化 modal ********/
	var modal = $("<div class=\"modal fade\" id=\"modal\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\"></div>");
	var modalDialog = $("<div class=\"modal-dialog\"></div>");
	var modalContent = $("<div class=\"modal-content\"></div>");
	var modalHeader = $("<div class=\"modal-header\"></div>");
	var modalHeaderButtonClose = $("<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>");
	var modalHeaderTittle = $("<h4 id=\"modalTittle\">&nbsp;</h4>");
	var modalBody = $("<div class=\"modal-body\"></div>");
	var modalBodyMsg = $("<p id=\"modalMsg\">&nbsp;</p>");
	var modalFooter = $("<div class=\"modal-footer\"></div>");
	var modalFooterButtonSubmit = $("<button type=\"button\" id=\"modelSubmit\" class=\"btn btn-primary\">确定</button>");
	var modalFooterButtonClose = $("<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button>");
	
	modal.append(modalDialog);	
	modalDialog.append(modalContent);	
	modalContent.append(modalHeader);
	modalContent.append(modalBody);
	modalContent.append(modalFooter);	
	modalHeader.append(modalHeaderButtonClose);
	modalHeader.append(modalHeaderTittle);	
	modalBody.append(modalBodyMsg);	
	modalFooter.append(modalFooterButtonSubmit);
	modalFooter.append(modalFooterButtonClose);
	
	body.append(modal);
	
	
	
	/******** 初始化 errBar ********/
	var errBar = $("<div id=\"errBar\" class=\"alert alert-danger alert-dismissable\">");
	var errBarBtnClose = $("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>");
	var errBarMsg = $("<p id=\"errMsg\">&nbsp;</p>");
	
	<!--errBar.append(errBarBtnClose);-->
	errBar.append(errBarMsg);
	errBar.hide();
	
	body.append(errBar);
	
	
	
	/******** 初始化 sucBar ********/
	var sucBar = $("<div id=\"sucBar\" class=\"alert alert-success alert-dismissable\">");
	var sucBarBtnClose = $("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>");
	var sucBarMsg = $("<p id=\"sucMsg\">&nbsp;</p>");
	
	<!--sucBar.append(sucBarBtnClose);-->
	sucBar.append(sucBarMsg);
	sucBar.hide();
	
	body.append(sucBar);
	
	
	
	/******** 初始化 warBar ********/
	var warBar = $("<div id=\"warBar\" class=\"alert alert-warning alert-dismissable\">");
	var warBarBtnClose = $("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>");
	var warBarMsg = $("<p id=\"warMsg\">&nbsp;</p>");
	
	<!--warBar.append(warBarBtnClose);-->
	warBar.append(warBarMsg);
	warBar.hide();
	
	body.append(warBar);
	
	
	
	/******** 初始化 errBar、sucBar、warBar显示方式 ********/
	$(".alert").css("position", "fixed");
	$(".alert").css("bottom", "2%");
	$(".alert").css("right", "2%");
	$(".alert").css("min-width", "200px");
	$(".alert").css("max-width", "500px");
	$(".alert").css("width", "25%");
	
	
})

/******** modal调用方法 ********/
function pushModal(modalTittle, modalMsg, modalFun) {
	if (modalTittle != null && modalTittle != "") {
		$("#modalTittle").text(modalTittle);
	} else {
		return;
	}
	if (modalMsg != null && modalMsg != "") {
		$("#modalMsg").text(modalMsg);
	} else {
		return;
	}
	if (modalFun != null && modalFun != "") {
		$("#modelSubmit").attr("onClick", modalFun);
		$("#modelSubmit").show();
	} else {
		$("#modelSubmit").hide();
	}
	$("#modal").modal("show");
}

/******** errBar调用方法 ********/
function pushErrMsg(errMsg) {
	if (errMsg != null && errMsg != "") {
		$("#errMsg").text("提示：" + errMsg);
	} else {
		return;
	}
	$("#errBar").fadeIn("slow")
	setTimeout(function() {
		$("#errBar").fadeOut("slow");
	}, 3000);
}

/******** sucBar调用方法 ********/
function pushSucMsg(sucMsg) {
	if (sucMsg != null && sucMsg != "") {
		$("#sucMsg").text("提示：" + sucMsg);
	} else {
		return;
	}
	$("#sucBar").fadeIn("slow")
	setTimeout(function() {
		$("#sucBar").fadeOut("slow");
	}, 3000);
}

/******** warBar调用方法 ********/
function pushWarMsg(warMsg) {
	if (warMsg != null && warMsg != "") {
		$("#warMsg").text("提示：" + warMsg);
	} else {
		return;
	}
	$("#warBar").fadeIn("slow")
	setTimeout(function() {
		$("#warBar").fadeOut("slow");
	}, 3000);
}