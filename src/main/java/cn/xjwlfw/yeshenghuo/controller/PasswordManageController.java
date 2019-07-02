package cn.xjwlfw.yeshenghuo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.xjwlfw.yeshenghuo.service.PasswordManageService;

/**
 * 密码管理
 */
@Controller
@RequestMapping(value = "/passwordManage")
public class PasswordManageController {
	
	@Autowired
	PasswordManageService passwordManageService;
	
	/**
	 * 修改密码（页面）
	 * 
	 * @author liyijun
	 * @since 2017年3月27日
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String toPasswordManage() {
		return passwordManageService.toPasswrodManage();
	}
	
	/**
	 * 修改密码（处理）
	 * 
	 * @author liyijun
	 * @since 2017年3月27日
	 */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String doPasswordManage(@RequestParam(value = "password") String password, @RequestParam(value = "newPassword") String newPassword, @RequestParam(value = "reNewPassword") String reNewPassword, Model model) {
		return passwordManageService.doPasswordManage(password, newPassword, reNewPassword, model);
	}
}
