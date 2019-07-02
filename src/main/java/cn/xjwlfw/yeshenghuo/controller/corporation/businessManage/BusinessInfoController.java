package cn.xjwlfw.yeshenghuo.controller.corporation.businessManage;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.service.corporation.businessManage.BusinessInfoService;
import cn.xjwlfw.yeshenghuo.system.base.BaseController;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 商家信息模块
 */
@Controller
@RequestMapping(value = "/corporation/businessManage/businessInfo")
public class BusinessInfoController extends BaseController {
	
	@Autowired
	private BusinessInfoService businessInfoService;
	
	/**
	 * 商家信息页面
	 * 
	 * @author liyijun
	 * @since 2017年4月07日
	 */
	@RequestMapping(value = "")
	public String index(Model model) {
		return businessInfoService.index(model);
	}
	
	/**
	 * 搜索
	 * 
	 * @author liyijun
	 * @since 2017年4月11日
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam(value = "businessName") String businessName, Model model) {
		return businessInfoService.search(businessName, model);
	}
	
	/**
	 * 修改备注
	 * 
	 * @author liyijun
	 * @since 2017年4月11日
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Result update(Business business, Model model) {
		return businessInfoService.update(business, model);
	}
	
	/**
	 * 打款
	 * 
	 * @author liyijun
	 * @since 2017年4月11日
	 */
	@RequestMapping(value = "/cashOut", method = RequestMethod.POST)
	@ResponseBody
	public Result cashOut(int id, BigDecimal amount, Model model) {
		return businessInfoService.cashOut(id, amount, model);
	}

}
