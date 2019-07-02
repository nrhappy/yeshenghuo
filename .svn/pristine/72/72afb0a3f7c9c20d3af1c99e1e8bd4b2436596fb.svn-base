package cn.xjwlfw.yeshenghuo.controller.corporation.agencyManage;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.model.Agency;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.service.corporation.agencyManage.AgencyInfoService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 代理商信息模块
 */
@Controller
@RequestMapping(value = "/corporation/agencyManage/agencyInfo")
public class AgencyInfoController {
	
	@Autowired
	private AgencyInfoService agencyInfoService;
	
	/**
	 * 代理商信息页面
	 * 
	 * @author liyijun
	 * @since 2017年4月07日
	 */
	@RequestMapping(value = "")
	public String index(Model model, String agencyName) {
		return agencyInfoService.index(model, agencyName);
	}
	
	/**
	 * 修改
	 * 
	 * @author liyijun
	 * @since 2017年4月11日
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Result update(Agency agency, Model model) {
		return agencyInfoService.update(agency, model);
	}
	
	/**
	 * 添加
	 * 
	 * @author liyijun
	 * @since 2017年4月11日
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Result add(User user, Agency agency, Model model) {
		return agencyInfoService.add(user, agency, model);
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
		return agencyInfoService.cashOut(id, amount, model);
	}
	
	/**
	 * 待绑定商家列表
	 * 
	 * @author liyijun
	 * @since 2017年4月21日
	 */
	@RequestMapping(value = "/businessList")
	@ResponseBody
	public Result businessList() {
		return agencyInfoService.businessList();
	}
	
	/**
	 * 待绑定商家列表
	 * 
	 * @author liyijun
	 * @since 2017年4月21日
	 */
	@RequestMapping(value = "/bind")
	@ResponseBody
	public Result bind(@RequestParam(value = "bindId") int bindId, @RequestParam(value = "businessId") int businessId) {
		return agencyInfoService.bind(bindId, businessId);
	}

}
