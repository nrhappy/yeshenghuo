package cn.xjwlfw.yeshenghuo.mapper;

import java.util.List;

import cn.xjwlfw.yeshenghuo.model.Address;

public interface AddressMapper {
	
	Address selectByCode(Integer code);
	
    List<Address> selectProvinceList();
	
    List<Address> selectCityListByProvinceCode(String provinceCode);
	
    List<Address> selectDistrictListByCityCode(String cityCode);
    
}