package cn.xjwlfw.yeshenghuo.controller.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.xjwlfw.yeshenghuo.service.business.BusinessOverviewService;
import cn.xjwlfw.yeshenghuo.system.base.BaseController;

/**
 * 总览模块
 */
@Controller
@RequestMapping(value = "/business")
public class BusinessOverviewController extends BaseController {
	
	@Autowired
	private BusinessOverviewService businessOverviewService;
	
	/**
	 * 首页
	 * 
	 * @author liyijun
	 * @since 2017年3月29日
	 */
	@RequestMapping(value = "/overview", method = RequestMethod.GET)
	public String index(Model model) {
		return businessOverviewService.index(model);
	}

}
