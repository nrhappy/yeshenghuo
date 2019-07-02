package cn.xjwlfw.yeshenghuo.controller.agency;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.xjwlfw.yeshenghuo.service.agency.AgencyOverviewService;

/**
 * 代理后台总览
 */
@Controller
@RequestMapping(value = "/agency")
public class AgencyOverviewController {
	
	@Autowired
	private AgencyOverviewService agencyOverviewService;
	
	/**
	 * 页面
	 * 
	 * @author liyijun
	 * @since 2017年4月16日
	 */
	@RequestMapping(value = "/overview")
	public String index(Model model) {
		return agencyOverviewService.index(model);
	}

}
