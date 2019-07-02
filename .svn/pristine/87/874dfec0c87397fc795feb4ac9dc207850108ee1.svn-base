package cn.xjwlfw.yeshenghuo.service.business.impl;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserBusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserBusiness;
import cn.xjwlfw.yeshenghuo.service.business.BusinessOverviewService;
import cn.xjwlfw.yeshenghuo.system.base.impl.BaseServiceImpl;

@Service
public class BusinessOverviewServiceImpl extends BaseServiceImpl implements BusinessOverviewService {

	@Autowired
	private UserMapper userDao;

	@Autowired
	private UserBusinessMapper userBusinessDao;

	@Autowired
	private BusinessMapper businessDao;

	@Override
	public String index(Model model) {
		try {
			String mobile = (String) SecurityUtils.getSubject().getPrincipal();
			
			// 获取当前用户对象
			User currentUser = userDao.selectByMobile(mobile);
			
			// 获取当前用户商家关系对象
			UserBusiness userBusiness = userBusinessDao.selectByUserId(currentUser.getId());
			
			// 获取当前商家对象
			Business currentBusiness = businessDao.selectByPrimaryKey(userBusiness.getBusinessId());
			
			model.addAttribute("currentUser", currentUser);
			model.addAttribute("currentBusiness", currentBusiness);
			
			return "/business/overview";
		} catch (Exception e) {
			return "/business/overview";
		}
	}

}
