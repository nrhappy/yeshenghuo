package cn.xjwlfw.yeshenghuo.service.agency.financeManage.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import cn.xjwlfw.yeshenghuo.model.RevenueCount;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserAgency;
import cn.xjwlfw.yeshenghuo.service.agency.financeManage.RevenueTrendService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class RevenueTrendServiceImpl implements RevenueTrendService {
	
	@Autowired
	private OrderMapper orderDao;

	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private AgencyMapper agencyDao;
	
	@Autowired
	private UserAgencyMapper userAgencyDao;

	@Override
	public String index(Model model) {
		return "/agency/financeManage/revenueTrend";
	}

	@Override
	public Result data(int nears) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		// 获取当前用户对象
		User currentUser = userDao.selectByMobile(mobile);
		// 获取当前用户代理关系对象
		UserAgency userAgency = userAgencyDao.selectByUserId(currentUser.getId());
		// 获取当前代理对象
		Agency currentAgency = agencyDao.selectByPrimaryKey(userAgency.getAgencyId());
		
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
		
		List<RevenueCount> revenueCountList = orderDao.selectAgencyRevenueCountList(nears, currentAgency.getId());
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
