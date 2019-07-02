package cn.xjwlfw.yeshenghuo.controller.corporation.financeManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.service.corporation.financeManage.RevenueService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 企业端 - 营收情况
 */
@Controller
@RequestMapping(value = "/corporation/financeManage/revenue")
public class RevenueController {
	
	@Autowired
	private RevenueService revenueService;
	
	/**
	 * 营收情况页面
	 * 
	 * @author liyijun
	 * @since 2017年4月14日
	 */
	@RequestMapping(value = "")
	public String index(Model model) {
		return revenueService.index(model);
	}
	
	/**
	 * 收入趋势
	 * 
	 * @author liyijun
	 * @since 2017年4月14日
	 */
	@RequestMapping(value = "/revenueCount")
	@ResponseBody
	public Result revenueCount(@RequestParam(value = "nears") int nears) {
		return revenueService.revenueCount(nears);
	}

}
