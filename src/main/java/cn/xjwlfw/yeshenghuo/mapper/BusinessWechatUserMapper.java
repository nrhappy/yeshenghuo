package cn.xjwlfw.yeshenghuo.mapper;

import cn.xjwlfw.yeshenghuo.model.BusinessWechatUser;

public interface BusinessWechatUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(BusinessWechatUser record);

    BusinessWechatUser selectByBusinessId(BusinessWechatUser record);

    int updateByPrimaryKeySelective(BusinessWechatUser record);
}