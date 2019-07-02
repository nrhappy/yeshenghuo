package cn.xjwlfw.yeshenghuo.service.business.customerManage;

import java.util.List;

import cn.xjwlfw.yeshenghuo.model.WechatUser;

public interface WechatUserService {

	/**
	 * 查询列表
	 * @param mobile
	 * @param name
	 * @return
	 * @author niurui
	 * @since 2017年4月18日
	 */
	public List<WechatUser> getCurrentWechatUserList(String mobile, String name);
	
	/**
	 * 修改备注
	 * @param id
	 * @param notes
	 * @author niurui
	 * @since 2017年4月18日
	 */
	public void updateNotes(Integer id, String notes, String role, Integer times);
}
