package cn.xjwlfw.yeshenghuo.service.corporation.functionManage;

import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.model.Dashang;
import cn.xjwlfw.yeshenghuo.model.OwnScreen;
import cn.xjwlfw.yeshenghuo.system.base.Result;

public interface WeishangqiangInfoService {
	
	public String index(Model model);

	public Result ownScreenModify(OwnScreen ownScreen);
	
	public Result dashangModify(Dashang dashang);

}
