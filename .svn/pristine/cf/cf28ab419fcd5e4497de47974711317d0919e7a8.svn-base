package cn.xjwlfw.yeshenghuo.service.business.accountManage.impl;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.AddressMapper;
import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserBusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Address;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.service.business.accountManage.AccountInfoService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class AccountInfoServiceImpl implements AccountInfoService {

	@Autowired
	private UserMapper userDao;

	@Autowired
	private UserBusinessMapper userBusinessDao;

	@Autowired
	private BusinessMapper businessDao;

	@Autowired
	private AddressMapper addressDao;

	@Override
	public String index(Model model) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		
		// 获取当前用户对象
		User currentUser = userDao.selectByMobile(mobile);
		
		// 获取当前商家对象
		Business currentBusiness = businessDao.selectByPrimaryKey(userBusinessDao.selectByUserId(currentUser.getId()).getBusinessId());
		
		model.addAttribute("currentUser", currentUser);
		model.addAttribute("currentBusiness", currentBusiness);
		
		return "/business/accountManage/accountInfo";
	}

	@Override
	public Result setLogo(String logo) {
		try {
			if (logo.length() < 1) {
				return new Result(1);
			} else {
				String mobile = (String) SecurityUtils.getSubject().getPrincipal();
				
				// 获取当前用户对象
				User currentUser = userDao.selectByMobile(mobile);
				
				// 获取当前商家对象
				Business currentBusiness = businessDao.selectByPrimaryKey(userBusinessDao.selectByUserId(currentUser.getId()).getBusinessId());
				
				currentBusiness.setLogo(logo);
				
				if (businessDao.updateByPrimaryKeySelective(currentBusiness) == 1) {
					return new Result(0);
				} else {
					return new Result(1);
				}
			}

		} catch (Exception e) {
			return new Result(1);
		}
	}

	@Override
	public Result setName(String name) {
		if (name.length() < 1) {
			return new Result(1, "商家名称不能为空");
		} else {
			try {
				String mobile = (String) SecurityUtils.getSubject().getPrincipal();
				
				// 获取当前用户对象
				User currentUser = userDao.selectByMobile(mobile);
				
				// 获取当前商家对象
				Business currentBusiness = businessDao.selectByPrimaryKey(userBusinessDao.selectByUserId(currentUser.getId()).getBusinessId());
				
				currentBusiness.setName(name);
				
				if (businessDao.updateByPrimaryKeySelective(currentBusiness) == 1) {
					return new Result(0);
				} else {
					return new Result(1);
				}

			} catch (Exception e) {
				return new Result(1);
			}
		}
	}

	@Override
	public Result setTel(String tel) {
		if (tel.length() < 1) {
			return new Result(1, "商家电话不能为空！");
		} else {
			try {
				String mobile = (String) SecurityUtils.getSubject().getPrincipal();
				
				// 获取当前用户对象
				User currentUser = userDao.selectByMobile(mobile);
				
				// 获取当前商家对象
				Business currentBusiness = businessDao.selectByPrimaryKey(userBusinessDao.selectByUserId(currentUser.getId()).getBusinessId());
				
				currentBusiness.setTel(tel);
				
				if (businessDao.updateByPrimaryKeySelective(currentBusiness) == 1) {
					return new Result(0);
				} else {
					return new Result(1);
				}

			} catch (Exception e) {
				return new Result(1);
			}
		}
	}

	@Override
	public Result setAddress(String provinceCode, String cityCode, String districtCode) {
		if (provinceCode.length() < 1) {
			return new Result(1, "省份代码不能为空！");
		} else if (cityCode.length() < 1) {
			return new Result(1, "地市代码不能为空！");
		} else if (districtCode.length() < 1) {
			return new Result(1, "区县代码不能为空！");
		} else {
			try {
				String mobile = (String) SecurityUtils.getSubject().getPrincipal();
				
				// 获取当前用户对象
				User currentUser = userDao.selectByMobile(mobile);
				
				// 获取当前商家对象
				Business currentBusiness = businessDao.selectByPrimaryKey(userBusinessDao.selectByUserId(currentUser.getId()).getBusinessId());
				
				Address province = addressDao.selectByCode(Integer.valueOf(provinceCode));
				Address city = addressDao.selectByCode(Integer.valueOf(cityCode));
				Address district = addressDao.selectByCode(Integer.valueOf(districtCode));
				
				currentBusiness.setAddrress(province.getName() + city.getName() + district.getName());
				
				if (businessDao.updateByPrimaryKeySelective(currentBusiness) == 1) {
					return new Result(0);
				} else {
					return new Result(1);
				}

			} catch (Exception e) {
				return new Result(1);
			}
		}
	}

	@Override
	public Result setSummary(String summary) {
		if (summary.length() < 1) {
			return new Result(1, "商家简介不能为空！");
		} else {
			try {
				String mobile = (String) SecurityUtils.getSubject().getPrincipal();
				
				// 获取当前用户对象
				User currentUser = userDao.selectByMobile(mobile);
				
				// 获取当前商家对象
				Business currentBusiness = businessDao.selectByPrimaryKey(userBusinessDao.selectByUserId(currentUser.getId()).getBusinessId());
				
				currentBusiness.setSummary(summary);
				
				if (businessDao.updateByPrimaryKeySelective(currentBusiness) == 1) {
					return new Result(0);
				} else {
					return new Result(1);
				}

			} catch (Exception e) {
				return new Result(1);
			}
		}
	}

}
