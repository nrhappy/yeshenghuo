package cn.xjwlfw.yeshenghuo.service.agency.businessManage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.AgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.CashOutMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserAgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Agency;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.CashOut;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserAgency;
import cn.xjwlfw.yeshenghuo.service.agency.businessManage.BusInfoService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class BusInfoServiceImpl implements BusInfoService {

	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private AgencyMapper agencyDao;
	
	@Autowired
	private UserAgencyMapper userAgencyDao;

	@Autowired
	private BusinessMapper businessDao;

	@Autowired
	private CashOutMapper cashOutDao;
	
	@Override
	public String index(String businessName, Model model) {
		String mobile = (String) SecurityUtils.getSubject().getPrincipal();
		// 获取当前用户对象
		User currentUser = userDao.selectByMobile(mobile);
		// 获取当前用户代理关系对象
		UserAgency userAgency = userAgencyDao.selectByUserId(currentUser.getId());
		// 获取当前代理对象
		Agency currentAgency = agencyDao.selectByPrimaryKey(userAgency.getAgencyId());

		List<Business> businessList = businessDao.selectListByAgencyId(currentAgency.getId(), businessName);
		model.addAttribute("businessList", businessList);
		return "/agency/businessManage/businessInfo";
	}

	@Override
	public Result updateNotes(int businessId, String notes, Model model) {
		Business business = businessDao.selectByPrimaryKey(businessId);
		business.setNotes(notes);
		if (businessDao.updateByPrimaryKeySelective(business) == 1) {
			return new Result(0, "备注修改成功！");
		} else {
			return new Result(1, "备注修改失败！");
		}
	}
	
	@Override
	public Result cashOutList(int businessId, Model model) {
		CashOut cashOut = new CashOut();
		cashOut.setBusinessId(businessId);
		cashOut.setStatus((byte) 1);
		List<CashOut> cashOutList = cashOutDao.selectList(cashOut);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("cashOutList", cashOutList);
		
		return new Result(0, data);
	}

}
