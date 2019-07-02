package cn.xjwlfw.yeshenghuo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.xjwlfw.yeshenghuo.service.AddressService;
import cn.xjwlfw.yeshenghuo.system.base.BaseController;
import cn.xjwlfw.yeshenghuo.system.base.Result;

/**
 * 地址
 */
@RestController
@RequestMapping(value = "/address")
public class AddressController extends BaseController {
	
	@Autowired
	private AddressService addressService;	
	
	/**
	 * 获取省份信息
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/province")
	public Result getProvince() { return addressService.getProvince(); }
	
	/**
	 * 获取地市信息
	 * 
	 * @param provinceCode 省份编码
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/city")
	public Result getCityByProvinceCode(@RequestParam(value = "provinceCode", required = true) String provinceCode) { return addressService.getCityByProvinceCode(provinceCode); }
	
	/**
	 * 获取区县信息
	 * 
	 * @param cityCode 地市编码
	 * 
	 * @author liyijun
	 * @since 2017年3月18日
	 */
	@RequestMapping(value = "/district")
	public Result getDistrictByCityCode(@RequestParam(value = "cityCode", required = true) String cityCode) { return addressService.getDistrictByCityCode(cityCode); }

}
