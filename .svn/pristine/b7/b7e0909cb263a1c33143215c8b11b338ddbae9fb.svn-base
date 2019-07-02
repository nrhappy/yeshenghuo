package cn.xjwlfw.yeshenghuo.controller.corporation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.xjwlfw.yeshenghuo.service.corporation.CorporationManageService;
import cn.xjwlfw.yeshenghuo.system.base.BaseController;

/**
 * 企业端管理模块
 */
@Controller
@RequestMapping(value = "/corporation")
public class CorporationManageController extends BaseController {
	
	@Autowired
	private CorporationManageService corporationManageService;
	
	/**
	 * 企业端管理页面
	 * 
	 * @author liyijun
	 * @since 2017年4月07日
	 */
	@RequestMapping(value = "/manage")
	public String toManage(Model model) {
		return corporationManageService.toManage(model);
	}

}
