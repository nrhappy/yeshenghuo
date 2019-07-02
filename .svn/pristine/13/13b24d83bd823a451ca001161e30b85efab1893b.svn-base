var result = null;

function setResultTrue() {
	result = true;
}

function setResultFalse() {
	result = false;
}

function wcPay(appId, timeStamp, nonceStr, prepay_id, paySign) {
	var result = "test";
	WeixinJSBridge.invoke('getBrandWCPayRequest', {
		"appId" : appId, // 公众号名称，由商户传入
		"timeStamp" : timeStamp, // 时间戳，自1970年以来的秒数
		"nonceStr" : nonceStr, // 随机串
		"package" : prepay_id,
		"signType" : "MD5", // 微信签名方式：
		"paySign" : paySign
	// 微信签名
	}, function(res) {
		if (res.err_msg == "get_brand_wcpay_request:ok") {
			setResultTrue();
		} else {
			setResultFalse();
		}
	});
	return result;
}