package cn.xjwlfw.yeshenghuo.controller.business.customerManage;

import java.util.List;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.FunctionView;
import cn.xjwlfw.yeshenghuo.model.WechatUser;
import cn.xjwlfw.yeshenghuo.service.business.GetLoginInfoService;
import cn.xjwlfw.yeshenghuo.service.business.customerManage.WechatUserService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Controller
@RequestMapping(value = "/business/customerManage/wechatManage")
public class CustomerController {

	Logger logger = Logger.getLogger(CustomerController.class);
	
	@Autowired
	private WechatUserService wechatUserService;
	
	@Autowired
	private GetLoginInfoService getLoginInfoService;
	
	/**
	 * 首页
	 * @return
	 * @author niurui
	 * @since 2017年4月18日
	 */
	@RequestMapping(value = "")
	public String index() {
		return "/business/customerManage/wechatManage";
	}
	
	/**
	 * 绑定公众号跳转
	 * @return
	 * @author niurui
	 * @since 2017年4月18日
	 */
	@RequestMapping(value = "/bandWechat")
	public String bandWechat() {
		return "/business/customerManage/bandWechat";
	}
	
	/**
	 * 查询微信用户列表
	 * @param name
	 * @return
	 * @author niurui
	 * @since 2017年4月18日
	 */
	@ResponseBody
	@RequestMapping(value = "/getWechatUserList")
	public List<WechatUser> getWechatUserList(@RequestParam("name") String name) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		return wechatUserService.getCurrentWechatUserList(mobile, name);
	}
	
	/**
	 * 修改备注
	 * @param id
	 * @param notes
	 * @return
	 * @author niurui
	 * @since 2017年4月18日
	 */
	@ResponseBody
	@RequestMapping(value = "/updateNotes")
	public Result updateNotes(@RequestParam("id") String id, @RequestParam("notes") String notes, @RequestParam("role") String role, @RequestParam("times") String times) {
		wechatUserService.updateNotes(Integer.parseInt(id), notes, role, Integer.parseInt(times));
		return Result.success();
	}
	
	@ResponseBody
	@RequestMapping(value = "/functionList")
	public FunctionView functionList() {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		Business currentBusiness = getLoginInfoService.getBusinessByMobile(mobile);
		FunctionView function = new FunctionView();
		function.setFunctionName("夜程序上墙");
		function.setFunctionDesc("夜程序上墙");
		function.setFunctionUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb4718a4eac30e9cc&redirect_uri=http%3A%2F%2Fycx.xiaovip.com.cn%2Fcustomer%2Fweishangqiang%2FweixinIndex%3FbusinessId%3D" + currentBusiness.getId() + "&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect");
		return function;
	}
}
