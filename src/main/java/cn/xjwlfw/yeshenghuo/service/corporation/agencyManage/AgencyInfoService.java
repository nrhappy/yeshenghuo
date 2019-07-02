package cn.xjwlfw.yeshenghuo.service.corporation.agencyManage;

import java.math.BigDecimal;

import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.model.Agency;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.system.base.Result;

public interface AgencyInfoService {
	
	public String index(Model model, String agencyName);

	public Result update(Agency agency, Model model);

	public Result add(User user, Agency agency, Model model);

	public Result cashOut(int id, BigDecimal amount, Model model);

	public Result businessList();

	public Result bind(int bindId, int businessId);

}
