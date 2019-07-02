package cn.xjwlfw.yeshenghuo.service.agency.businessManage;

import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.model.Order;
import cn.xjwlfw.yeshenghuo.system.base.Result;

public interface BusFinanceService {

	public Result index(int businessId, Model model);

}
