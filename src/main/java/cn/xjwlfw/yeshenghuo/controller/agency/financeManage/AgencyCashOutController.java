package cn.xjwlfw.yeshenghuo.controller.agency.financeManage;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.model.Agency;
import cn.xjwlfw.yeshenghuo.service.agency.financeManage.AgencyCashOutService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 代理提现模块
 */
@Controller
@RequestMapping(value = "/agency/financeManage/agencyCashOut")
public class AgencyCashOutController {
	
	@Autowired
	private AgencyCashOutService agencyCashOutService;
	
	/**
	 * 代理提现页面
	 * 
	 * @author liyijun
	 * @since 2017年4月18日
	 */
	@RequestMapping(value = "")
	public String index(Model model) {
		return agencyCashOutService.index(model);
	}
	
	/**
	 * 代理提现申请
	 * 
	 * @author liyijun
	 * @since 2017年4月18日
	 */
	@RequestMapping(value = "/cashOut")
	@ResponseBody
	public Result cashOut(@RequestParam(value = "amount") BigDecimal amount) {
		return agencyCashOutService.cashOut(amount);
	}
	
	/**
	 * 代理提现申请
	 * 
	 * @author liyijun
	 * @since 2017年4月18日
	 */
	@RequestMapping(value = "/cashOutSet")
	@ResponseBody
	public Result cashOutSet(Agency agency) {
		return agencyCashOutService.cashOutSet(agency);
	}
}
