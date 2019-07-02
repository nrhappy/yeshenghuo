package cn.xjwlfw.yeshenghuo.service.corporation.businessManage;

import java.math.BigDecimal;

import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.system.base.Result;

public interface BusinessInfoService {
	
	public String index(Model model);

	public String search(String businessName, Model model);
	
	public Result update(Business business, Model model);

	public Result cashOut(int id, BigDecimal amount, Model model);

}
