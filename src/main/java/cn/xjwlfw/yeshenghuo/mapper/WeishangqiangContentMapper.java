package cn.xjwlfw.yeshenghuo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.xjwlfw.yeshenghuo.model.WeiShQContentShow;
import cn.xjwlfw.yeshenghuo.model.WeishangqiangContent;

public interface WeishangqiangContentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WeishangqiangContent record);

    int insertSelective(WeishangqiangContent record);

    WeishangqiangContent selectByPrimaryKey(Integer id);

    List<WeishangqiangContent> selectByWeishangqiangIdInOrderCreateTimeAsc(Integer weishangqiangId);
    
    List<WeishangqiangContent> selectByWeishangqiangIdlastTimeInOrderCreateTimeDesc(@Param(value = "weishangqiangId") Integer weishangqiangId, @Param(value = "lastTime") String lastTime);

    int updateByPrimaryKeySelective(WeishangqiangContent record);

    int updateByPrimaryKey(WeishangqiangContent record);
    
    List<WeiShQContentShow> getContentListByWeishangqiangId(Integer weishangqiangId);
}