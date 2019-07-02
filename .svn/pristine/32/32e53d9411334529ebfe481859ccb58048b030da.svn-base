package cn.xjwlfw.yeshenghuo.service.corporation.agencyManage.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.AgencyBusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.AgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.CashOutMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserAgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.model.Agency;
import cn.xjwlfw.yeshenghuo.model.AgencyBusiness;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.CashOut;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.UserAgency;
import cn.xjwlfw.yeshenghuo.service.corporation.agencyManage.AgencyInfoService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class AgencyInfoServiceImpl implements AgencyInfoService {

	@Autowired
	private UserMapper userDao;
	
	@Autowired
	private AgencyMapper agencyDao;
	
	@Autowired
	private UserAgencyMapper userAgencyDao;

	@Autowired
	private CashOutMapper cashOutDao;

	@Autowired
	private BusinessMapper businessDao;
	
	@Autowired
	private AgencyBusinessMapper agencyBusinessDao;
	
	@Override
	public String index(Model model, String agencyName) {
		Agency agency = new Agency();
		agency.setName(agencyName);
		List<Agency> agencyList = agencyDao.selectList(agency);
		model.addAttribute("agencyList", agencyList);
		return "/corporation/agencyManage/agencyInfo";
	}

	@Override
	public Result update(Agency agency, Model model) {
		if (agencyDao.updateByPrimaryKeySelective(agency) == 1) {
			return new Result(0, "信息修改成功！");
		} else {
			return new Result(1, "信息修改成功！");
		}
	}

	@Override
	public Result add(User user, Agency agency, Model model) {
		user.setPassword("123456");
		agency.setBalance(new BigDecimal("0"));
		
		if (userDao.insertSelective(user) == 1) {
			agencyDao.insertSelective(agency);
			
			UserAgency userAgency = new UserAgency();
			userAgency.setUserId(user.getId());
			userAgency.setAgencyId(agency.getId());
			
			userAgencyDao.insertSelective(userAgency);
		} else {
			return new Result(1, "代理用户创建失败，请重新尝试！");
		}
		
		
		return new Result(0, "信息添加成功！");
	}

	@Override
	public Result cashOut(int id, BigDecimal amount, Model model) {
		Agency agency = agencyDao.selectByPrimaryKey(id);
		
		if (agency.getBalance().compareTo(amount) == -1) {
			return new Result(1, "余额不足，操作失败！");
		}
		
		agency.setBalance(agency.getBalance().subtract(amount));
		
		CashOut cashOut = new CashOut();
		cashOut.setAgencyId(agency.getId());
		cashOut.setAmount(amount);
		cashOut.setType((byte) 1);
		cashOut.setCreateTime(new Date());
		cashOut.setUpdateTime(new Date());
		cashOut.setStatus((byte) 1);
		
		if (agencyDao.updateByPrimaryKeySelective(agency) == 1 && cashOutDao.insertSelective(cashOut) == 1) {
			return new Result(0, "信息修改成功！");
		} else {
			return new Result(1, "信息修改失败！");
		}
	}

	@Override
	public Result businessList() {
		Map<String, Object> data = new HashMap<String, Object>();
		List<Business> businessList = businessDao.selectListBeforeBinded();
		data.put("businessList", businessList);
		return new Result(0, data);
	}

	@Override
	public Result bind(int bindId, int businessId) {
		AgencyBusiness agencyBusiness = new AgencyBusiness();
		agencyBusiness.setAgencyId(bindId);
		agencyBusiness.setBusinessId(businessId);
		if (agencyBusinessDao.insertSelective(agencyBusiness) == 1) {
			return new Result(0, "绑定成功！");
		} else {
			return new Result(1, "绑定失败！");
		}
	}

}
