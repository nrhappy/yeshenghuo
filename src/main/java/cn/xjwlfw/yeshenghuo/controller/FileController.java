package cn.xjwlfw.yeshenghuo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.xjwlfw.yeshenghuo.service.FileService;
import cn.xjwlfw.yeshenghuo.system.base.BaseController;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 文件管理
 */
@Controller
@RequestMapping(value = "/file")
public class FileController extends BaseController {
	
	@Autowired
	private FileService fileService;
	
	/**
	 * 上传文件
	 * 
	 * @author liyijun
	 * @since 2017年3月16日
	 */
	@RequestMapping(value = "/upload")
	@ResponseBody
	public Result upload(@RequestParam(value = "file") MultipartFile file, HttpServletRequest request) {
		return fileService.upload(file, request);
	}
	
	/**
	 * 下载文件
	 * 
	 * @author liyijun
	 * @since 2017年3月16日
	 */
	@RequestMapping(value = "/download")
	public String download(HttpServletRequest request, HttpServletResponse response) {
		
		return "";
	}

}
