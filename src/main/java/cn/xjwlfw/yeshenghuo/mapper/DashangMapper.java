package cn.xjwlfw.yeshenghuo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.xjwlfw.yeshenghuo.model.Dashang;

public interface DashangMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dashang record);

    int insertSelective(Dashang record);

    Dashang selectByPrimaryKey(Integer id);

    List<Dashang> selectListByWeishangqiangId(@Param(value = "weishangqiangId") Integer weishangqiangId);

    int updateByPrimaryKeySelective(Dashang record);

    int updateByPrimaryKey(Dashang record);
}