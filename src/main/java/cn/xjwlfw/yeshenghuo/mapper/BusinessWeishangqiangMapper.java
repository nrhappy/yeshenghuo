package cn.xjwlfw.yeshenghuo.mapper;

import cn.xjwlfw.yeshenghuo.model.BusinessWeishangqiang;

public interface BusinessWeishangqiangMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BusinessWeishangqiang record);

    int insertSelective(BusinessWeishangqiang record);

    BusinessWeishangqiang selectByPrimaryKey(Integer id);
    
    BusinessWeishangqiang selectByBusinessId(Integer id);

    int updateByPrimaryKeySelective(BusinessWeishangqiang record);

    int updateByPrimaryKey(BusinessWeishangqiang record);
}