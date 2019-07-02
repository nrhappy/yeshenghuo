package cn.xjwlfw.yeshenghuo.controller.agency.financeManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.service.agency.financeManage.RevenueTrendService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 代理收入趋势模块
 */
@Controller
@RequestMapping(value = "/agency/financeManage/revenueTrend")
public class RevenueTrendController {
	
	@Autowired
	private RevenueTrendService revenueTrendService;
	
	/**
	 * 收入趋势页面
	 * 
	 * @author liyijun
	 * @since 2017年4月17日
	 */
	@RequestMapping(value = "")
	public String index(Model model) {
		return revenueTrendService.index(model);
	}
	
	/**
	 * 收入趋势数据
	 * 
	 * @author liyijun
	 * @since 2017年4月17日
	 */
	@RequestMapping(value = "/data")
	@ResponseBody
	public Result data(@RequestParam(value = "nears") int nears) {
		return revenueTrendService.data(nears);
	}

}
