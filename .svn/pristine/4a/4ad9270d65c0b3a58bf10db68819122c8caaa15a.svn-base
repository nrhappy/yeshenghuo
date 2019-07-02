package cn.xjwlfw.yeshenghuo.controller.corporation.businessManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.xjwlfw.yeshenghuo.service.corporation.businessManage.BusinessFinanceService;

/**
 * 商家财务模块
 */
@Controller
@RequestMapping(value = "/corporation/businessManage/businessFinance")
public class BusinessFinanceController {
	
	@Autowired
	private BusinessFinanceService businessFinanceService;
	
	/**
	 * 商家财务页面
	 * 
	 * @author liyijun
	 * @since 2017年4月08日
	 */
	@RequestMapping(value = "")
	public String index(Model model) {
		return businessFinanceService.index(model);
	}

}
