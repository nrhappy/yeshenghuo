package cn.xjwlfw.yeshenghuo.service.business.impl;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.AgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserBusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserBusiness;
import cn.xjwlfw.yeshenghuo.service.business.BusinessManageService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class BusinessManageServiceImpl implements BusinessManageService {

	@Autowired
	private UserMapper userDao;

	@Autowired
	private UserBusinessMapper userBusinessDao;

	@Autowired
	private BusinessMapper businessDao;
	
	@Autowired
	private AgencyMapper agencyDao;
	
	@Override
	public String toManage(Model model) {
		try {
			String mobile = (String) SecurityUtils.getSubject().getPrincipal();
			
			// 获取当前用户对象
			User currentUser = userDao.selectByMobile(mobile);
			
			// 获取当前用户商家关系对象
			UserBusiness userBusiness = userBusinessDao.selectByUserId(currentUser.getId());
			
			if (userBusiness != null) {
				// 获取当前商家对象
				Business currentBusiness = businessDao.selectByPrimaryKey(userBusiness.getBusinessId());
				
				model.addAttribute("currentUser", currentUser);
				model.addAttribute("currentBusiness", currentBusiness);
				
				return "/business/manage";
			} else {
				return "redirect:/business/complete";
			}
			

		} catch (Exception e) {
			return "redirect:/business/logout";
		}
	}

	@Override
	public Result checkAuthcode(String authcode) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		User currentUser = userDao.selectByMobile(mobile);
		UserBusiness userBusiness = userBusinessDao.selectByUserId(currentUser.getId());
		Business currentBusiness = businessDao.selectByPrimaryKey(userBusiness.getBusinessId());
		if (currentBusiness.getAuthcode().equals(authcode)) {
			return new Result(0);
		} else {
			return new Result(1);
		}
	}

	@Override
	public Business queryBusinessById(int id) {
		return businessDao.selectByPrimaryKey(id);
	}

}
