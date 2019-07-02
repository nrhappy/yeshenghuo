package cn.xjwlfw.yeshenghuo.service.business.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserBusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.service.business.GetLoginInfoService;

@Service
public class GetLoginInfoServiceImpl implements GetLoginInfoService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BusinessMapper businessMapper;
	
	@Autowired
	private UserBusinessMapper userBusinessMapper;
	
	@Override
	public User getUserByMobile(String mobile) {
		return userMapper.selectByMobile(mobile);
	}

	@Override
	public Business getBusinessByMobile(String mobile) {
		User currentUser = this.getUserByMobile(mobile);
		return businessMapper.selectByPrimaryKey(userBusinessMapper.selectByUserId(currentUser.getId()).getBusinessId());
	}

}
