package cn.xjwlfw.yeshenghuo.controller.business.accountManage;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserBusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserBusiness;
import cn.xjwlfw.yeshenghuo.service.business.accountManage.AccountInfoService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 账号管理
 */
@Controller
@RequestMapping(value = "/business/accountManage/authcode")
public class AuthCodeController {
	
	@Autowired
	private BusinessMapper businessDao;
	
	@Autowired
	private UserBusinessMapper userBusinessDao;
	
	@Autowired
	private UserMapper userDao;
	
	/**
	 * 首页
	 * 
	 * @author liyijun
	 * @since 2017年3月19日
	 */
	@RequestMapping(value = "")
	public String index(Model model) { 
		return "/business/accountManage/authcode"; 
	}
	
	/**
	 * 首页
	 * 
	 * @author liyijun
	 * @since 2017年3月19日
	 */
	@RequestMapping(value = "/update")
	public String update(
			@RequestParam(value = "authcode") String authcode, 
			@RequestParam(value = "newAuthcode") String newAuthcode, 
			@RequestParam(value = "reNewAuthcode") String reNewAuthcode, 
			Model model) { 
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		// 获取当前用户对象
		User currentUser = userDao.selectByMobile(mobile);
		// 获取当前用户商家关系对象
		UserBusiness userBusiness = userBusinessDao.selectByUserId(currentUser.getId());
		// 获取当前商家对象
		Business currentBusiness = businessDao.selectByPrimaryKey(userBusiness.getBusinessId());
		
		if (authcode.length() < 1) {
			model.addAttribute("message", "原授权码不能为空！");
		} else if (newAuthcode.length() < 1) {
			model.addAttribute("message", "新授权码不能为空！");
		} else if (!reNewAuthcode.equals(newAuthcode)) {
			model.addAttribute("message", "两次输入的授权码不一致！");
		} else if (!currentBusiness.getAuthcode().equals(authcode)) {
			model.addAttribute("message", "原授权码错误！");
		} else {
			currentBusiness.setAuthcode(newAuthcode);
			if (businessDao.updateByPrimaryKey(currentBusiness) == 1) {
				model.addAttribute("message", "授权码修改成功！");
			} else {
				model.addAttribute("message", "授权码修改失败！");
			}
		}
		return "/business/accountManage/authcode"; 
	}
	
}
