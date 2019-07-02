package cn.xjwlfw.yeshenghuo.mapper;

import java.util.List;
import java.util.Map;

import cn.xjwlfw.yeshenghuo.model.WechatUser;

public interface WechatUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WechatUser record);

    int insertSelective(WechatUser record);

    WechatUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WechatUser record);

    int updateByPrimaryKey(WechatUser record);
    
    WechatUser selectByOpenId(String openId);
    
    int updateByOpenId(WechatUser record);
    
    List<WechatUser> selectCurrentWechatUser(Map<String, Object> param);
}