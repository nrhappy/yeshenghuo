package cn.xjwlfw.yeshenghuo.service.business.accountManage;

import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.system.base.Result;

public interface AccountInfoService {
	
	public String index(Model model);
	
	public Result setLogo(String logo);
	
	public Result setName(String name);
	
	public Result setTel(String tel);
	
	public Result setAddress(String provinceCode, String cityCode, String districtCode);
	
	public Result setSummary(String summary);

}
