package cn.xjwlfw.yeshenghuo.controller.agency;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.xjwlfw.yeshenghuo.service.agency.AgencyManageService;

/**
 * 代理管理模块
 */
@Controller
@RequestMapping(value = "/agency")
public class AgencyManageController {
	
	@Autowired
	private AgencyManageService agencyManageService;
	
	/**
	 * 代理管理页面
	 * 
	 * @author liyijun
	 * @since 2017年4月16日
	 */
	@RequestMapping(value = "/manage")
	public String toManage(Model model) {
		return agencyManageService.toManage(model);
	}

}
