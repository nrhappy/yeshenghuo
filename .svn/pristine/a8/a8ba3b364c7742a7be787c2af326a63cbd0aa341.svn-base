package cn.xjwlfw.yeshenghuo.controller.corporation.functionManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.model.Dashang;
import cn.xjwlfw.yeshenghuo.model.OwnScreen;
import cn.xjwlfw.yeshenghuo.service.corporation.functionManage.WeishangqiangInfoService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 企业端 - 功能设置 - 微上墙价格
 */
@Controller
@RequestMapping(value = "/corporation/functionManage/weishangqiangInfo")
public class WeishangqiangInfoController {
	
	@Autowired
	private WeishangqiangInfoService weishangqiangInfoService;
	
	/**
	 * 页面
	 * 
	 * @author liyijun
	 * @since 2017年5月1日
	 */
	@RequestMapping(value = "")
	public String index(Model model) {
		return weishangqiangInfoService.index(model);
	}
	
	/**
	 * 霸屏修改
	 * 
	 * @author liyijun
	 * @since 2017年5月1日
	 */
	@RequestMapping(value = "/ownScreenModify")
	@ResponseBody
	public Result ownScreenModify(OwnScreen ownScreen) {
		return weishangqiangInfoService.ownScreenModify(ownScreen);
	}
	
	/**
	 * 打赏修改
	 * 
	 * @author liyijun
	 * @since 2017年5月1日
	 */
	@RequestMapping(value = "/dashangModify")
	@ResponseBody
	public Result dashangModify(Dashang dashang) {
		return weishangqiangInfoService.dashangModify(dashang);
	}

}
