package cn.xjwlfw.yeshenghuo.mapper;

import java.util.List;

import cn.xjwlfw.yeshenghuo.model.CashOut;

public interface CashOutMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CashOut record);

    int insertSelective(CashOut record);

    CashOut selectByPrimaryKey(Integer id);

    CashOut selectUndeliveryByBusinessId(Integer businessId);

    CashOut selectUndeliveryByAgencyId(Integer agencyId);

    List<CashOut> selectList(CashOut record);

    int updateByPrimaryKeySelective(CashOut record);

    int updateByPrimaryKey(CashOut record);
}