package cn.xjwlfw.yeshenghuo.controller.business.accountManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.service.business.accountManage.AccountInfoService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 账号管理
 */
@Controller
@RequestMapping(value = "/business/accountManage/accountInfo")
public class AccountInfoController {
	
	@Autowired
	AccountInfoService accountInfoService;
	
	/**
	 * 首页
	 * 
	 * @author liyijun
	 * @since 2017年3月19日
	 */
	@RequestMapping(value = "")
	public String index(Model model) { return accountInfoService.index(model); }
	
	/**
	 * 设置商家LOGO
	 * 
	 * @author liyijun
	 * @since 2017年3月22日
	 */
	@RequestMapping(value = "/setLogo")
	@ResponseBody
	public Result setLogo(@RequestParam(value = "logo") String logo) { return accountInfoService.setLogo(logo); }
	
	/**
	 * 设置商家名称
	 * 
	 * @author liyijun
	 * @since 2017年3月22日
	 */
	@RequestMapping(value = "/setName")
	@ResponseBody
	public Result setName(@RequestParam(value = "name") String name) { return accountInfoService.setName(name); }
	
	/**
	 * 设置商家电话
	 * 
	 * @author liyijun
	 * @since 2017年3月22日
	 */
	@RequestMapping(value = "/setTel")
	@ResponseBody
	public Result setTel(@RequestParam(value = "tel") String tel) { return accountInfoService.setTel(tel); }
	
	/**
	 * 设置商家地址
	 * 
	 * @author liyijun
	 * @since 2017年3月22日
	 */
	@RequestMapping(value = "/setAddress")
	@ResponseBody
	public Result setAddress(@RequestParam(value = "provinceCode") String provinceCode, @RequestParam(value = "cityCode") String cityCode, @RequestParam(value = "districtCode") String districtCode) { return accountInfoService.setAddress(provinceCode, cityCode, districtCode); }
	
	/**
	 * 设置商家简介
	 * 
	 * @author liyijun
	 * @since 2017年3月22日
	 */
	@RequestMapping(value = "/setSummary")
	@ResponseBody
	public Result setSummary(@RequestParam(value = "summary") String summary) { return accountInfoService.setSummary(summary); }
}
