package cn.xjwlfw.yeshenghuo.mapper;

import cn.xjwlfw.yeshenghuo.model.AgencyBusiness;

public interface AgencyBusinessMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AgencyBusiness record);

    int insertSelective(AgencyBusiness record);

    AgencyBusiness selectByPrimaryKey(Integer id);

    AgencyBusiness selectByBusinessId(Integer businesId);

    int updateByPrimaryKeySelective(AgencyBusiness record);

    int updateByPrimaryKey(AgencyBusiness record);
}