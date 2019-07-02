package cn.xjwlfw.yeshenghuo.system.util.WcPay;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.jdom.JDOMException;

public class WcPay {

	/**
	 * 统一下单API
	 * 
	 * @param openid
	 * @param out_trade_no
	 *            订单号
	 * @param total_fee
	 *            订单金额
	 * @param body
	 *            商品描述
	 */
	public static Map<String, Object> orderInfo(String openid, String out_trade_no, String total_fee, String body, HttpServletRequest request) {
		SortedMap<Object, Object> parameters = new TreeMap<Object, Object>();
		parameters.put("appid", ConfigUtil.APPID);
		parameters.put("mch_id", ConfigUtil.MCH_ID);
		parameters.put("nonce_str", PayCommonUtil.CreateNoncestr());
		parameters.put("body", body);
		parameters.put("out_trade_no", out_trade_no);
		parameters.put("total_fee", total_fee);
		parameters.put("spbill_create_ip", PayCommonUtil.getIPAddr(request));
		parameters.put("notify_url", ConfigUtil.NOTIFY_URL);
		parameters.put("trade_type", "JSAPI");
		parameters.put("openid", openid);
		String sign = PayCommonUtil.createSign("UTF-8", parameters);
		parameters.put("sign", sign);
		String requestXML = PayCommonUtil.getRequestXml(parameters);
		String result = CommonUtil.httpsRequest(ConfigUtil.UNIFIED_ORDER_URL, "POST", requestXML);
		Map<String, String> map = new HashMap<>();
		try {
			map = XMLUtil.doXMLParse(result);
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		SortedMap<Object, Object> params = new TreeMap<Object, Object>();
		params.put("appId", ConfigUtil.APPID);
		params.put("timeStamp", String.valueOf((new Date().getTime()) / 1000));
		params.put("nonceStr", PayCommonUtil.CreateNoncestr());
		params.put("package", "prepay_id=" + map.get("prepay_id"));
		params.put("signType", ConfigUtil.SIGN_TYPE);
		String paySign = PayCommonUtil.createSign("UTF-8", params);
		params.put("paySign", paySign);
		
		Map<String, Object> orderInfo = new HashMap<String, Object>();
		orderInfo.put("appId", params.get("appId"));
		orderInfo.put("timeStamp", params.get("timeStamp"));
		orderInfo.put("nonceStr", params.get("nonceStr"));
		orderInfo.put("prepay_id", params.get("package"));
		orderInfo.put("paySign", params.get("paySign"));

		return orderInfo;
	}
}
