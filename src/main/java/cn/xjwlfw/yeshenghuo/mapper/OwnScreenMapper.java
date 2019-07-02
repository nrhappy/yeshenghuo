package cn.xjwlfw.yeshenghuo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.xjwlfw.yeshenghuo.model.OwnScreen;

public interface OwnScreenMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OwnScreen record);

    int insertSelective(OwnScreen record);

    OwnScreen selectByPrimaryKey(Integer id);
    
    List<OwnScreen> selectListByWeishangqiangId(@Param(value = "weishangqiangId") int weishangqiangId);

    int updateByPrimaryKeySelective(OwnScreen record);

    int updateByPrimaryKey(OwnScreen record);
}