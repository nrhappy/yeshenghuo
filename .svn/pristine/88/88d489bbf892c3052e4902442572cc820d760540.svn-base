package cn.xjwlfw.yeshenghuo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.xjwlfw.yeshenghuo.mapper.AddressMapper;
import cn.xjwlfw.yeshenghuo.model.Address;
import cn.xjwlfw.yeshenghuo.service.AddressService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressMapper addressDao;

	@Override
	public Result getProvince() {
		Result result = new Result();
		Map<String, Object> data = new HashMap<String, Object>();
		
		try {
			List<Address> provinceList = addressDao.selectProvinceList();
			data.put("provinceList", provinceList);
			
			result.setData(data);
			result.setCode(0);
			result.setMessage("信息获取成功！");
		} catch (Exception e) {
			result.setCode(1);
			result.setMessage("信息获取失败！");
		}
		
		return result;
	}

	@Override
	public Result getCityByProvinceCode(String provinceCode) {
		Result result = new Result();
		Map<String, Object> data = new HashMap<String, Object>();
		
		try {
			provinceCode = provinceCode.substring(0, 2);
			List<Address> cityList = addressDao.selectCityListByProvinceCode(provinceCode);
			data.put("cityList", cityList);
			
			result.setData(data);
			result.setCode(0);
			result.setMessage("信息获取成功！");
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(1);
			result.setMessage("信息获取失败！");
		}
		
		return result;
	}

	@Override
	public Result getDistrictByCityCode(String cityCode) {
		Result result = new Result();
		Map<String, Object> data = new HashMap<String, Object>();
		
		try {
			cityCode = cityCode.substring(0, 4) + "%";
			List<Address> districtList = addressDao.selectDistrictListByCityCode(cityCode);
			data.put("districtList", districtList);
			
			result.setData(data);
			result.setCode(0);
			result.setMessage("信息获取成功！");
		} catch (Exception e) {
			result.setCode(1);
			result.setMessage("信息获取失败！");
		}
		
		return result;
	}

}
