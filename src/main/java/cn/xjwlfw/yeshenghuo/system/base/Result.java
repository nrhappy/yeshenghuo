package cn.xjwlfw.yeshenghuo.system.base;

import java.io.Serializable;
import java.util.Map;

import cn.xjwlfw.yeshenghuo.system.util.DateUtil;

public class Result implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 数据
	 */
	Map<String, Object> data;
	
	/**
	 * 代码
	 */
	int code;
	
	/**
	 * 消息
	 */
	String message;
	
	/**
	 * 时间戳
	 */
	String timestamp;
	
	public static Result success(){
		Result result = new Result();
		result.setCode(0);
		return result;
	}
	
	public static Result success(Map<String, Object> obj){
		Result result = new Result();
		result.setCode(0);
		result.setData(obj);
		return result;
	}

	public Result() {
		
	}

	public Result(int code) {
		this.code = code;
		this.timestamp = DateUtil.getCurrentTime();
	}

	public Result(int code, String message) {
		this.code = code;
		this.message = message;
		this.timestamp = DateUtil.getCurrentTime();
	}

	public Result(int code, Map<String, Object> data) {
		this.code = code;
		this.data = data;
		this.timestamp = DateUtil.getCurrentTime();
	}

	public Result(int code, String message, Map<String, Object> data) {
		this.code = code;
		this.message = message;
		this.data = data;
		this.timestamp = DateUtil.getCurrentTime();
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
}
