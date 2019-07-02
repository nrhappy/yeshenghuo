package cn.xjwlfw.yeshenghuo.service.corporation.impl;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.RoleMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserBusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserRoleMapper;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.Role;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserBusiness;
import cn.xjwlfw.yeshenghuo.model.UserRole;
import cn.xjwlfw.yeshenghuo.service.corporation.CorporationManageService;

@Service
public class CorporationManageServiceImpl implements CorporationManageService {

	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private RoleMapper roleDao;
	
	@Autowired
	private UserRoleMapper userRoleDao;

	@Autowired
	private UserBusinessMapper userBusinessDao;
	
	@Override
	public String toManage(Model model) {
		try {
			String account = (String) SecurityUtils.getSubject().getPrincipal();
			User currentUser = userDao.selectByMobile(account);
			UserRole userRole = userRoleDao.selectByUserId(currentUser.getId());
			Role role = roleDao.selectByPrimaryKey(userRole.getRoleId());
			if (role.getName().equals("corporation")) {
				return "/corporation/manage";
			} else {
				return "redirect:/corporation/login";
			}
		} catch (Exception e) {
			return "redirect:/corporation/login";
		}
	}

}
