package cn.xjwlfw.yeshenghuo.controller.corporation.agencyManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.xjwlfw.yeshenghuo.model.Order;
import cn.xjwlfw.yeshenghuo.service.corporation.agencyManage.AgencyFinanceService;

/**
 * 代理商财务模块
 */
@Controller
@RequestMapping(value = "/corporation/agencyManage/agencyFinance")
public class AgencyFinanceController {
	
	@Autowired
	private AgencyFinanceService agencyFinanceService;
	
	/**
	 * 代理商财务页面
	 * 
	 * @author liyijun
	 * @since 2017年4月08日
	 */
	@RequestMapping(value = "")
	public String index(Order order, Model model) {
		return agencyFinanceService.index(order, model);
	}

}
