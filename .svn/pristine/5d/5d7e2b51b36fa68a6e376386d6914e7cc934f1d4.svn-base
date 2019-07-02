<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.css" rel="stylesheet">
	    
		<script src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/resource/js/jquery.uploadify.js"></script>
		
		<script src="<%=request.getContextPath()%>/resource/js/bootstrap.js"></script>
		<script>
			var root = "<%=request.getContextPath()%>";
			
			$(document).ready(function() {
				
				$("#upload").uploadify({
			        'uploader'       : root + '/file/upload',
			        'swf'			 : root + '/resource/js/uploadify.swf',
			        'queueID'        : 'fileQueue',  
			        'auto'           : true,  
			        'multi'          : true,  
			        'buttonCursor'   : 'hand',  
			        'fileObjName'    : 'file',  
			        'buttonText'     : '上传',  
			        'height'         : '25',  
			        'progressData'   : 'percentage',  
			        'fileTypeDesc'   : '支持格式:jpg/gif/jpeg/png/bmp.',    
			        'fileTypeExts'	 : '*.jpg;*.gif;*.jpeg;*.png;*.bmp',
			        onUploadSuccess  : function(file, result_s, response) {
			        	if (response == true) {
			        		var result = JSON.parse(result_s);
			        		$("#img").attr("src", result.data.fileUrl);
			        	}
			        }
				});

			});
		</script> 
	</head>
	<body>
		<input type="file" id="upload">
		
		<div style="width:500px; height:500px; overflow:hidden; border:1px solid #000;">
			<img id="img" style="width:500px; height:auto;" src="">
		</div>
	</body>
</html>