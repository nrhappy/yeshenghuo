package cn.xjwlfw.yeshenghuo.service.agency.financeManage;

import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.system.base.Result;

public interface RevenueTrendService {
	
	public String index(Model model);
	
	public Result data(int nears);

}
