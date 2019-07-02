package cn.xjwlfw.yeshenghuo.service.corporation.financeManage.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.OrderMapper;
import cn.xjwlfw.yeshenghuo.model.Order;
import cn.xjwlfw.yeshenghuo.model.RevenueCount;
import cn.xjwlfw.yeshenghuo.service.corporation.financeManage.RevenueService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class RevenueServiceImpl implements RevenueService {
	
	@Autowired
	private OrderMapper orderDao;
	
	@Override
	public String index(Model model) {
		List<Order> orderList = orderDao.selectList();
		model.addAttribute("orderList", orderList);
		return "/corporation/financeManage/revenue";
	}

	@Override
	public Result revenueCount(Integer nears) {
		String title = "";
		
		switch (nears) {
		case 7:
			title = "最近一周";
			break;
		case 30:
			title = "最近一月";
			break;
		case 365:
			title = "最近一年";
			break;
		default:
			return new Result(1, "参数错误！");
		}
		
		List<RevenueCount> revenueCountList = orderDao.selectRevenueCountList(nears);
		Map<String, Object> data = new HashMap<String, Object>();
		List<String> revenueDateCountList = new ArrayList<String>();
		List<String> revenueAmountList = new ArrayList<String>();
		for (RevenueCount revenueCount : revenueCountList) {
			revenueDateCountList.add(new SimpleDateFormat("yyyy/MM/dd").format(revenueCount.getDate()));
			revenueAmountList.add(revenueCount.getAmount().toString());
		}
		
		data.put("title", title);
		data.put("revenueDateCountList", revenueDateCountList);
		data.put("revenueAmountList", revenueAmountList);
		
		Result result = new Result();
		result.setCode(0);
		result.setData(data);
		
		return result;
	}

}
