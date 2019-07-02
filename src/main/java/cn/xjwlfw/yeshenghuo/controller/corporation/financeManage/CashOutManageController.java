package cn.xjwlfw.yeshenghuo.controller.corporation.financeManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.service.corporation.financeManage.CashOutManageService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 企业端 - 提现管理
 */
@Controller
@RequestMapping(value = "/corporation/financeManage/cashOutManage")
public class CashOutManageController {
	
	@Autowired
	private CashOutManageService cashOutManageService;
	
	/**
	 * 提现页面
	 * 
	 * @author liyijun
	 * @since 2017年4月10日
	 */
	@RequestMapping(value = "")
	public String index(Model model) {
		return cashOutManageService.index(model);
	}
	
	/**
	 * 提现页面
	 * 
	 * @author liyijun
	 * @since 2017年4月10日
	 */
	@RequestMapping(value = "/cashOut", method = RequestMethod.POST)
	@ResponseBody
	public Result cashOut(@RequestParam(value = "cashOutId") int cashOutId) {
		return cashOutManageService.cashOut(cashOutId);
	}
}
