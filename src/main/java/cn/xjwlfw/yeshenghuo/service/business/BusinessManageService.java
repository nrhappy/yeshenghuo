package cn.xjwlfw.yeshenghuo.service.business;

import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 商家管理
 */
public interface BusinessManageService {
	
	public String toManage(Model model);
	
	public Result checkAuthcode(String authcode);
	
	public Business queryBusinessById(int id);

}
