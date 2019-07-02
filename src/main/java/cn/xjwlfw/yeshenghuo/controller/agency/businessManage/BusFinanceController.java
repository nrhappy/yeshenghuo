package cn.xjwlfw.yeshenghuo.controller.agency.businessManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.service.agency.businessManage.BusFinanceService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 商家财务模块
 */
@Controller
@RequestMapping(value = "/agency/businessManage/businessFinance")
public class BusFinanceController {
	
	@Autowired
	private BusFinanceService busFinanceService;
	
	/**
	 * 商家财务页面
	 * 
	 * @author liyijun
	 * @since 2017年4月08日
	 */
	@RequestMapping(value = "")
	@ResponseBody
	public Result index(@RequestParam(value = "businessId") int businessId, Model model) {
		return busFinanceService.index(businessId, model);
	}

}
