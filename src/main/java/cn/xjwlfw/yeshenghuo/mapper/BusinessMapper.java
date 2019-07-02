package cn.xjwlfw.yeshenghuo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.xjwlfw.yeshenghuo.model.Business;

public interface BusinessMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Business record);

    int insertSelective(Business record);

    Business selectByPrimaryKey(Integer id);
    
    Business selectByName(String name);
    
    List<Business> selectList(Business record);
    
    List<Business> selectListByAgencyId(@Param(value = "agencyId") Integer agencyId, @Param(value = "name") String name);
    
    List<Business> selectListBeforeBinded();

    int updateByPrimaryKeySelective(Business record);

    int updateByPrimaryKey(Business record);
}