package cn.xjwlfw.yeshenghuo.service.corporation.agencyManage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.OrderMapper;
import cn.xjwlfw.yeshenghuo.model.Order;
import cn.xjwlfw.yeshenghuo.service.corporation.agencyManage.AgencyFinanceService;

@Service
public class AgencyFinanceServiceImpl implements AgencyFinanceService {
	
	@Autowired
	private OrderMapper orderDao;
	
	@Override
	public String index(Order order, Model model) {
		List<Order> agencyOrderList = orderDao.selectListByAgency(order);
		model.addAttribute("agencyOrderList", agencyOrderList);
		return "/corporation/agencyManage/agencyFinance";
	}

}
