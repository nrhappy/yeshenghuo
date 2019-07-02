package cn.xjwlfw.yeshenghuo.mapper;

import cn.xjwlfw.yeshenghuo.model.Weishangqiang;

public interface WeishangqiangMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Weishangqiang record);

    int insertSelective(Weishangqiang record);

    Weishangqiang selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Weishangqiang record);

    int updateByPrimaryKey(Weishangqiang record);
}