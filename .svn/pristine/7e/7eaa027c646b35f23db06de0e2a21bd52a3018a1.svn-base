<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>微上墙后台管理</title>
    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
    
	<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
	<script>
	  var root = "<%=request.getContextPath()%>"
	  var basePath = "<%=request.getScheme()%>"+"://"+"<%=request.getServerName()%>"+":"+<%=request.getServerPort()%>+root;
	  $(document).ready(function () {
		  selectUser();
	  });
	  function selectUser() {
		  var name = $('#selectName').val();
		  $.ajax({
				url : root + "/business/customerManage/wechatManage/getWechatUserList",
				type : "get",
				cache : false,
				data: {
					name : name
				},
				dataType : "json",
				error : function() {
					alert("网络出错！");
				},
				success : function(result) {
					var str = '';
					var man = 0;
					var woman = 0;
					for(var i = 0; i < result.length; i++) {
						var sexStr = '';
						if (result[i].sex === 1) {
							sexStr = '男';
							man ++;
						} else if (result[i].sex === 2) {
							sexStr = '女';
							woman ++;
						} else {
							sexStr = '不明';
						}
						var role = '';
						var ownScreenCount = '';
						if (result[i].role === '0') {
							role = '普通用户';
						} else if (result[i].role === '1') {
							role = '管理员';
							if (result[i].ownScreenCount !== 0){
								ownScreenCount = result[i].ownScreenCount;
							} else {
								ownScreenCount = 15;
							}
						} else if (result[i].role === '2') {
							role = '黑名单';
						}
						str += '<tr><td><img src="' + result[i].profile + '" width="35" height="35"></td><td>' + result[i].nickname + '</td><td>' + result[i].openId + '</td><td>' + sexStr + '</td><td>' + result[i].address + '</td><td>' + role + '</td><td>' + ownScreenCount + '</td><td>' + result[i].notes + '</td><td><a href="javascript:openModel(' + result[i].id + ',\'' + result[i].notes + '\',' + result[i].role + ',' + result[i].ownScreenCount +')">操作</a></td></tr>';
					}
					$('#userList').html(str);
					$('#totalNum').html(result.length);
					$('#totalMan').html(man);
					$('#totalWoman').html(woman);
				}
			});
	  }
	  function openModel(id, notes, role, times) {
		  $('#wechatId').val(id);
		  $('#wechatNotes').val(notes);
		  $('#selectRole').val(role);
		  if (role !== 1) {
			  $('#ownScreen').css('display', 'none');
		  } else {
			  $('#times').val(times);
		  }
		  $('#function-notes-set').modal('show');
	  }
	  function setNotes() {
		  var notes = $('#wechatNotes').val();
		  var id = $('#wechatId').val();
		  var map = {'id': id, 'notes': notes};
		  var role = $('#selectRole').val();
		  var times = $('#times').val();
		  $.ajax({
			url : root + "/business/customerManage/wechatManage/updateNotes",
			type : "get",
			cache : false,
			data: {
				id: id,
				notes: notes,
				role: role,
				times: times
			},
			dataType : "json",
			error : function() {
				alert("网络出错！");
			},
			success : function(result) {
				$('#function-notes-set').modal('hide');
				selectUser();
				alert("修改成功");
			}
		});
	  }
	  function showOwnScreen(value) {
		  if (value !== '1') {
			  $('#ownScreen').css('display', 'none');
			  $('#times').val(0);
		  } else {
			  $('#ownScreen').css('display', 'block');
			  $('#times').val(15);
		  }
	  }
	</script>
  </head>
    
  <body style="padding:15px; overflow:auto;">
    <h4>微信公众号&nbsp;>&nbsp;用户</h4>
    <hr>
    <div class="tab-pane" style="padding: 0px 20px 10px;">
	    <div style="float: left; font-size: 17px;">
	    	</span><span id="totalNum"></span>个用户，男<span id="totalMan"></span>人，女<span id="totalWoman"></span>人
	    </div>
	    <div style="float: right;">
	   		<input type="text" id="selectName" style="margin-right:10px"/><button onclick="selectUser()" class="btn btn-success btn-sm">查询</button>
   		</div>
   	</div>
    <div class="tab-pane" id="pushed-content"  style="padding:25px 15px;">
      <style>
		  .table tr th { text-align:center; background-color:#eee; }
		  .table tr td { text-align:center; }
		</style>
      <table class="table table-bordered">
        <thead>
          <th>头像</th>
          <th>昵称</th>
          <th>openId</th>
          <th>性别</th>
          <th>城市</th>
          <th>角色</th>
          <th>免费霸屏次数</th>
          <th>备注</th>
          <th>操作</th>
        </thead>
        <tbody id="userList">
        </tbody>
      </table>
    </div>
    <div class="modal" id="function-notes-set" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">修改备注</h4>
          </div>
          <div class="modal-body">
            <form role="form">
              <div class="form-group">
                <label for="name">角色</label>
                <select name="selectRole" id="selectRole" class="form-control" onchange="showOwnScreen(this[selectedIndex].value)">   
			        <option value="0">普通用户</option>   
			        <option value="1">管理员</option>   
			        <option value="2">黑名单</option>   
		        </select>  
		        <div id="ownScreen">
	                <label for="name">免费霸屏次数</label>
	                <input name="times" class="form-control" type="text" id="times">
                </div>
                <label for="name">备注</label>
                <input name="wechatNotes" class="form-control" type="text" id="wechatNotes">
                <input name="wechatId" type="hidden" id="wechatId">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-success btn-sm" onclick="setNotes()">确定</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal -->
    </div>
  </body>
</html>
