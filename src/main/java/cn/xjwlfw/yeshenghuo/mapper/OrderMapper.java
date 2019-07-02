package cn.xjwlfw.yeshenghuo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.xjwlfw.yeshenghuo.model.Order;
import cn.xjwlfw.yeshenghuo.model.RevenueCount;

public interface OrderMapper {
    int deleteByPrimaryKey(String id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String id);

    List<Order> selectList();
    
    List<RevenueCount> selectRevenueCountList(@Param(value = "nears") Integer nears);
    
    List<RevenueCount> selectBusinessRevenueCountList(@Param(value = "nears") Integer nears, @Param(value = "businessId") Integer businessId);
    
    List<RevenueCount> selectAgencyRevenueCountList(@Param(value = "nears") Integer nears, @Param(value = "agencyId") Integer agencyId);

    List<Order> selectListByBusiness(Order record);

    List<Order> selectListByAgency(Order record);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}