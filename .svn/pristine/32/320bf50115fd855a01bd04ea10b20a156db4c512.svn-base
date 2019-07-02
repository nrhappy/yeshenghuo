package cn.xjwlfw.yeshenghuo.service.corporation.businessManage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.OrderMapper;
import cn.xjwlfw.yeshenghuo.model.Order;
import cn.xjwlfw.yeshenghuo.service.corporation.businessManage.BusinessFinanceService;

@Service
public class BusinessFinanceServiceImpl implements BusinessFinanceService {
	
	@Autowired
	private OrderMapper orderDao;
	
	@Override
	public String index(Model model) {
		List<Order> businessOrderList = orderDao.selectListByBusiness(new Order());
		model.addAttribute("businessOrderList", businessOrderList);
		return "/corporation/businessManage/businessFinance";
	}

}
