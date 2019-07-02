package cn.xjwlfw.yeshenghuo.service.business.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.CashOutMapper;
import cn.xjwlfw.yeshenghuo.mapper.OrderMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserBusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.CashOut;
import cn.xjwlfw.yeshenghuo.model.Order;
import cn.xjwlfw.yeshenghuo.model.RevenueCount;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserBusiness;
import cn.xjwlfw.yeshenghuo.service.business.BusinessOverviewWechatRevenueService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class BusinessOverviewWechatRevenueServiceImpl implements BusinessOverviewWechatRevenueService {
	
	@Autowired
	private OrderMapper orderDao;
	
	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private UserBusinessMapper userBusinessDao;
	
	@Autowired
	private BusinessMapper businessDao;
	
	@Autowired
	private CashOutMapper cashOutDao;

	@Override
	public String index(Model model) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		// 获取当前用户对象
		User currentUser = userDao.selectByMobile(mobile);
		// 获取当前用户商家关系对象
		UserBusiness userBusiness = userBusinessDao.selectByUserId(currentUser.getId());
		// 获取当前商家对象
		Business currentBusiness = businessDao.selectByPrimaryKey(userBusiness.getBusinessId());
		
		Order order = new Order();
		order.setBusinessId(currentBusiness.getId());
		
		List<Order> orderList = orderDao.selectListByBusiness(order);
		
		CashOut cashOut = new CashOut();
		cashOut.setBusinessId(currentBusiness.getId());
		List<CashOut> cashOutList = cashOutDao.selectList(cashOut);
		
		CashOut oCashOut = cashOutDao.selectUndeliveryByBusinessId(currentBusiness.getId());
		
		model.addAttribute("oCashOut", oCashOut);
		model.addAttribute("cashOutList", cashOutList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("currentBusiness", currentBusiness);
		
		return "/business/wechatRevenue";
	}

	@Override
	public Result revenueCount(int nears) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		
		// 获取当前用户对象
		User currentUser = userDao.selectByMobile(mobile);
		
		// 获取当前用户商家关系对象
		UserBusiness userBusiness = userBusinessDao.selectByUserId(currentUser.getId());
		
		// 获取当前商家对象
		Business currentBusiness = businessDao.selectByPrimaryKey(userBusiness.getBusinessId());
		
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
		Order order = new Order();
		order.setBusinessId(currentBusiness.getId());
		
		List<RevenueCount> revenueCountList = orderDao.selectBusinessRevenueCountList(nears, currentBusiness.getId());
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

	@Override
	public Result cashOut(BigDecimal amount) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		
		// 获取当前用户对象
		User currentUser = userDao.selectByMobile(mobile);
		
		// 获取当前用户商家关系对象
		UserBusiness userBusiness = userBusinessDao.selectByUserId(currentUser.getId());
		
		// 获取当前商家对象
		Business currentBusiness = businessDao.selectByPrimaryKey(userBusiness.getBusinessId());
		
		CashOut oCashOut = cashOutDao.selectUndeliveryByBusinessId(currentBusiness.getId());
		
		if (oCashOut != null) {
			return new Result(1, "已经有待初受理的提现请求了，无法再次申请！");
		}
		
		if (currentBusiness.getBalance().compareTo(amount) != -1) {
			CashOut cashOut = new CashOut();
			cashOut.setType((byte) 0);
			cashOut.setBusinessId(currentBusiness.getId());
			cashOut.setAmount(amount);
			cashOut.setStatus((byte) 0);
			cashOut.setCreateTime(new Date());
			cashOut.setUpdateTime(new Date());
			if (cashOutDao.insertSelective(cashOut) == 1) {
				return new Result(0);
			} else {
				return new Result(1, "申请失败！");
			}
		} else {
			return new Result(1, "当前余额不足！");
		}
	}

	@Override
	public Result cashOutSet(Business business) {
		if (businessDao.updateByPrimaryKeySelective(business) == 1) {
			return new Result(0);
		} else {
			return new Result(1);
		}
	}

}
