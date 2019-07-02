package cn.xjwlfw.yeshenghuo.controller.agency;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.xjwlfw.yeshenghuo.service.agency.AgencyLoginService;

/**
 * 代理登录模块
 */
@Controller
@RequestMapping(value = "/agency")
public class AgencyLoginController {
	
	@Autowired
	private AgencyLoginService agencyLoginService;
	
	/**
	 * 登录页面
	 * 
	 * @author liyijun
	 * @since 2017年4月16日
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String toLogin() {
		return agencyLoginService.toLogin();
	}
	
	/**
	 * 登录处理
	 * 
	 * @author liyijun
	 * @since 2017年4月16日
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLogin(@RequestParam(value = "mobile") String mobile, @RequestParam(value = "password") String password, Model model) {
		return agencyLoginService.doLogin(mobile, password, model);
	}
	
	/**
	 * 登出处理
	 * 
	 * @author liyijun
	 * @since 2017年3月15日
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		SecurityUtils.getSubject().logout();
		return "redirect:/agency/login";
	}

}
