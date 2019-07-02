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
import cn.xjwlfw.yeshenghuo.service.agency.AgencyManageService;

@Service
public class AgencyManageServiceImpl implements AgencyManageService {

	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private AgencyMapper agencyDao;
	
	@Autowired
	private UserAgencyMapper userAgencyDao;
	
	@Override
	public String toManage(Model model) {
		try {
			String mobile = (String) SecurityUtils.getSubject().getPrincipal();
			
			// 获取当前用户对象
			User currentUser = userDao.selectByMobile(mobile);
			
			// 获取当前用户代理关系对象
			UserAgency userAgency = userAgencyDao.selectByUserId(currentUser.getId());

			// 获取当前代理对象
			Agency currentAgency = agencyDao.selectByPrimaryKey(userAgency.getAgencyId());
			
			if (currentAgency != null) {
				model.addAttribute("currentUser", currentUser);
				model.addAttribute("currentAgency", currentAgency);
				return "/agency/manage";
			}
		} catch (Exception e) {
			return "redirect:/agency/logout";
		}
		return "redirect:/agency/logout";
	}

}
