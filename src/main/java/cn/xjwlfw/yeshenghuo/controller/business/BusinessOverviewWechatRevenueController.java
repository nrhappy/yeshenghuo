package cn.xjwlfw.yeshenghuo.controller.business;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.service.business.BusinessOverviewWechatRevenueService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 商家 - 微信营收
 */
@Controller
@RequestMapping(value = "/business/overview/wechatRevenue")
public class BusinessOverviewWechatRevenueController {
	
	@Autowired
	private BusinessOverviewWechatRevenueService businessOverviewWechatRevenueService;
	
	/**
	 * 微信营收页面
	 * 
	 * @author liyijun
	 * @since 2017年4月13日
	 */
	@RequestMapping(value = "")
	public String index(Model model) {
		return businessOverviewWechatRevenueService.index(model);
	}
	
	/**
	 * 收入趋势
	 * 
	 * @author liyijun
	 * @since 2017年4月13日
	 */
	@RequestMapping(value = "/revenueCount")
	@ResponseBody
	public Result revenueCount (@RequestParam(value = "nears") int nears) {
		return businessOverviewWechatRevenueService.revenueCount(nears);
	}
	
	/**
	 * 申请提现
	 * 
	 * @author liyijun
	 * @since 2017年4月13日
	 */
	@RequestMapping(value = "/cashOut")
	@ResponseBody
	public Result cashOut (@RequestParam(value = "amount") BigDecimal amount) {
		return businessOverviewWechatRevenueService.cashOut(amount);
	}
	
	/**
	 * 提现信息设置
	 * 
	 * @author liyijun
	 * @since 2017年4月13日
	 */
	@RequestMapping(value = "/cashOutSet")
	@ResponseBody
	public Result cashOutSet (Business business) {
		return businessOverviewWechatRevenueService.cashOutSet(business);
	}

}
