package cn.xjwlfw.yeshenghuo.service.corporation.functionManage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.mapper.DashangMapper;
import cn.xjwlfw.yeshenghuo.mapper.OwnScreenMapper;
import cn.xjwlfw.yeshenghuo.model.Dashang;
import cn.xjwlfw.yeshenghuo.model.OwnScreen;
import cn.xjwlfw.yeshenghuo.service.corporation.functionManage.WeishangqiangInfoService;
import cn.xjwlfw.yeshenghuo.system.base.Result;

@Service
public class WeishangqiangInfoServiceImpl implements WeishangqiangInfoService {

	@Autowired
	private OwnScreenMapper ownScreenDao;
	
	@Autowired
	private DashangMapper dashangDao;
	
	@Override
	public String index(Model model) {
		/*List<OwnScreen> ownScreenList = ownScreenDao.selectList();
		List<Dashang> dashangList = dashangDao.selectList();

		model.addAttribute("ownScreenList", ownScreenList);
		model.addAttribute("dashangList", dashangList);*/
		return "/corporation/functionManage/weishangqiangInfo";
	}

	@Override
	public Result ownScreenModify(OwnScreen ownScreen) {
		if (ownScreenDao.updateByPrimaryKeySelective(ownScreen) == 1) {
			return new Result(0);
		} else {
			return new Result(1, "修改失败！");
		}
	}

	@Override
	public Result dashangModify(Dashang dashang) {
		if (dashangDao.updateByPrimaryKeySelective(dashang) == 1) {
			return new Result(0);
		} else {
			return new Result(1, "修改失败！");
		}
	}

}
