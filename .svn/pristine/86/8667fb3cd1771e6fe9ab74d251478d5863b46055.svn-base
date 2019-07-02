package cn.xjwlfw.yeshenghuo.service.corporation.businessManage.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.CashOutMapper;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.CashOut;
import cn.xjwlfw.yeshenghuo.service.corporation.businessManage.BusinessInfoService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class BusinessInfoServiceImpl implements BusinessInfoService {

	@Autowired
	private BusinessMapper businessDao;
	
	@Autowired
	private CashOutMapper cashOutDao;
	
	@Override
	public String index(Model model) {
		List<Business> businessList = businessDao.selectList(new Business());
		model.addAttribute("businessList", businessList);
		return "/corporation/businessManage/businessInfo";
	}

	@Override
	public String search(String businessName, Model model) {
		Business business = new Business();
		business.setName(businessName);
		List<Business> businessList = businessDao.selectList(business);
		model.addAttribute("businessList", businessList);
		return "/corporation/businessManage/businessInfo";
	}

	@Override
	public Result update(Business business, Model model) {
		if (businessDao.updateByPrimaryKeySelective(business) == 1) {
			return new Result(0, "信息修改成功！");
		} else {
			return new Result(1, "信息修改失败！");
		}
	}

	@Override
	public Result cashOut(int id, BigDecimal amount, Model model) {
		Business business = businessDao.selectByPrimaryKey(id);
		
		if (business.getBalance().compareTo(amount) == -1) {
			return new Result(1, "余额不足，操作失败！");
		}
		
		business.setBalance(business.getBalance().subtract(amount));
		
		CashOut cashOut = new CashOut();
		cashOut.setBusinessId(business.getId());
		cashOut.setAmount(amount);
		cashOut.setType((byte) 0);
		cashOut.setCreateTime(new Date());
		cashOut.setUpdateTime(new Date());
		cashOut.setStatus((byte) 1);
		
		if (businessDao.updateByPrimaryKeySelective(business) == 1 && cashOutDao.insertSelective(cashOut) == 1) {
			return new Result(0, "信息修改成功！");
		} else {
			return new Result(1, "信息修改失败！");
		}
	}

}
