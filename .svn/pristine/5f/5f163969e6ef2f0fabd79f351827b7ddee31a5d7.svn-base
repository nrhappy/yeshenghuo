package cn.xjwlfw.yeshenghuo.controller.business;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.xjwlfw.yeshenghuo.service.business.BusinessLoginService;
import cn.xjwlfw.yeshenghuo.system.base.BaseController;

/**
 * 商家登录、注册
 */
@Controller
@RequestMapping(value = "/business")
public class BusinessLoginController extends BaseController {
	
	@Autowired
	BusinessLoginService businessLoginService;
	
	/**
	 * 登录页面
	 * 
	 * @author liyijun
	 * @since 2017年3月15日
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String toLogin() { 
		return "/business/login"; 
	}
	
	/**
	 * 登录处理
	 * 
	 * @author liyijun
	 * @since 2017年3月15日
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLogin(@RequestParam(value = "mobile") String mobile, @RequestParam(value = "password") String password, Model model) throws IOException {
		return businessLoginService.doLogin(mobile, password, model);
	}
	
	/**
	 * 登出处理
	 * 
	 * @author liyijun
	 * @since 2017年3月15日
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String doLogout(HttpServletRequest request) {
		SecurityUtils.getSubject().logout();
		return "redirect:/business/login";
	}
	
	/**
	 * 注册页面
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String toRegister() { 
		return "business/register"; 
	}
	
	/**
	 * 注册处理
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String doRegister(@RequestParam(value = "mobile") String mobile, @RequestParam(value = "password") String password, @RequestParam(value = "repassword") String repassword, @RequestParam(value = "imageCaptcha") String imageCaptcha, Model model, HttpServletRequest request) {
		return businessLoginService.doRegister(mobile, password, repassword, imageCaptcha, model, request);
	}
	
	/**
	 * 完善页面
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String toComplete() { 
		return "business/complete"; 
	}
	
	/**
	 * 完善处理
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public String doComplete(
			@RequestParam(value = "name") String name, 
			@RequestParam(value = "tel") String tel, 
			@RequestParam(value = "bank", required = false) String bank, 
			@RequestParam(value = "bankAccount", required = false) String bankAccount, 
			@RequestParam(value = "bankPossessor", required = false) String bankPossessor, 
			@RequestParam(value = "authcode") String authcode, 
			@RequestParam(value = "RefMobile", required = false) String RefMobile,
			@RequestParam(value = "provinceCode") String provinceCode, 
			@RequestParam(value = "cityCode") String cityCode, 
			@RequestParam(value = "districtCode") String districtCode, 
			Model model) {
		return businessLoginService.doComplete(name, tel, bank, bankAccount, bankPossessor, authcode, RefMobile, provinceCode, cityCode, districtCode, model);
	}
	
	/**
	 * 忘记密码页面
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/forget", method = RequestMethod.GET)
	public String toForget() { 
		return "business/forget"; 
	}
	
	/**
	 * 忘记密码处理
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/forget", method = RequestMethod.POST)
	public String doForget(HttpServletRequest request, HttpServletResponse response) {
		return businessLoginService.doForget(request);
	}
	
	/**
	 * 重置密码页面
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public String toReset() { 
		return "business/reset"; 
	}
	
	/**
	 * 重置密码处理
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	public String doReset(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return businessLoginService.doReset(request);
	}
}
