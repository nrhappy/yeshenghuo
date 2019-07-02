package cn.xjwlfw.yeshenghuo.controller.agency.financeManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.xjwlfw.yeshenghuo.service.agency.financeManage.RevenueDetailService;

/**
 * 代理收入明细
 */
@Controller
@RequestMapping(value = "/agency/financeManage/revenueDetail")
public class RevenueDetailController {
	
	@Autowired
	private RevenueDetailService revenueDetailServcie;
	
	@RequestMapping(value = "")
	public String index(Model model) {
		return revenueDetailServcie.index(model);
	}

}
