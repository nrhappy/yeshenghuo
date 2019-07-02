package cn.xjwlfw.yeshenghuo.controller.business.functionManage;

import java.io.IOException;
import java.io.InputStream;
import java.security.DigestException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.xjwlfw.yeshenghuo.model.Business;
import cn.xjwlfw.yeshenghuo.model.BusinessQrcode;
import cn.xjwlfw.yeshenghuo.service.BusinessQrcodeService;
import cn.xjwlfw.yeshenghuo.service.business.BusinessManageService;
import cn.xjwlfw.yeshenghuo.service.business.functionManage.WechatService;
import cn.xjwlfw.yeshenghuo.system.util.Sha1Util;

@Controller
public class WechatController {

	Logger logger = Logger.getLogger(WechatController.class);

	@Autowired
	private WechatService wechatService;
	
	@Autowired
	private BusinessQrcodeService businessQrcodeService;
	
	@Autowired
	private BusinessManageService businessManageService;
	
	private static String TOKEN = "weixin";

	@ResponseBody
	@RequestMapping(value = "/testWeiXin.do")
	public String aaa(HttpServletRequest request) {
		String accessToken = wechatService.getAccessToken();
		String ticket = wechatService.createTicket(accessToken, "11");
		return "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + ticket;
	}

	@ResponseBody
	@RequestMapping(value = "/getReturnValue.do", produces = {"application/json;charset=UTF-8"})
	public String getReturnValue(HttpServletRequest request) {
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		Map<String, Object> maps = new HashMap<>();
		maps.put(timestamp, timestamp);
		maps.put(nonce, nonce);
		maps.put(TOKEN, TOKEN);
		String secreat = "";
		try {
			secreat = Sha1Util.SHA1(maps);
		} catch (DigestException e) {
			logger.error(e.getMessage(), e);
		}
		if (!secreat.equals(signature.toUpperCase())) {
			return "";
		}

		try {
			return setUserInfo(request.getInputStream());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return request.getParameter("echostr");
//		return getReplyString("111", "111", 1);
	}

	private String getReplyString(String user, String official, int businessId) {
		Business business = businessManageService.queryBusinessById(businessId);
		StringBuffer sb = new StringBuffer();
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[").append(user).append("]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[").append(official).append("]]></FromUserName>");
		sb.append("<CreateTime>").append(new Date().getTime()).append("</CreateTime>");
		sb.append("<MsgType><![CDATA[").append("news").append("]]></MsgType>");
		sb.append("<ArticleCount>1</ArticleCount>");
		sb.append("<Articles>");
		sb.append("<item>");
		sb.append("<Title><![CDATA[").append("欢迎光临“" + business.getName() + "”，点击开始互动").append("]]></Title>");
		sb.append("<Description><![CDATA[").append("祝客观玩得尽兴，在互动功能中被搭讪，此公众号将发送消息通知到您。").append("]]></Description>");
		sb.append("<PicUrl><![CDATA[").append("http://www.yechengxu.cn/yeshenghuo/resource/img/wechatOffical.jpg").append("]]></PicUrl>");
//		sb.append("<Url><![CDATA[").append("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb4718a4eac30e9cc&redirect_uri=http%3A%2F%2Fwww.yechengxu.cn%2Fcustomer%2Fweishangqiang%2FweixinIndex%3FbusinessId%3D" + userMap.get("businessId") + "&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect").append("]]></Url>");
		sb.append("<Url><![CDATA[").append("www.yechengxu.cn/customer/weishangqiang/weixinIndex?businessId=").append(businessId).append("&openId=").append(user).append("]]></Url>");
		sb.append("</item>");
		sb.append("</Articles>");
		sb.append("</xml>");
		return sb.toString();
	}

	private String setUserInfo(ServletInputStream inputStream) throws Exception {
		SAXReader saxReader = null;
		Document doc = null;

		saxReader = new SAXReader();
		doc = saxReader.read(inputStream);

		if (doc == null || doc.asXML().trim().isEmpty()) {
			return null;
		}
		Element root = doc.getRootElement();
		Map<String, String> subscribeMap = new HashMap<>();
		for (Iterator i = root.elementIterator(); i.hasNext();) {
			Element node = (Element) i.next();
			subscribeMap.put(node.getName(), node.getText());
		}
		String sceneId = "";
		if (subscribeMap.get("Event").equals("subscribe")) {
			sceneId = subscribeMap.get("EventKey").substring(8);
		} else if (subscribeMap.get("Event").equals("unsubscribe")) {
			return "";
		} else {
			sceneId = subscribeMap.get("EventKey");
		}
		BusinessQrcode bq = businessQrcodeService.queryBySceneId(sceneId);
		wechatService.saveOrUpdateWechatUser(subscribeMap.get("FromUserName"), subscribeMap.get("Event"), bq.getBusinessId());
		return getReplyString(subscribeMap.get("FromUserName"), subscribeMap.get("ToUserName"), bq.getBusinessId());
	}

	@ResponseBody
	@RequestMapping(value = "/getEventPush.do")
	public String getEventPush(HttpServletRequest request) {
		logger.info("getEventPush : " + new Date());
		try {
			InputStream inputStream = request.getInputStream();
			SAXReader reader = new SAXReader();
			Document document = reader.read(inputStream);
			Element root = document.getRootElement();
			logger.info("root" + root.getText());
			return root.getText();
		} catch (IOException | DocumentException e) {
			logger.error(e.getMessage(), e);
		}
		return "";
	}
}
