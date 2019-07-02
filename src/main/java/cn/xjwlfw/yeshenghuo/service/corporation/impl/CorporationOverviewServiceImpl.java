package cn.xjwlfw.yeshenghuo.service.corporation.impl;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.CorporationMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserBusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.Corporation;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserBusiness;
import cn.xjwlfw.yeshenghuo.service.corporation.CorporationOverviewService;
import cn.xjwlfw.yeshenghuo.system.base.impl.BaseServiceImpl;

@Service
public class CorporationOverviewServiceImpl extends BaseServiceImpl implements CorporationOverviewService {

	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private CorporationMapper corporationDao;

	@Override
	public String index(Model model) {
		try {
			String mobile = (String) SecurityUtils.getSubject().getPrincipal();
			
			// 获取当前用户对象
			User currentUser = userDao.selectByMobile(mobile);
			
			// 获取当前商家对象
			Corporation currentCorporation = corporationDao.get();
			
			model.addAttribute("currentUser", currentUser);
			model.addAttribute("currentCorporation", currentCorporation);
			
			return "/corporation/overview";
		} catch (Exception e) {
			return "/corporation/overview";
		}
	}

}
