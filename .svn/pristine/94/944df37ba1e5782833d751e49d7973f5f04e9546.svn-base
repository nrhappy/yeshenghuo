package cn.xjwlfw.yeshenghuo.controller.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.service.business.BusinessManageService;
import cn.xjwlfw.yeshenghuo.system.base.BaseController;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 商家管理模块
 */
@Controller
@RequestMapping(value = "/business")
public class BusinessManageController extends BaseController {
	
	@Autowired
	private BusinessManageService businessManageService;
	
	/**
	 * 商家管理页面
	 * 
	 * @return
	 * @author liyijun
	 * @since 2017/3/15
	 */
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String toManage(Model model) {
		return businessManageService.toManage(model);
	}
	
	/**
	 * 验证授权码
	 * 
	 * @return
	 * @author liyijun
	 * @since 2017/4/28
	 */
	@RequestMapping(value = "/checkAuthcode")
	@ResponseBody
	public Result checkAuthcode(@RequestParam(value = "authcode") String authcode) {
		return businessManageService.checkAuthcode(authcode);
	}
}
