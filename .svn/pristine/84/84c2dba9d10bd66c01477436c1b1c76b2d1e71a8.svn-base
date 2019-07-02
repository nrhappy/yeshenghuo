package cn.xjwlfw.yeshenghuo.service.customer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.system.base.Result;

public interface WeishangqiangService {
	
	public String index(int wechatUserId, int businessId, Model model);
	
	public Result content(int businessId, String lastTime);

	public Result send(int wechatUserId, int weishangqiangId, String content);
	
	public Result sendOwnScreen(int wechatUserId, int weishangqiangId, int ownScreenId, String imgUrl, String content);
	
	public Result sendDashang(int wechatUserId, int weishangqiangId, int dashangId, int dashengTarId, String content);
	
	public Result ownScreenList(int weishangqiangId);

	public Result createOrder(HttpServletRequest request, int wechatUserId, int ownScreenId, int businessId, int weishangqiangId, short goodsType);

	public Result payOrder(String orderNo, int wechatUserId);

	public Result ownScreenUsed(int businessId, int wechatUserId);

	public Result setWeishangqiangOn(int weishangqiangId);

	public Result setWeishangqiangOff(int weishangqiangId);

}
