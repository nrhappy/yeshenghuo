package cn.xjwlfw.yeshenghuo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xjwlfw.yeshenghuo.mapper.BusinessQrcodeMapper;
import cn.xjwlfw.yeshenghuo.model.BusinessQrcode;
import cn.xjwlfw.yeshenghuo.service.BusinessQrcodeService;

@Service
public class BusinessQrcodeServiceImpl implements BusinessQrcodeService {

	@Autowired
	private BusinessQrcodeMapper businessQrcodeMapper;
	
	@Override
	public BusinessQrcode queryBySceneId(String sceneId) {
		return businessQrcodeMapper.selectByPrimarySceneId(Integer.parseInt(sceneId));
	}

}
