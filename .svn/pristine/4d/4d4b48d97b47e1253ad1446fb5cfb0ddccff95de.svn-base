package cn.xjwlfw.yeshenghuo.service.corporation.financeManage.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.AgencyMapper;
import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.CashOutMapper;
import cn.xjwlfw.yeshenghuo.mapper.CorporationMapper;
import cn.xjwlfw.yeshenghuo.model.Agency;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.CashOut;
import cn.xjwlfw.yeshenghuo.model.Corporation;
import cn.xjwlfw.yeshenghuo.service.corporation.financeManage.CashOutManageService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class CashOutManageServiceImpl implements CashOutManageService {
	
	@Autowired
	private CashOutMapper cashOutDao;
	
	@Autowired
	private BusinessMapper businessDao;
	
	@Autowired
	private AgencyMapper agencyDao;
	
	@Autowired
	private CorporationMapper corporationDao;
	
	@Override
	public String index(Model model) {
		CashOut cashOut = new CashOut();
		
		cashOut.setStatus((byte) 0);
		List<CashOut> cashOutBeforeList = cashOutDao.selectList(cashOut);

		cashOut.setStatus((byte) 1);
		List<CashOut> cashOutAfterList = cashOutDao.selectList(cashOut);

		model.addAttribute("cashOutBeforeList", cashOutBeforeList);
		model.addAttribute("cashOutAfterList", cashOutAfterList);
		return "/corporation/financeManage/cashOutManage";
	}

	@Override
	public Result cashOut(int cashOutId) {
		CashOut cashOut = cashOutDao.selectByPrimaryKey(cashOutId);
		Corporation corporation = corporationDao.get();
		if (cashOut.getType() == 0) {
			Business business = businessDao.selectByPrimaryKey(cashOut.getBusinessId());
			business.setBalance(business.getBalance().subtract(cashOut.getAmount()));
			if (business.getBalance().compareTo(new BigDecimal("0")) == -1) {
				return new Result(1, "商家当前余额不足！");
			}
			if (businessDao.updateByPrimaryKeySelective(business) == 1) {
				cashOut.setStatus((byte) 1);
				cashOut.setUpdateTime(new Date());
				cashOutDao.updateByPrimaryKey(cashOut);
				return new Result(0);
			} else {
				return new Result(1, "商家提现出错！");
			}
		} else if (cashOut.getType() == 1) {
			Agency agency = agencyDao.selectByPrimaryKey(cashOut.getAgencyId());
			agency.setBalance(agency.getBalance().subtract(cashOut.getAmount()));
			if (agency.getBalance().compareTo(new BigDecimal("0")) == -1) {
				return new Result(1, "代理当前余额不足，提现失败！");
			}
			if (agencyDao.updateByPrimaryKeySelective(agency) == 1) {
				cashOut.setStatus((byte) 1);
				cashOut.setUpdateTime(new Date());
				cashOutDao.updateByPrimaryKey(cashOut);
				return new Result(0);
			} else {
				return new Result(1, "代理提现出错！");
			}	
		} else {
			return new Result(0, "受理出错！");
		}
	}

}
