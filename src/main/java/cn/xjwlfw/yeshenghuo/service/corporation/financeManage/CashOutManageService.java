package cn.xjwlfw.yeshenghuo.service.corporation.financeManage;

import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.system.base.Result;

public interface CashOutManageService {
	
	public String index(Model model);
	
	public Result cashOut(int cashOutId);
	
}
