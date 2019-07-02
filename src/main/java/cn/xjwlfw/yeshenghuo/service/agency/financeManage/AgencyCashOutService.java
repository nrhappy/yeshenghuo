package cn.xjwlfw.yeshenghuo.service.agency.financeManage;

import java.math.BigDecimal;

import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.model.Agency;
import cn.xjwlfw.yeshenghuo.system.base.Result;

public interface AgencyCashOutService {

	public String index(Model model);

	public Result cashOut(BigDecimal amount);

	public Result cashOutSet(Agency agency);

}
