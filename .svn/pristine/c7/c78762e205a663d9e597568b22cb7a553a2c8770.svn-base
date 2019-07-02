package cn.xjwlfw.yeshenghuo.controller.corporation;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.xjwlfw.yeshenghuo.service.corporation.CorporationLoginService;
import cn.xjwlfw.yeshenghuo.system.base.BaseController;

/**
 * 企业端登录
 */
@Controller
@RequestMapping(value = "/corporation")
public class CorporationLoginController extends BaseController {
	
	@Autowired
	private CorporationLoginService corporationLoginService;
	
	/**
	 * 登录页面
	 * 
	 * @author liyijun
	 * @since 2017年4月07日
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String toLogin() {
		return corporationLoginService.toLogin();
	}
	
	/**
	 * 登录处理
	 * 
	 * @author liyijun
	 * @since 2017年4月07日
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLogin(@RequestParam(value = "mobile") String mobile, @RequestParam(value = "password") String password, Model model) {
		return corporationLoginService.doLogin(mobile, password, model);
	}
	
	/**
	 * 登出处理
	 * 
	 * @author liyijun
	 * @since 2017年4月07日
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String doLogout(HttpServletRequest request) {
		SecurityUtils.getSubject().logout();
		return "redirect:/corporation/login";
	}

}
