package cn.xjwlfw.yeshenghuo.service.agency.businessManage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.AgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.OrderMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserAgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Agency;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.Order;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserAgency;
import cn.xjwlfw.yeshenghuo.service.agency.businessManage.BusFinanceService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class BusFinanceServiceImpl implements BusFinanceService {
	
	@Autowired
	private OrderMapper orderDao;

	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private AgencyMapper agencyDao;
	
	@Autowired
	private UserAgencyMapper userAgencyDao;

	@Autowired
	private BusinessMapper businessDao;
	
	@Override
	public Result index(int businessId, Model model) {
		Order order = new Order();
		order.setBusinessId(businessId);
		
		List<Order> orderList = orderDao.selectListByBusiness(order);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("orderList", orderList);
		
		return new Result(0, data);
	}

}
