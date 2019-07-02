package cn.xjwlfw.yeshenghuo.service.business.customerManage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xjwlfw.yeshenghuo.mapper.BusinessWechatUserMapper;
import cn.xjwlfw.yeshenghuo.mapper.WechatUserMapper;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.BusinessWechatUser;
import cn.xjwlfw.yeshenghuo.model.WechatUser;
import cn.xjwlfw.yeshenghuo.service.business.GetLoginInfoService;
import cn.xjwlfw.yeshenghuo.service.business.customerManage.WechatUserService;

@Service
public class WechatUserServiceImpl implements WechatUserService {

	@Autowired
	private WechatUserMapper wechatUserMapper;
	
	@Autowired
	private BusinessWechatUserMapper businessWechatUserMapper;
	
	@Autowired
	private GetLoginInfoService getLoginInfoService;
	
	@Override
	public List<WechatUser> getCurrentWechatUserList(String mobile, String name) {
		Business currentBusiness = getLoginInfoService.getBusinessByMobile(mobile);
		Map<String, Object> map = new HashMap<>();
		map.put("businessId", currentBusiness.getId());
		map.put("name", name);
		List<WechatUser> list = wechatUserMapper.selectCurrentWechatUser(map);
		return list;
	}

	@Override
	public void updateNotes(Integer id, String notes, String role, Integer times) {
		BusinessWechatUser user = new BusinessWechatUser();
		user.setId(id);
		user.setRole(role);
		user.setNotes(notes);
		user.setOwnScreenCount(times);
		businessWechatUserMapper.updateByPrimaryKeySelective(user);
	}

}
