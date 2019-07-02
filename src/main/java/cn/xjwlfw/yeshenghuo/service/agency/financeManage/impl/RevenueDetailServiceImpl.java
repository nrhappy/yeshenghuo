package cn.xjwlfw.yeshenghuo.service.agency.financeManage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.AgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.OrderMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserAgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Agency;
import cn.xjwlfw.yeshenghuo.model.Order;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserAgency;
import cn.xjwlfw.yeshenghuo.service.agency.financeManage.RevenueDetailService;

@Service
public class RevenueDetailServiceImpl implements RevenueDetailService {

	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private AgencyMapper agencyDao;
	
	@Autowired
	private UserAgencyMapper userAgencyDao;
	
	@Autowired
	private OrderMapper orderDao;

	@Override
	public String index(Model model) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		// 获取当前用户对象
		User currentUser = userDao.selectByMobile(mobile);
		// 获取当前用户代理关系对象
		UserAgency userAgency = userAgencyDao.selectByUserId(currentUser.getId());
		// 获取当前代理对象
		Agency currentAgency = agencyDao.selectByPrimaryKey(userAgency.getAgencyId());
		
		Order order = new Order();
		order.setAgencyId(currentAgency.getId());
		
		List<Order> orderList = orderDao.selectListByAgency(order);
		
		model.addAttribute("orderList", orderList);
		return "/agency/financeManage/revenueDetail";
	}

}
