package cn.xjwlfw.yeshenghuo.mapper;

import cn.xjwlfw.yeshenghuo.model.UserBusiness;

public interface UserBusinessMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserBusiness record);

    int insertSelective(UserBusiness record);

    UserBusiness selectByPrimaryKey(Integer id);

    UserBusiness selectByUserId(Integer userId);

    int updateByPrimaryKeySelective(UserBusiness record);

    int updateByPrimaryKey(UserBusiness record);
}