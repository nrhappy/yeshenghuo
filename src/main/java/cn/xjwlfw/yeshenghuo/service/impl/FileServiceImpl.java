package cn.xjwlfw.yeshenghuo.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.xjwlfw.yeshenghuo.service.FileService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class FileServiceImpl implements FileService {

	@Override
	public Result upload(MultipartFile file, HttpServletRequest request) {
		Result result = new Result();
		Map<String, Object> data = new HashMap<String, Object>();
		
		String serverPath = "/upload/" + new SimpleDateFormat("yyyyMM").format(new Date()) + "/";
        
		String filePath = request.getSession().getServletContext().getRealPath(serverPath);
        String fileName = UUID.randomUUID().toString().replaceAll("-", "") + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String fileUrl = request.getContextPath() + serverPath + fileName;
        
        File targetFile = new File(filePath, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        
        try {  
            file.transferTo(targetFile);
            
            data.put("fileUrl", fileUrl);            
            result = new Result(0, "文件上传成功！", data);
        } catch (Exception e) {            
            result = new Result(1, "文件上传失败！");
        }
		
		return result;
	}

	@Override
	public Result download() {
		// TODO Auto-generated method stub
		return null;
	}

}
