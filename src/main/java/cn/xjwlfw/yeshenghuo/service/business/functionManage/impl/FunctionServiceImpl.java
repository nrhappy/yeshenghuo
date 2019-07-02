package cn.xjwlfw.yeshenghuo.service.business.functionManage.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.xjwlfw.yeshenghuo.controller.business.functionManage.WeishangqiangManageController;
import cn.xjwlfw.yeshenghuo.mapper.BusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.BusinessQrcodeMapper;
import cn.xjwlfw.yeshenghuo.mapper.BusinessWeishangqiangMapper;
import cn.xjwlfw.yeshenghuo.mapper.DashangMapper;
import cn.xjwlfw.yeshenghuo.mapper.DashangTarMapper;
import cn.xjwlfw.yeshenghuo.mapper.OwnScreenMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserBusinessMapper;
import cn.xjwlfw.yeshenghuo.mapper.UserMapper;
import cn.xjwlfw.yeshenghuo.mapper.WechatUserMapper;
import cn.xjwlfw.yeshenghuo.mapper.WeishangqiangContentMapper;
import cn.xjwlfw.yeshenghuo.mapper.WeishangqiangMapper;
import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.BusinessQrcode;
import cn.xjwlfw.yeshenghuo.model.BusinessWeishangqiang;
import cn.xjwlfw.yeshenghuo.model.Dashang;
import cn.xjwlfw.yeshenghuo.model.DashangTar;
import cn.xjwlfw.yeshenghuo.model.OwnScreen;
import cn.xjwlfw.yeshenghuo.model.User;
import cn.xjwlfw.yeshenghuo.model.WeiShQContentShow;
import cn.xjwlfw.yeshenghuo.model.Weishangqiang;
import cn.xjwlfw.yeshenghuo.model.WeishangqiangContent;
import cn.xjwlfw.yeshenghuo.model.WeishangqiangContentResult;
import cn.xjwlfw.yeshenghuo.service.business.GetLoginInfoService;
import cn.xjwlfw.yeshenghuo.service.business.functionManage.FunctionService;
import cn.xjwlfw.yeshenghuo.service.business.functionManage.WechatService;
import cn.xjwlfw.yeshenghuo.system.base.Result;
import cn.xjwlfw.yeshenghuo.system.util.DateUtil;
import cn.xjwlfw.yeshenghuo.system.util.QrcodeUtil;

@Service
public class FunctionServiceImpl implements FunctionService {
	
	Logger logger = Logger.getLogger(WeishangqiangManageController.class);
	
	private static String qrcodeUrl = "http://www.yechengxu.cn/weixin.html?businessId=";
	
	private static String qrcodeSave = "/resource/qrcode/";
	
	private static String DEF_BG_URL = "/resource/img/default_wsq_bg.jpg";
	
	private static String DEF_ACCESS_ACOUNT = "0";
	
	private static String DEF_FONT_SIZE = "2";

	@Autowired
	private BusinessWeishangqiangMapper businessWeishangqiangMapper;
	
	@Autowired
	private WeishangqiangMapper weishangqiangMapper;
	
	@Autowired
	private GetLoginInfoService getLoginInfoService;

	@Autowired
	private UserMapper userDao;

	@Autowired
	private UserBusinessMapper userBusinessDao;

	@Autowired
	private BusinessMapper businessDao;
	
	@Autowired
	private WechatUserMapper wechatUserDao;
	
	@Autowired
	private WechatService wechatService;
	
	@Autowired
	private WeishangqiangContentMapper weishangqiangContentDao;
	
	@Autowired
	private OwnScreenMapper ownScreenDao;
	
	@Autowired
	private DashangMapper dashangDao;
	
	@Autowired
	private DashangTarMapper dashangTarDao;
	
	@Autowired
	private BusinessQrcodeMapper businessQrcodeMapper;
	
	@Override
	public void changeSetting(String mobile, Weishangqiang wei) {
		Business currentBusiness = getLoginInfoService.getBusinessByMobile(mobile);
		BusinessWeishangqiang relation = businessWeishangqiangMapper.selectByBusinessId(currentBusiness.getId());
		wei.setId(relation.getWeishangqiangId());
		weishangqiangMapper.updateByPrimaryKeySelective(wei);
	}

	@Override
	public Result openWShQ(HttpServletRequest request, String mobile) {
		Business currentBusiness = getLoginInfoService.getBusinessByMobile(mobile);
		int businessId = currentBusiness.getId();
		BusinessWeishangqiang bw = businessWeishangqiangMapper.selectByBusinessId(businessId);
		if (bw != null) {
			Result result = new Result(500, "已开通微上墙服务");
			return result;
		}
		Weishangqiang wei = new Weishangqiang();
		wei.setPause("0");
		wei.setTitle(currentBusiness.getName());
		wei.setLocation(currentBusiness.getAddrress());
		wei.setBigScreenUrl("/business/functionManage/weishangqiangManage/bigScreen?businessId=" + currentBusiness.getId());
		wei.setBgUrl(DEF_BG_URL);
		wei.setAccessAccount(DEF_ACCESS_ACOUNT);
		wei.setFontSize(DEF_FONT_SIZE);
		wei.setCreateTime(new Date());
//		String path = qrcodeSave + businessId + "_1" + ".JPG";
//		String filePath = request.getSession().getServletContext().getRealPath(path);
//		if (QrcodeUtil.encode(qrcodeUrl + currentBusiness.getId(), filePath)) {
//			wei.setQrcode(path);
//		}
		wei.setQrcode(this.getQrcodeUrl(currentBusiness.getId()));
		
		weishangqiangMapper.insertSelective(wei);
		
		bw = new BusinessWeishangqiang();
		bw.setBusinessId(currentBusiness.getId());
		bw.setWeishangqiangId(wei.getId());
		businessWeishangqiangMapper.insertSelective(bw);
		
		OwnScreen ownScreen;
		// 初始化 霸屏 - 10秒/￥8.00
		ownScreen = new OwnScreen();
		ownScreen.setWeishangqiangId(wei.getId());
		ownScreen.setName("10秒/￥8.00");
		ownScreen.setDuration((short) 10);
		ownScreen.setPrice(new BigDecimal("8"));
		ownScreenDao.insertSelective(ownScreen);
		// 初始化 霸屏 - 20秒/￥24.00
		ownScreen = new OwnScreen();
		ownScreen.setWeishangqiangId(wei.getId());
		ownScreen.setName("20秒/￥24.00");
		ownScreen.setDuration((short) 20);
		ownScreen.setPrice(new BigDecimal("24"));
		ownScreenDao.insertSelective(ownScreen);
		// 初始化 霸屏 - 30秒/￥40.00
		ownScreen = new OwnScreen();
		ownScreen.setWeishangqiangId(wei.getId());
		ownScreen.setName("30秒/￥40.00");
		ownScreen.setDuration((short) 30);
		ownScreen.setPrice(new BigDecimal("40"));
		ownScreenDao.insertSelective(ownScreen);
		// 初始化 霸屏 - 60秒/￥88.00
		ownScreen = new OwnScreen();
		ownScreen.setWeishangqiangId(wei.getId());
		ownScreen.setName("60秒/￥88.00");
		ownScreen.setDuration((short) 60);
		ownScreen.setPrice(new BigDecimal("88"));
		ownScreenDao.insertSelective(ownScreen);
		// 初始化 霸屏 - 521秒/￥150.00
		ownScreen = new OwnScreen();
		ownScreen.setWeishangqiangId(wei.getId());
		ownScreen.setName("521秒/￥150.00");
		ownScreen.setDuration((short) 521);
		ownScreen.setPrice(new BigDecimal("150"));
		ownScreenDao.insertSelective(ownScreen);
		// 初始化 霸屏 - 1314秒/￥220.00
		ownScreen = new OwnScreen();
		ownScreen.setWeishangqiangId(wei.getId());
		ownScreen.setName("1314秒/￥220.00");
		ownScreen.setDuration((short) 1314);
		ownScreen.setPrice(new BigDecimal("220"));
		ownScreenDao.insertSelective(ownScreen);
		// 初始化 霸屏 - 2017秒/￥300.00
		ownScreen = new OwnScreen();
		ownScreen.setWeishangqiangId(wei.getId());
		ownScreen.setName("2017秒/￥300.00");
		ownScreen.setDuration((short) 521);
		ownScreen.setPrice(new BigDecimal("300"));
		ownScreenDao.insertSelective(ownScreen);
		
		Dashang dashang;

		// 初始化 打赏 - 流星雨 ￥10.00
		dashang = new Dashang();
		dashang.setWeishangqiangId(wei.getId());
		dashang.setName("流星雨");
		dashang.setImg("/resource/img/dsIcon_battle.png");
		dashang.setVideo("/resource/video/ds_meteor.webm");
		dashang.setDuration((short) 20);
		dashang.setPrice(new BigDecimal("10"));
		dashangDao.insertSelective(dashang);
		// 初始化 打赏 - 金话筒 ￥20.00
		dashang = new Dashang();
		dashang.setWeishangqiangId(wei.getId());
		dashang.setName("金话筒");
		dashang.setImg("/resource/img/newDsIcon_mic.png");
		dashang.setVideo("/resource/video/ds_mic.webm");
		dashang.setDuration((short) 20);
		dashang.setPrice(new BigDecimal("20"));
		dashangDao.insertSelective(dashang);
		// 初始化 打赏 - 比基尼 ￥30.00
		dashang = new Dashang();
		dashang.setWeishangqiangId(wei.getId());
		dashang.setName("比基尼");
		dashang.setImg("/resource/img/newDsIcon_bigini.png");
		dashang.setVideo("/resource/video/ds_bigini.webm");
		dashang.setDuration((short) 20);
		dashang.setPrice(new BigDecimal("30"));
		dashangDao.insertSelective(dashang);
		// 初始化 打赏 - 玫瑰花海 ￥40.00
		dashang = new Dashang();
		dashang.setWeishangqiangId(wei.getId());
		dashang.setName("玫瑰花海");
		dashang.setImg("/resource/img/newDsIcon_flowers.png");
		dashang.setVideo("/resource/video/ds_flowers.webm");
		dashang.setDuration((short) 20);
		dashang.setPrice(new BigDecimal("40"));
		dashangDao.insertSelective(dashang);
		return Result.success();
	}

	@Override
	public Map<String, Object> getHomeData(String mobile) {
		Map<String, Object> map = new HashMap<>();
		Business currentBusiness = getLoginInfoService.getBusinessByMobile(mobile);
		BusinessWeishangqiang relation = businessWeishangqiangMapper.selectByBusinessId(currentBusiness.getId());
		if (relation == null) {
			map.put("opened", "0");
		} else {
			map.put("opened", "1");
			Weishangqiang wei = weishangqiangMapper.selectByPrimaryKey(relation.getWeishangqiangId());
			wei.setMobileURL("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb4718a4eac30e9cc&redirect_uri=http%3A%2F%2Fwww.yechengxu.cn%2Fcustomer%2Fweishangqiang%2FweixinIndex%3FbusinessId%3D" + currentBusiness.getId() + "&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect");
			map.put("info", wei);
		}
		return map;
	}

	@Override
	public String openBigScreen(Model model, int businessId) {		
		Business currentBusiness = businessDao.selectByPrimaryKey(businessId);
		Weishangqiang currentWeishangqiang = weishangqiangMapper.selectByPrimaryKey(businessWeishangqiangMapper.selectByBusinessId(currentBusiness.getId()).getWeishangqiangId());
		
		List<WeishangqiangContent> currentWeishangqiangContentList = weishangqiangContentDao.selectByWeishangqiangIdInOrderCreateTimeAsc(currentWeishangqiang.getId());
		List<WeishangqiangContentResult> currentWeishangqiangContentResultList = new ArrayList<WeishangqiangContentResult>();
		
		for (WeishangqiangContent weishangqiangContent : currentWeishangqiangContentList) {
			WeishangqiangContentResult weishangqiangContentResult = new WeishangqiangContentResult();
			weishangqiangContentResult.setId(weishangqiangContent.getId());
			weishangqiangContentResult.setWechatUser(wechatUserDao.selectByPrimaryKey(weishangqiangContent.getWechatUserId()));
			weishangqiangContentResult.setWeishangqiangId(weishangqiangContent.getWeishangqiangId());
			weishangqiangContentResult.setType(weishangqiangContent.getType());
			if (weishangqiangContent.getType() == 1) {
				weishangqiangContentResult.setOwnScreen(ownScreenDao.selectByPrimaryKey(weishangqiangContent.getOwnScreenId()));
				weishangqiangContentResult.setImgUrl(weishangqiangContent.getImgUrl());
			} else if (weishangqiangContent.getType() == 2) {
				Dashang dashang = dashangDao.selectByPrimaryKey(weishangqiangContent.getDashangId());
				DashangTar dashangTar = dashangTarDao.selectByPrimaryKey(weishangqiangContent.getDashangTarId());
				
				weishangqiangContentResult.setDashang(dashang);
				weishangqiangContentResult.setDashangTar(dashangTar);
			}
			weishangqiangContentResult.setContent(weishangqiangContent.getContent());
			weishangqiangContentResult.setCreateTime(new SimpleDateFormat("MM-dd HH:mm").format(weishangqiangContent.getCreateTime()));
			
			currentWeishangqiangContentResultList.add(weishangqiangContentResult);
		}

		model.addAttribute("timestamp", DateUtil.getCurrentTime());
		model.addAttribute("currentBusiness", currentBusiness);
		model.addAttribute("currentWeishangqiang", currentWeishangqiang);
		model.addAttribute("currentWeishangqiangContentResultList", currentWeishangqiangContentResultList);
		return "/business/functionManage/weishangqiangManage/bigScreen";
	}

	@Override
	public Result getContent(int businessId, String lastTime) {
		Business currentBusiness = businessDao.selectByPrimaryKey(businessId);
		Weishangqiang currentWeishangqiang = weishangqiangMapper.selectByPrimaryKey(businessWeishangqiangMapper.selectByBusinessId(currentBusiness.getId()).getWeishangqiangId());
		
		List<WeishangqiangContent> currentWeishangqiangContentList = weishangqiangContentDao.selectByWeishangqiangIdlastTimeInOrderCreateTimeDesc(currentWeishangqiang.getId(), lastTime);
		List<WeishangqiangContentResult> currentWeishangqiangContentResultList = new ArrayList<WeishangqiangContentResult>();
		
		for (WeishangqiangContent weishangqiangContent : currentWeishangqiangContentList) {
			WeishangqiangContentResult weishangqiangContentResult = new WeishangqiangContentResult();
			weishangqiangContentResult.setId(weishangqiangContent.getId());
			weishangqiangContentResult.setWechatUser(wechatUserDao.selectByPrimaryKey(weishangqiangContent.getWechatUserId()));
			weishangqiangContentResult.setWeishangqiangId(weishangqiangContent.getWeishangqiangId());
			weishangqiangContentResult.setType(weishangqiangContent.getType());
			if (weishangqiangContent.getType() == 1) {
				weishangqiangContentResult.setOwnScreen(ownScreenDao.selectByPrimaryKey(weishangqiangContent.getOwnScreenId()));
				weishangqiangContentResult.setImgUrl(weishangqiangContent.getImgUrl());
			} else if (weishangqiangContent.getType() == 2) {
				Dashang dashang = dashangDao.selectByPrimaryKey(weishangqiangContent.getDashangId());
				DashangTar dashangTar = dashangTarDao.selectByPrimaryKey(weishangqiangContent.getDashangTarId());
				
				weishangqiangContentResult.setDashang(dashang);
				weishangqiangContentResult.setDashangTar(dashangTar);
			}
			weishangqiangContentResult.setContent(weishangqiangContent.getContent());
			weishangqiangContentResult.setCreateTime(new SimpleDateFormat("MM-dd HH:mm").format(weishangqiangContent.getCreateTime()));
			
			currentWeishangqiangContentResultList.add(weishangqiangContentResult);
		}

		Result result = new Result();
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("currentWeishangqiang", currentWeishangqiang);
		data.put("currentWeishangqiangContentResultList", currentWeishangqiangContentResultList);
		result.setCode(0);
		result.setData(data);
		result.setMessage("数据获取成功！");
		result.setTimestamp(DateUtil.getCurrentTime());
		
		return result;
	}
	
	private String getQrcodeUrl(int businessId) {
		int maxSceneId = 1;
		String maxSceneIdStr = businessQrcodeMapper.queryMaxSceneId();
		if (maxSceneIdStr != null) {
			maxSceneId = Integer.parseInt(maxSceneIdStr) + 1;
		}
		insertBusinessQrCode(businessId, maxSceneId);
		String scene_id = maxSceneId + "";
		String accessToken = wechatService.getAccessToken();
		String ticket = wechatService.createTicket(accessToken, scene_id);
		return "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + ticket;
	}

	private void insertBusinessQrCode(int businessId, int sceneId) {
		BusinessQrcode bq = new BusinessQrcode();
		bq.setBusinessId(businessId);
		bq.setSceneId(sceneId);
		businessQrcodeMapper.insert(bq);
	}

	private String getPic(HttpServletRequest request, String bussinessId) {
		String path = qrcodeSave + bussinessId + "_1" + ".JPG";
		String filePath = request.getSession().getServletContext().getRealPath(path);
		QrcodeUtil.encode(qrcodeUrl + bussinessId, filePath);
		return path;
	}

	@Override
	public List<WeiShQContentShow> getContentList(String mobile) {
		Business currentBusiness = getLoginInfoService.getBusinessByMobile(mobile);
		BusinessWeishangqiang relation = businessWeishangqiangMapper.selectByBusinessId(currentBusiness.getId());
		return weishangqiangContentDao.getContentListByWeishangqiangId(relation.getWeishangqiangId());
	}

	@Override
	public void deleteContent(List<String> array) {
		for (String idStr : array) {
			int id = Integer.parseInt(idStr);
			weishangqiangContentDao.deleteByPrimaryKey(id);
		}
	}

	@Override
	public Result ownScreenList() {
		User currentUser = userDao.selectByMobile((String) SecurityUtils.getSubject().getPrincipal());
		Business currentBusiness = businessDao.selectByPrimaryKey(userBusinessDao.selectByUserId(currentUser.getId()).getBusinessId());
		Weishangqiang currentWeishangqiang = weishangqiangMapper.selectByPrimaryKey(businessWeishangqiangMapper.selectByBusinessId(currentBusiness.getId()).getWeishangqiangId());
		
		List<OwnScreen> ownScreenList = ownScreenDao.selectListByWeishangqiangId(currentWeishangqiang.getId());
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("ownScreenList", ownScreenList);
		
		return new Result(0, data);
	}

	@Override
	public Result dashangList() {
		User currentUser = userDao.selectByMobile((String) SecurityUtils.getSubject().getPrincipal());
		Business currentBusiness = businessDao.selectByPrimaryKey(userBusinessDao.selectByUserId(currentUser.getId()).getBusinessId());
		Weishangqiang currentWeishangqiang = weishangqiangMapper.selectByPrimaryKey(businessWeishangqiangMapper.selectByBusinessId(currentBusiness.getId()).getWeishangqiangId());
		
		List<Dashang> dashangList = dashangDao.selectListByWeishangqiangId(currentWeishangqiang.getId());
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("dashangList", dashangList);
		
		return new Result(0, data);
	}

	@Override
	public Result ownScreenSet(OwnScreen ownScreen) {
		if (ownScreenDao.updateByPrimaryKeySelective(ownScreen) == 1) {
			return new Result(0, "信息修改成功！");
		} else {
			return new Result(1, "信息修改失败！");
		}
	}

	@Override
	public Result dashangSet(Dashang dashang) {
		if (dashangDao.updateByPrimaryKeySelective(dashang) == 1) {
			return new Result(0, "信息修改成功！");
		} else {
			return new Result(1, "信息修改失败！");
		}
	}

}
