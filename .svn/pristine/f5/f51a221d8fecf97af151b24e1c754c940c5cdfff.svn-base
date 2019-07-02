package cn.xjwlfw.yeshenghuo.service.agency.impl;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.AgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserAgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Agency;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserAgency;
import cn.xjwlfw.yeshenghuo.service.agency.AgencyOverviewService;

@Service
public class AgencyOverviewServiceImpl implements AgencyOverviewService {

	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private AgencyMapper agencyDao;
	
	@Autowired
	private UserAgencyMapper userAgencyDao;

	@Override
	public String index(Model model) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		// 获取当前用户对象
		User currentUser = userDao.selectByMobile(mobile);
		// 获取当前用户代理关系对象
		UserAgency userAgency = userAgencyDao.selectByUserId(currentUser.getId());
		// 获取当前代理对象
		Agency currentAgency = agencyDao.selectByPrimaryKey(userAgency.getAgencyId());
		
		model.addAttribute("currentUser", currentUser);
		model.addAttribute("currentAgency", currentAgency);
		return "/agency/overview";
	}

}
